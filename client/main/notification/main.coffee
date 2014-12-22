define [
  'Phaser'

], (Phaser) ->

  class Notification
    constructor: ->
      @_pool = []
      @currentMsg = null
      @startTime = null
      @timeLength = 2000

    addToPool: (msg) ->
      @_pool.unshift msg
      return

    extractPool: ->
      @_pool.pop()

    displayMsg: ->
      @currentMsg = @extractPool()
      console.log @currentMsg
      new Date()


    updateItem: (item) ->
      msg = 'Acquired ' + item.value + ' ' + item.name
      @addToPool msg

    updatePlace: (place) ->
      msg = place
      @addToPool msg

    update: ->
      ## this function will be call by Stage.update()
      if @currentMsg
        currentTime = new Date()
        elapsedTime = currentTime - @startTime
        if elapsedTime >= @timeLength
          ## remove display message
          @currentMsg = null

      if not @currentMsg and @_pool.length
        @startTime = @displayMsg()


  new Notification()


