angular.module('uiGmapgoogle-maps.directives.api.utils').service('uiGmap_sync', [
  function() {
    return {
      fakePromise: function() {
        var _cb;
        _cb = void 0;
        return {
          then: function(cb) {
            return _cb = cb;
          },
          resolve: function() {
            return _cb.apply(void 0, arguments);
          }
        };
      }
    };
  }
]).service('uiGmap_async', [
  '$timeout', 'uiGmapPromise', 'uiGmapLogger', '$q', 'uiGmapDataStructures', 'uiGmapGmapUtil', function($timeout, uiGmapPromise, $log, $q, uiGmapDataStructures, uiGmapGmapUtil) {
    var ExposedPromise, PromiseQueueManager, SniffedPromise, defaultChunkSize, doChunk, doSkippPromise, each, errorObject, isInProgress, kickPromise, logTryCatch, managePromiseQueue, map, maybeCancelPromises, promiseStatus, promiseTypes, tryCatch;
    promiseTypes = uiGmapPromise.promiseTypes;
    isInProgress = uiGmapPromise.isInProgress;
    promiseStatus = uiGmapPromise.promiseStatus;
    ExposedPromise = uiGmapPromise.ExposedPromise;
    SniffedPromise = uiGmapPromise.SniffedPromise;
    kickPromise = function(sniffedPromise, cancelCb) {
      var promise;
      promise = sniffedPromise.promise();
      promise.promiseType = sniffedPromise.promiseType;
      if (promise.$$state) {
        $log.debug("promiseType: " + promise.promiseType + ", state: " + (promiseStatus(promise.$$state.status)));
      }
      promise.cancelCb = cancelCb;
      return promise;
    };
    doSkippPromise = function(sniffedPromise, lastPromise) {
      if (sniffedPromise.promiseType === promiseTypes.create && lastPromise.promiseType !== promiseTypes["delete"] && lastPromise.promiseType !== promiseTypes.init) {
        $log.debug("lastPromise.promiseType " + lastPromise.promiseType + ", newPromiseType: " + sniffedPromise.promiseType + ", SKIPPED MUST COME AFTER DELETE ONLY");
        return true;
      }
      return false;
    };
    maybeCancelPromises = function(queue, sniffedPromise, lastPromise) {
      var first;
      if (sniffedPromise.promiseType === promiseTypes["delete"] && lastPromise.promiseType !== promiseTypes["delete"]) {
        if ((lastPromise.cancelCb != null) && _.isFunction(lastPromise.cancelCb) && isInProgress(lastPromise)) {
          $log.debug("promiseType: " + sniffedPromise.promiseType + ", CANCELING LAST PROMISE type: " + lastPromise.promiseType);
          lastPromise.cancelCb('cancel safe');
          first = queue.peek();
          if ((first != null) && isInProgress(first)) {
            if (first.hasOwnProperty("cancelCb") && _.isFunction(first.cancelCb)) {
              $log.debug("promiseType: " + first.promiseType + ", CANCELING FIRST PROMISE type: " + first.promiseType);
              return first.cancelCb('cancel safe');
            } else {
              return $log.warn('first promise was not cancelable');
            }
          }
        }
      }
    };

    /*
    From a High Level:
      This is a SniffedPromiseQueueManager (looking to rename) where the queue is existingPiecesObj.existingPieces.
      This is a function and should not be considered a class.
      So it is run to manage the state (cancel, skip, link) as needed.
    Purpose:
    The whole point is to check if there is existing async work going on. If so we wait on it.
    
    arguments:
    - existingPiecesObj =  Queue<Promises>
    - sniffedPromise = object wrapper holding a function to a pending (function) promise (promise: fnPromise)
    with its intended type.
    - cancelCb = callback which accepts a string, this string is intended to be returned at the end of _async.each iterator
    
      Where the cancelCb passed msg is 'cancel safe' _async.each will drop out and fall through. Thus canceling the promise
      gracefully without messing up state.
    
    Synopsis:
    
     - Promises have been broken down to 4 states create, update,delete (3 main) and init. (Helps boil down problems in ordering)
      where (init) is special to indicate that it is one of the first or to allow a create promise to work beyond being after a delete
    
     - Every Promise that comes is is enqueue and linked to the last promise in the queue.
    
     - A promise can be skipped or canceled to save cycles.
    
    Saved Cycles:
      - Skipped - This will only happen if async work comes in out of order. Where a pending create promise (un-executed) comes in
        after a delete promise.
      - Canceled - Where an incoming promise (un-executed promise) is of type delete and the any lastPromise is not a delete type.
    
    
    NOTE:
    - You should not muck with existingPieces as its state is dependent on this functional loop.
    - PromiseQueueManager should not be thought of as a class that has a life expectancy (it has none). It's sole
    purpose is to link, skip, and kill promises. It also manages the promise queue existingPieces.
     */
    PromiseQueueManager = function(existingPiecesObj, sniffedPromise, cancelCb) {
      var lastPromise, newPromise;
      if (!existingPiecesObj.existingPieces) {
        existingPiecesObj.existingPieces = new uiGmapDataStructures.Queue();
        return existingPiecesObj.existingPieces.enqueue(kickPromise(sniffedPromise, cancelCb));
      } else {
        lastPromise = _.last(existingPiecesObj.existingPieces._content);
        if (doSkippPromise(sniffedPromise, lastPromise)) {
          return;
        }
        maybeCancelPromises(existingPiecesObj.existingPieces, sniffedPromise, lastPromise);
        newPromise = ExposedPromise(lastPromise["finally"](function() {
          return kickPromise(sniffedPromise, cancelCb);
        }));
        newPromise.cancelCb = cancelCb;
        newPromise.promiseType = sniffedPromise.promiseType;
        existingPiecesObj.existingPieces.enqueue(newPromise);
        return lastPromise["finally"](function() {
          return existingPiecesObj.existingPieces.dequeue();
        });
      }
    };
    managePromiseQueue = function(objectToLock, promiseType, msg, cancelCb, fnPromise) {
      var cancelLogger;
      if (msg == null) {
        msg = '';
      }
      cancelLogger = function(msg) {
        $log.debug("" + msg + ": " + msg);
        return cancelCb(msg);
      };
      return PromiseQueueManager(objectToLock, SniffedPromise(fnPromise, promiseType), cancelLogger);
    };
    defaultChunkSize = 80;
    errorObject = {
      value: null
    };
    tryCatch = function(fn, ctx, args) {
      var e;
      try {
        return fn.apply(ctx, args);
      } catch (_error) {
        e = _error;
        errorObject.value = e;
        return errorObject;
      }
    };
    logTryCatch = function(fn, ctx, deferred, args) {
      var msg, result;
      result = tryCatch(fn, ctx, args);
      if (result === errorObject) {
        msg = "error within chunking iterator: " + errorObject.value;
        $log.error(msg);
        deferred.reject(msg);
      }
      if (result === 'cancel safe') {
        return false;
      }
      return true;
    };

    /*
      Author: Nicholas McCready & jfriend00
      _async handles things asynchronous-like :), to allow the UI to be free'd to do other things
      Code taken from http://stackoverflow.com/questions/10344498/best-way-to-iterate-over-an-array-without-blocking-the-ui
    
      The design of any functionality of _async is to be like lodash/underscore and replicate it but call things
      asynchronously underneath. Each should be sufficient for most things to be derived from.
    
      Optional Asynchronous Chunking via promises.
     */
    doChunk = function(array, chunkSizeOrDontChunk, pauseMilli, chunkCb, pauseCb, overallD, index) {
      var cnt, i, keepGoing;
      if (chunkSizeOrDontChunk && chunkSizeOrDontChunk < array.length) {
        cnt = chunkSizeOrDontChunk;
      } else {
        cnt = array.length;
      }
      i = index;
      keepGoing = true;
      while (keepGoing && cnt-- && i < (array ? array.length : i + 1)) {
        keepGoing = logTryCatch(chunkCb, void 0, overallD, [array[i], i]);
        ++i;
      }
      if (array) {
        if (keepGoing && i < array.length) {
          index = i;
          if (chunkSizeOrDontChunk) {
            if ((pauseCb != null) && _.isFunction(pauseCb)) {
              logTryCatch(pauseCb, void 0, overallD, []);
            }
            return $timeout(function() {
              return doChunk(array, chunkSizeOrDontChunk, pauseMilli, chunkCb, pauseCb, overallD, index);
            }, pauseMilli, false);
          }
        } else {
          return overallD.resolve();
        }
      }
    };
    each = function(array, chunk, chunkSizeOrDontChunk, pauseCb, index, pauseMilli) {
      var error, overallD, ret;
      if (chunkSizeOrDontChunk == null) {
        chunkSizeOrDontChunk = defaultChunkSize;
      }
      if (index == null) {
        index = 0;
      }
      if (pauseMilli == null) {
        pauseMilli = 1;
      }
      ret = void 0;
      overallD = uiGmapPromise.defer();
      ret = overallD.promise;
      if (!pauseMilli) {
        error = 'pause (delay) must be set from _async!';
        $log.error(error);
        overallD.reject(error);
        return ret;
      }
      if (array === void 0 || (array != null ? array.length : void 0) <= 0) {
        overallD.resolve();
        return ret;
      }
      doChunk(array, chunkSizeOrDontChunk, pauseMilli, chunk, pauseCb, overallD, index);
      return ret;
    };
    map = function(objs, iterator, chunkSizeOrDontChunk, pauseCb, index, pauseMilli) {
      var results;
      results = [];
      if (!((objs != null) && (objs != null ? objs.length : void 0) > 0)) {
        return uiGmapPromise.resolve(results);
      }
      return each(objs, function(o) {
        return results.push(iterator(o));
      }, chunkSizeOrDontChunk, pauseCb, index, pauseMilli).then(function() {
        return results;
      });
    };
    return {
      each: each,
      map: map,
      managePromiseQueue: managePromiseQueue,
      promiseLock: managePromiseQueue,
      defaultChunkSize: defaultChunkSize,
      chunkSizeFrom: function(fromSize) {
        var ret;
        ret = void 0;
        if (_.isNumber(fromSize)) {
          ret = fromSize;
        }
        if (uiGmapGmapUtil.isFalse(fromSize) || fromSize === false) {
          ret = false;
        }
        return ret;
      }
    };
  }
]);

//# sourceMappingURL=_async.js.map
