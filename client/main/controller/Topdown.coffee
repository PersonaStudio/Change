define ['Phaser'], (Phaser) ->

  class Topdown extends Phaser.Keyboard
    constructor: (@game, player) ->
      super @game

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







