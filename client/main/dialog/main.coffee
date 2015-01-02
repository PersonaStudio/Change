define [
  'Phaser'
  'Promise'
], (
  Phaser
  Promise
) ->

  class Dialog
    constructor: ->
      @_currentScript = null
      @enableDialog = null

      @_script =
        'old men': [
          {
            name:'old men'
            msg: 'how are you?'
          }
          {
            name: 'hero'
            msg: "I'm fine, and you ?"
          }
          {
            name:'old men'
            msg: "Welcome to my shop."
          }
        ]

    executingScript: ->
      #TODO: render dialog
      displayDialog = @_currentScript.shift()
      console.log displayDialog
      if not displayDialog
        @enableDialog = false

    startConversation: (character) ->
      @enableDialog = true
      @_currentScript = @_script[character].slice 0
      @executingScript()

    goUp: ->
      return

    goDown: ->
      return

    goLeft: ->
      return

    goRight: ->
      return

    select: ->
      @executingScript()



  new Dialog()