define [
  'Phaser'
], (
  Phaser
) ->

  class NormalText extends Phaser.Text
    constructor: (game, containBox, script, style) ->
      super game
      @setStyle style
      @displayText = ''
      @fullText = script
      @updateBound containBox.x, containBox.y, containBox.width
      @startAnimation()

    updateBound: (x, y, width) ->
      @x = x + 20
      @y = y - 20
      @wordWrapWidth = width - 40

    updateLine: =>
      if @displayText.length < @fullText.length
        @displayText = @fullText.substr 0, @displayText.length + 1
        @setText @displayText
      return

    startAnimation: ->
      @game.time.events.repeat 80, @fullText.length + 1, @updateLine, this
      return

    cancelAnimation: ->
      @setText @fullText
      @game.time.events.removeAll()
      @displayText = null
      @fullText = null
      return

    select: ->
      if @displayText.length < @fullText.length
        @cancelAnimation()
      true
