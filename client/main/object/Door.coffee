define ['Phaser'], (Phaser) ->

  class Door extends Phaser.Sprite
    constructor: (@game, x, y, key = 'door', frame) ->
      super @game, x, y, key, frame

      @anchor.setTo 0.5, 0.5
      @game.physics.arcade.enableBody this
      @body.immovable = true

    interact: (target) ->
      target.setPosition
        x: @targetX
        y: @targetY
      return
