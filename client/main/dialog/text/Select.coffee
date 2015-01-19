define [
  'Phaser'
  './Normal'
], (
  Phaser
  NormalText
) ->


  class Text extends Phaser.Text
    constructor: (@game, x, y, text, style) ->
      super @game, x, y, text, style



  class SelectText extends Phaser.Group
    constructor: (@game, containBox, script, @style) ->
      super @game
      @_xBound = containBox.x + 20
      @_yBound = containBox.y + 10

      @title = @add new Phaser.Text @game, @_xBound, @_yBound, script.title, @style
      @optionList = (@createOption option for option in script.options)
      @cursor = @add @game.add.graphics 0,0
      @cursor.beginFill 0xffffff
      @cursor.drawRect 0, 0, 20, 20
      @cursor.endFill();
      @setSelectOption 0

    setSelectOption: (item) ->
      @cursor.x = @optionList[item].x - 40
      @cursor.y = @optionList[item].y
      @cursor.isSelect = item
      return

    createOption: (option) ->
      @_yBound = @_yBound + 25
      @add new Phaser.Text @game, @_xBound + 60, @_yBound, option, @style


    select: ->
      if @displayText.length < @fullText.length
        @cancelAnimation()
      true

    goUp: ->
      console.log @cursor.isSelect
      if @cursor.isSelect is 0
        @setSelectOption @optionList.length - 1
      else
        @setSelectOption @cursor.isSelect - 1


    goDown: ->
      console.log @cursor.isSelect
      if @cursor.isSelect is @optionList.length - 1
        @setSelectOption 0
      else
        @setSelectOption @cursor.isSelect + 1
