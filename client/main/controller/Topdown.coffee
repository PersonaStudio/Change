define ['Phaser'], (Phaser) ->

  class Topdown extends Phaser.Keyboard
    constructor: (@game) ->
      super @game

      @up = @addKey Phaser.Keyboard.UP
      @down = @addKey Phaser.Keyboard.DOWN
      @left = @addKey Phaser.Keyboard.LEFT
      @right = @addKey Phaser.Keyboard.RIGHT
      @select = @addKey Phaser.Keyboard.S
      @cancel = @addKey Phaser.Keyboard.D

      @up.execute = (actor) ->
        actor.goUp()
        return

      @down.execute = (actor) ->
        actor.goDown()
        return

      @left.execute = (actor) ->
        actor.goLeft()
        return

      @right.execute = (actor) ->
        actor.goRight()
        return

      @select.execute = (actor) ->
        actor.select()
        return
      @select.downStatus = false

      @cancel.execute = (actor) ->
        console.log actor
        return
      @cancel.downStatus = false

      @start()

    inputHandle: ->
      if @up.isDown
        return @up
      if @down.isDown
        return @down
      if @left.isDown
        return @left
      if @right.isDown
        return @right
      if @select.isDown
        if not @select.downStatus
          @select.downStatus = true
          return @select
      if @select.isUp
        @select.downStatus = false





      return null
