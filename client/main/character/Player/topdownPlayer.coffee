define ['Phaser', 'controller'], (Phaser, Controller) ->

  class TopdownPlayer extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      ## create character
      super @game, x, y, 'player', frame
      @game.physics.arcade.enable this
      @game.camera.follow this

      ## Create Controller of character
      @controller = new Controller.Topdown @game, this
#      @game.input.keyboard = @controller
      

      @_collideObject = null







    move: ->
      @body.velocity.x = 0
      @body.velocity.y = 0

      if @controller.button.up.isDown
        @controller.button.select.enabled = false
        @body.velocity.y -= 50
      else if @controller.button.down.isDown
        @controller.button.select.enabled = false
        @body.velocity.y += 50
      else if @controller.button.left.isDown
        @controller.button.select.enabled = false
        @body.velocity.x -=50
      else if @controller.button.right.isDown
        @controller.button.select.enabled = false
        @body.velocity.x += 50
      return

    interact: (object) ->
      @controller.button.select.enabled = true
      @_collideObject = object
      return

    select: ->
      @_collideObject.interact this
