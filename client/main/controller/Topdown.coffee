define ['Phaser'], (Phaser) ->

  class Topdown extends Phaser.Keyboard
    constructor: (@game, @player) ->
      super @game
      @instance = @player.getInstance()

      @button =
        up: @addKey Phaser.Keyboard.UP
        down: @addKey Phaser.Keyboard.DOWN
        left: @addKey Phaser.Keyboard.LEFT
        right: @addKey Phaser.Keyboard.RIGHT
        select: @addKey Phaser.Keyboard.S
        cancel: @addKey Phaser.Keyboard.D

      @button.select.enabled = false
      @button.select.onDown.add player.select, player

      @start()

    move: ->
      @instance.body.velocity.x = 0
      @instance.body.velocity.y = 0
      if @button.up.isDown
        @button.select.enabled = false
        @instance.body.velocity.y -= 50
      else if @button.down.isDown
        @button.select.enabled = false
        @instance.body.velocity.y += 50
      else if @button.left.isDown
        @button.select.enabled = false
        @instance.body.velocity.x -=50
      else if @button.right.isDown
        @button.select.enabled = false
        @instance.body.velocity.x += 50







