define [
  'Phaser'
], (
  Phaser
) ->
  class NPC extends Phaser.Sprite
    constructor: (@game, x, y, key = 'npc', frame) ->
      ## create character
      super @game, x, y, key, frame

      @anchor.setTo 0.5, 0.5
      @game.physics.arcade.enable this

#      @animations.add 'walkdown', [0,1,2], 6, true
#      @animations.add 'walkup', [36,37,38], 6, true
#      @animations.add 'walkright', [24,25,26], 6, true
#      @animations.add 'walkleft', [12,13,14], 6, true
#      @currrentAnimation = null
      return

    enableAnimation: ->
      if @immovable
        @body.immovable = true

      return

