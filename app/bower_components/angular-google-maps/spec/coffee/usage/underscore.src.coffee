#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.differenceObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash
      
  describe "Comparing Arrays of Objects", ->
    describe "difference", ->
      describe "0 length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.difference(@objArray, @objArray)
          expect(interArray.length).toEqual(0)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.difference(@objArray, difArray)
          expect(interArray.length).toEqual(3)

    describe "subject.differenceObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.differenceObjects @objArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(1)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(3)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.differenceObjects difArray, @objArray
          expect(interArray.length).toEqual(0)
      describe "removal", ->
        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.withoutObjects @objArray, difArray
          expect(interArray.length).toEqual(2)
describe "uiGmapLodash.indexOfObject", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 5
      b: 3
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  it "finds first element", ->
    i = subject.indexOfObject(@objArray, {a: 1, b: 1})
    expect(i).toEqual(0)

  it "finds element beginning", ->
    i = subject.indexOfObject(@objArray, {a: 2, b: 2})
    expect(i).toEqual(1)
  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 5, b: 3})
    expect(i).toEqual(2)

  it "finds last element", ->
    i = subject.indexOfObject(@objArray, {a: 3, b: 3})
    expect(i).toEqual(3)

  it "find no element", ->
    i = subject.indexOfObject(@objArray, {a: 4, b: 3})
    expect(i).toEqual(-1)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "uiGmapLodash.intersectionObjects", ->
  subject = null
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]
    module 'uiGmapgoogle-maps.extensions'
    inject (uiGmapLodash) =>
      subject = uiGmapLodash

  describe "Comparing Arrays of Objects", ->
    describe "intersection", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = _.intersection(@objArray, @objArray)
          expect(interArray.length).toEqual(@objArray.length)

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          index = @objArray.indexOf {a: 1, b: 1}
          expect(index).toBe(-1)
          interArray = _.intersection(@objArray, difArray)
          expect(interArray.length).toEqual(0)

    describe "subject.intersectionObjects - extension", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          interArray = subject.intersectionObjects @objArray, @objArray
          expect(interArray.length).toEqual(@objArray.length)
        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          diffArray = @objArray
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(@objArray.length)
      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(0)

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          interArray = subject.intersectionObjects @objArray, difArray
          expect(interArray.length).toEqual(1)
          expect(interArray.length).not.toEqual(@objArray.length)

#SPEC set is to make sure Underscore is being understood and used correctly
describe "_.isEqual", ->
  beforeEach ->
    @objArray = [
      a: 1
      b: 1
    ,
      a: 2
      b: 2
    ,
      a: 3
      b: 3
    ]

  describe "Comparing Arrays of Objects", ->
    describe "isEqual", ->
      describe "same length", ->
        it "when two arrays are identical - same reference", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy

        it "diff reference, same values", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy

        it "diff reference one added (new), same values (intersected)", ->
          difArray = [
            a: 1
            b: 1
          ,
            a: 2
            b: 2
          ,
            a: 3
            b: 3
          ,
            a: 4
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

      describe "different length - not identical", ->
        it "diff reference, diff values", ->
          difArray = [
            a: 1
            b: 2
          ,
            a: 2
            b: 3
          ,
            a: 3
            b: 4
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy

        it "diff reference, 1 val identical", ->
          difArray = [
            a: 1
            b: 1
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy
      describe "array of nested objects", ->
        beforeEach ->
          @objArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
        it "same - reference should be equal", ->
          expect(_.isEqual(@objArray, @objArray)).toBeTruthy
        it "same - dif reference same values should be ==", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeTruthy
        it "dif reference diff values should be !=", ->
          difArray = [
            a: 1
            b:
              n: 1
              m: 2
              o: "hi!"
          ,
            a: 2
            b:
              n: 4
              m: 5
              o: "hi!!"
          ,
            a:
              n: 2
              m: 3
              o: "hi!"
            b: 3
          ]
          expect(_.isEqual(@objArray, difArray)).toBeFalsy