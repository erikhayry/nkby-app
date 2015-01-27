describe("_async", function() {
  var digest, q, rootScope, timeout;
  rootScope = null;
  timeout = null;
  q = null;
  digest = (function(_this) {
    return function(fn, times) {
      if (times == null) {
        times = 1;
      }
      fn();
      if (times) {
        _.range(times).forEach(function() {
          return timeout != null ? timeout.flush() : void 0;
        });
      }
      return rootScope != null ? rootScope.$apply() : void 0;
    };
  })(this);
  beforeEach(function() {
    module("uiGmapgoogle-maps");
    return inject((function(_this) {
      return function(_$rootScope_, $timeout, uiGmap_async, $q) {
        q = $q;
        rootScope = _$rootScope_;
        timeout = $timeout;
        return _this.subject = uiGmap_async;
      };
    })(this));
  });
  afterEach(function() {
    rootScope = null;
    return this.subject = null;
  });
  it("handle array of 101 outputs 101 elements equal to the original, with 1 pauses", function(done) {
    return digest((function(_this) {
      return function() {
        var known, pauses, test;
        known = _.range(101);
        test = [];
        pauses = 1;
        return _this.subject.each(known, function(num) {
          return test.push(num);
        }, 100, function() {
          return pauses++;
        }).then(function() {
          expect(pauses).toEqual(2);
          expect(test.length).toEqual(known.length);
          expect(test).toEqual(known);
          return done();
        });
      };
    })(this));
  });
  it("handle callback passes an index", function(done) {
    return digest((function(_this) {
      return function() {
        var chunkHit;
        chunkHit = false;
        return _this.subject.each([1], function(thing, index) {
          chunkHit = true;
          expect(thing).toEqual(1);
          return expect(index).toEqual(0);
        }).then(function() {
          expect(chunkHit).toBeTruthy();
          return done();
        });
      };
    })(this));
  });
  it("handle array of 200 outputs 200 elements equal to the original, with 2 pauses", function(done) {
    return digest((function(_this) {
      return function() {
        var known, pauses, test;
        known = _.range(200);
        test = [];
        pauses = 1;
        return _this.subject.each(known, function(num) {
          return test.push(num);
        }, 100, function() {
          return pauses++;
        }).then(function() {
          expect(pauses).toEqual(2);
          expect(test.length).toEqual(known.length);
          expect(test).toEqual(known);
          return done();
        });
      };
    })(this));
  });
  it("handle array of 1000 outputs 1000 elements equal to the original, with 10 pauses", function(done) {
    return digest((function(_this) {
      return function() {
        var known, pauses, test;
        known = _.range(1000);
        test = [];
        pauses = 1;
        return _this.subject.each(known, function(num) {
          return test.push(num);
        }, 100, function() {
          return pauses++;
        }).then(function() {
          expect(test.length).toEqual(known.length);
          expect(test).toEqual(known);
          expect(pauses).toEqual(10);
          return done();
        });
      };
    })(this), 10);
  });
  it("handle map of 1000 outputs 1000 elements equal to the original, with 10 pauses", function(done) {
    return digest((function(_this) {
      return function() {
        var known, pauses, test;
        known = _.range(1000);
        test = [];
        pauses = 1;
        return _this.subject.map(known, function(num) {
          num += 1;
          return "$" + (num.toString());
        }, 100, function() {
          return pauses++;
        }).then(function(mapped) {
          test = mapped;
          expect(test[999]).toEqual("$1000");
          expect(test.length).toEqual(known.length);
          expect(test).toEqual(_.map(known, function(n) {
            n += 1;
            return "$" + (n.toString());
          }));
          expect(pauses).toEqual(10);
          return done();
        });
      };
    })(this), 10);
  });
  describe("no chunking / pauses", function() {
    return it("rang 101 zero pauses", function(done) {
      return digest((function(_this) {
        return function() {
          var chunking, known, pauses, test;
          known = _.range(101);
          test = [];
          pauses = 0;
          return _this.subject.each(known, function(num) {
            return test.push(num);
          }, chunking = false, function() {
            return pauses++;
          }).then(function() {
            expect(pauses).toEqual(0);
            expect(test.length).toEqual(known.length);
            expect(test).toEqual(known);
            return done();
          });
        };
      })(this));
    });
  });
  return describe('chunkSizeFrom', function() {
    it('undefined returns undefined', function() {
      expect(this.subject.chunkSizeFrom(void 0)).toBeFalsy();
      return expect(this.subject.chunkSizeFrom(void 0) === void 0).toBeTruthy();
    });
    it('false returns false', function() {
      expect(this.subject.chunkSizeFrom(false)).toBeFalsy();
      return expect(this.subject.chunkSizeFrom(false) === false).toBeTruthy();
    });
    it('NO returns false', function() {
      expect(this.subject.chunkSizeFrom('NO')).toBeFalsy();
      return expect(this.subject.chunkSizeFrom('NO') === false).toBeTruthy();
    });
    it('FALSE returns false', function() {
      expect(this.subject.chunkSizeFrom('FALSE')).toBeFalsy();
      return expect(this.subject.chunkSizeFrom('FALSE') === false).toBeTruthy();
    });
    it('number returns number', function() {
      return expect(this.subject.chunkSizeFrom(300)).toBe(300);
    });
    it('string number returns undefined', function() {
      return expect(this.subject.chunkSizeFrom('300')).toBeUndefined();
    });
    return it('non number returns undefined', function() {
      return expect(this.subject.chunkSizeFrom('3-00')).toBeUndefined();
    });
  });
});

//# sourceMappingURL=_async.js.map
