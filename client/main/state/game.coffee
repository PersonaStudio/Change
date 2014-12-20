define [
  'Phaser'
  'characters'
  'objects'
  'group'
  'services'
  'notification'
], (Phaser, Character, Object, Group, Services, notification) ->

  class Game extends Phaser.State
    constructor: ->
      super
      @player = Character.Player

    create: ->
      @map = @game.add.tilemap 'map'
      @map.addTilesetImage 'tiles', 'gameTiles'

      @backgroundLayer = @map.createLayer 'backgroundLayer'
      @blockedLayer = @map.createLayer 'blockedLayer'

      @map.setCollisionBetween 1, 2000, true, 'blockedLayer'
#      @map.setCollisionBetween 1, 2000, true, 'backgroundLayer'
#      @backgroundLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400
#      @blockedLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400
#      backgroundLayer.scale.setTo 2
#      blockedLayer.scale.set 2, 2
      @backgroundLayer.resizeWorld()

      @player.createInstance 'Topdown', @game
      @player.addToGame @game
      @player.getMapPosition @map, 'playerStart', 'objectLayer'

      @treasureGroup = new Group.Treasure @game
      @treasureGroup.getData @map, 'objectLayer'

      @doors = new Group.Door @game
      @doors.getData @map, 'objectLayer'

      notification.updatePlace @map.key
      return

    update: ->
      notification.update()

      @player.move()

      @game.physics.arcade.collide @player.getInstance(), @blockedLayer

      @game.physics.arcade.collide @player.getInstance(), @treasureGroup, @player.interact, null, this

      @game.physics.arcade.collide @player.getInstance(), @doors, @player.interact, null, this

      return
