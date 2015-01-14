define [
  'Phaser'
  './text/main'
  'Promise'
], (
  Phaser
  TextRender
  Promise
) ->

  class Dialog
    constructor: ->
      @_currentScript = null
      @enableDialog = null
      @containBox = null
      @game = null
      @dialogPosition = null

      @_script =
        'old men':
          type: 'normal'
          msg: [
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

    setGameObject: (game) ->
      @game = game
      @containBox = new Phaser.Graphics @game
      @containBox.beginFill 0x000000, 0.5
      @containBox.drawRect 0, 0, 600, 100
      @containBox.endFill();
      return

    createDialog: (x, y) ->
      @game.add.existing @containBox
      @containBox.x = x
      @containBox.y = y

    executingScript: ->
      result = TextRender.executeScript()
      if result
        displayDialog = @_currentScript.shift()

        if not displayDialog
          @enableDialog = false
          @game.world.remove @containBox
          TextRender.remove()
        else
          TextRender.render @game, displayDialog, @containBox

    startConversation: (character) ->
      @enableDialog = true
      @_currentScript = @_script[character]
      console.log @_currentScript
      @createDialog @game.camera.view.x, @game.camera.view.y
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