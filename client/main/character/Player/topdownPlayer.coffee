define ['Phaser'], (Phaser) ->

  class TopdownPlayer extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      ## create character
      super @game, x, y, 'player', frame

      @game.physics.arcade.enable this
      @game.camera.follow this
      @anchor.setTo 0.5, 0.5

      return


