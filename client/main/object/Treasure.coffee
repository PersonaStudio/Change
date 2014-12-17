define ['Phaser'], (Phaser) ->

  class Treasure extends Phaser.Sprite
    constructor: (@game, x, y, key = 'treasure', frame) ->
      super @game, x, y, key, frame

      @game.physics.arcade.enableBody this
      @body.immovable = true

    interact: (target) ->
      if @status is 'closed'
        target.addToInventory
          name: @name
          value: @value
        @status = 'opened'
        ## TEMPORARY: Remove treasure sprite
        @destroy()

