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
          [
            {
              name:'old men'
              msg: 'how are you?'
              type: 'normal'
            }
            {
              name: 'hero'
              msg: "I'm fine, and you ?"
              type: 'normal'
            }
            {
              name:'old men'
              msg: "Welcome to my shop."
              type: 'normal'
            }
            {
              type: 'select'
              options: [
                'Go left'
                'Go right'
              ]
              title: 'Where do you go?'
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
      displayDialog = @_currentScript.shift()
      if not displayDialog
        @enableDialog = false
        @game.world.remove @containBox
        TextRender.remove @game
      else
        TextRender.render @game, displayDialog, @containBox

    startConversation: (character) ->
      @enableDialog = true
      @_currentScript = @_script[character].slice()
      @createDialog @game.camera.view.x, @game.camera.view.y
      @executingScript()

    goUp: ->
      TextRender.goUp()
      return

    goDown: ->
      TextRender.goDown()
      return

    goLeft: ->
      return

    goRight: ->
      return

    select: ->
      result = TextRender.executeScript()
      if result
        @executingScript()



  new Dialog()