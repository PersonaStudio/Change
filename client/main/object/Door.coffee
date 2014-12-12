define ['Phaser'], (Phaser) ->

  class Door extends Phaser.Sprite
    constructor: (@game, x, y, key = 'door', frame) ->
      super @game, x, y, key, frame

      @game.physics.arcade.enableBody this
      @body.immovable = true