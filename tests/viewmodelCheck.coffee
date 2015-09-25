describe "ViewModel", ->

  describe "@check", ->
    beforeEach ->
      @sandbox = sinon.sandbox.create()
      Package['manuel:viewmodel-debug'] =
        VmCheck: ->
      @vmCheckStub = @sandbox.stub Package['manuel:viewmodel-debug'], "VmCheck"

    afterEach ->
      @sandbox.restore()

    it "doesn't check if ignoreErrors is true", ->
      ViewModel.ignoreErrors = true
      ViewModel.check()
      ViewModel.ignoreErrors = false
      assert.isFalse @vmCheckStub.called

    it "calls VmCheck with parameters", ->
      ViewModel.check 1, 2, 3
      assert.isTrue @vmCheckStub.calledWithExactly 1, 2, 3

    it "returns undefined", ->
      assert.isUndefined ViewModel.check()

#describe "ViewModel2 Static", ->
#  it "should have bindings object", (t) ->
#    t.isTrue _.isObject(ViewModel2.bindings)
#  it "should not ignoreErrors", (t) ->
#    t.isUndefined ViewModel2.ignoreErrors
#
##  context "onCreated", ->
##    it "should check the arguments", (t) ->
##      used = null
##      template = { onCreated: -> }
##      ViewModel2.check = (args...) -> used = args
##      ViewModel2.addOnCreated template, "B"
##      t.equal used.length, 3
##      t.equal used[0], "@@addOnCreated"
##      t.equal used[1], template
##      t.equal used[2], "B"
#
##    values = {}
##    cache = ->
##      values['check'] = ViewModel2.check
##      ViewModel2.check = ->
##    restore = ->
##      ViewModel2.check = values['check']
##
#
##
##    it "should not return anything", (t) ->
##      cache()
##      template = { onCreated: -> }
##
##      ret = ViewModel2.addOnCreated template, "B"
##      restore()
##      t.isUndefined ret
##
##    it "should add a viewmodel to the template instance", (t) ->
##      cache()
##      templateInstance = {}
##      template =
##        onCreated: (f) ->
##          f.call templateInstance
##        createViewModel: -> {}
##
##      ret = ViewModel2.addOnCreated template, "B"
##      restore()
##      t.isUndefined ret
#
#  context "addBinding", ->
#    it "should check the arguments", (t) ->
#      cache = ViewModel2.check
#      used = null
#      ViewModel2.check = (args...) -> used = args
#      ViewModel2.addBinding "X"
#      ViewModel2.check = cache
#      t.equal used.length, 2
#      t.equal used[0], "@@addBinding"
#      t.equal used[1], "X"
#
#    it "should not return anything", (t) ->
#      cache = ViewModel2.check
#      ViewModel2.check = ->
#      ret = ViewModel2.addBinding "X"
#      ViewModel2.check = cache
#      t.isUndefined ret
#
#  context "check", ->
#    it "should not check with ignoreErrors true", (t) ->
#      ignoreErrorsCache = ViewModel2.ignoreErrors
#      debugCache = Package['manuel:viewmodel-debug']
#      used = false
#      ViewModel2.ignoreErrors = true
#      Package['manuel:viewmodel-debug'] =
#        VmCheck: -> used = true
#      ViewModel2.check "A", "B"
#      Package['manuel:viewmodel-debug'] = debugCache
#      ViewModel2.ignoreErrors = ignoreErrorsCache
#      t.isFalse used
#
#    it "should check by default", (t) ->
#      debugCache = Package['manuel:viewmodel-debug']
#      used = false
#      Package['manuel:viewmodel-debug'] =
#        VmCheck: -> used = true
#      ViewModel2.check "A", "B"
#      Package['manuel:viewmodel-debug'] = debugCache
#      t.isTrue used
#
#    it "should return undefined", (t) ->
#      ignoreErrorsCache = ViewModel2.ignoreErrors
#      ViewModel2.ignoreErrors = true
#      ret = ViewModel2.check()
#      ViewModel2.ignoreErrors = ignoreErrorsCache
#      t.isUndefined ret