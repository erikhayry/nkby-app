describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

describe('Events Mock', function() {
  var subject;
  subject = null;
  afterEach(function() {
    return google.maps.event.clearListeners();
  });
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('exists', function() {
    return expect(window.google.maps.event).toBeDefined();
  });
  return describe('flatten', function() {
    it('can add a few events and they all are flattened', function() {
      var actualEvents, expectedEvents, obj;
      obj = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
    return it('two individul object listeners', function() {
      var actualEvents, expectedEvents, expectedEvents2, obj, obj2;
      obj = {};
      obj2 = {};
      expectedEvents = ['click', 'mouseover', 'mousedown'];
      expectedEvents2 = ['lol', 'crap', 'ROFL'];
      expectedEvents.forEach(function(e) {
        return google.maps.event.addListener(obj, e, function() {});
      });
      expectedEvents2.forEach(function(e) {
        return google.maps.event.addListener(obj2, e, function() {});
      });
      actualEvents = window.google.maps.event.normalizedEvents();
      return expectedEvents.concat(expectedEvents2).forEach(function(e) {
        return expect(actualEvents).toContain(e);
      });
    });
  });
});

describe('Polyline Mock', function() {
  var subject;
  subject = null;
  beforeEach(function() {
    module("uiGmapgoogle-maps.mocks");
    return inject(function(GoogleApiMock) {
      var apiMock;
      apiMock = new GoogleApiMock();
      subject = apiMock.getPolyline();
      return subject.resetInstances();
    });
  });
  it('constructor exists', function() {
    return expect(subject).toBeDefined();
  });
  return it('can create exists', function() {
    var poly;
    poly = new subject();
    expect(poly).toBeDefined();
    return expect(subject.instances).toBe(1);
  });
});

//# sourceMappingURL=helper.js.map
