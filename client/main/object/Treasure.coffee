define ['Phaser'], (Phaser) ->

  class Treasure extends Phaser.Sprite
    constructor: (@game, x, y, key = 'treasure', frame) ->
      super @game, x, y, key, frame

      @game.physics.arcade.enableBody this
      @body.immovable = true

