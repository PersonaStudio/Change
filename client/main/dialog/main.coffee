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
      @text = null
      @fullText = ''
      @displayText = ''
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
      @containBox = new Phaser.Graphics @game
      @containBox.beginFill 0x000000, 0.5
      @containBox.drawRect 0, 0, 600, 100
      @containBox.endFill();

      @text = new Phaser.Text @game
      @text.setStyle 
        font: 'bold 20pt Arial' 
        fill: 'white'
        align: 'left'
        wordWrap: true


      return

    createDialog: (x, y) ->
      @game.add.existing @containBox
      @containBox.x = x
      @containBox.y = y

      @text.x = @containBox.x + 10
      @text.y = @containBox.y - 10
      @text.wordWrapWidth = @containBox.width - 20
      @game.add.existing @text

    updateLine: =>
      if @displayText.length < @fullText.length
        @displayText = @fullText.substr 0, @displayText.length + 1
        @text.setText @displayText
      return

    renderText: (content) ->
      @fullText = content.msg
      @displayText = ''
      @game.time.events.repeat 80, content.msg.length + 1, @updateLine, this


    cancelAnimation: ->
      @text.setText @fullText
      @game.time.events.removeAll()
      @displayText = ''
      @fullText = ''
      
    executingScript: ->
      if @displayText.length < @fullText.length
        @cancelAnimation()
      else
        displayDialog = @_currentScript.shift()

        if not displayDialog
          @enableDialog = false
          @game.world.remove @containBox
          @game.world.remove @text
        else
          @renderText displayDialog



    startConversation: (character) ->
      @enableDialog = true
      @_currentScript = @_script[character].slice 0
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