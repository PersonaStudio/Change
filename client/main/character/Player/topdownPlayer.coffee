define ['Phaser'], (Phaser) ->

  class TopdownPlayer extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      super @game, x, y, 'player', frame

      @game.physics.arcade.enable this
      @game.camera.follow this

    move: (cursors) ->
      @body.velocity.x = 0
      @body.velocity.y = 0

      if cursors.up.isDown
        @body.velocity.y -= 50
      else if cursors.down.isDown
        @body.velocity.y += 50
      else if cursors.left.isDown
        @body.velocity.x -=50
      else if cursors.right.isDown
        @body.velocity.x += 50

      return
