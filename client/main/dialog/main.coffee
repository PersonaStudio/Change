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
      @containBox = null
      @game = null
      @dialogPosition = null

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

    setGameObject: (game) ->
      @game = game
      @containBox = new Phaser.Graphics game
      @containBox.beginFill 0x000000, 0.5
      @containBox.drawRect 0, 0, 600, 100
      @containBox.endFill();
      return

    createDialogBox: (x, y) ->
      @game.add.existing @containBox
      @containBox.x = x
      @containBox.y = y
      x: x
      y: y

    executingScript: ->
      displayDialog = @_currentScript.shift()
      console.log displayDialog
      if not displayDialog
        @enableDialog = false
        @game.world.remove @containBox

    startConversation: (character) ->
      @enableDialog = true
      @_currentScript = @_script[character].slice 0
      @dialogPosition = @createDialogBox @game.camera.view.x, @game.camera.view.y
#      @game.add.existing @containBox
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