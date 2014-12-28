define [
  'Phaser'
  'characters'
  'objects'
  'group'
  'services'
  'notification'
  'controller'
], (Phaser, Character, Object, Group, Services, notification, Controller) ->

  class Game extends Phaser.State
    constructor: ->
      super
      @player = Character.Player

    create: ->

      @map = @game.add.tilemap 'map'

      @map.addTilesetImage 'MedTown', 'MedTown'
      @map.addTilesetImage 'Mud', 'Mud'
      @map.addTilesetImage 'Road', 'Road'
      @map.addTilesetImage 'Citadelle', 'Citadelle'
      @map.addTilesetImage 'Dirt', 'Dirt'
      @map.addTilesetImage 'Dirt1', 'Dirt1'
      @map.addTilesetImage 'Dirt2', 'Dirt2'
      @map.addTilesetImage 'Water', 'Water'
      @map.addTilesetImage 'Water1', 'Water1'
      @map.addTilesetImage 'Water2', 'Water2'
      @map.addTilesetImage 'Water3', 'Water3'
      @map.addTilesetImage 'Water4', 'Water4'
      @map.addTilesetImage 'ROTATE_Citadelle', 'ROTATE_Citadelle'


      @backgroundLayer = @map.createLayer 'Ground'
      @map.createLayer 'Rocks'
      @map.createLayer 'Road'
      @map.createLayer 'Tree2'
      @map.createLayer 'Tree1'
      @map.createLayer 'House'
      @map.createLayer 'Decoration house'
      @map.createLayer 'Trees'
      @map.createLayer 'Decoration2'

#      @map.setCollisionBetween 1, 10000, true, @house
#      @map.setCollisionBetween 1, 2000, true, 'backgroundLayer'
#      @backgroundLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400
#      @blockedLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400
#      backgroundLayer.scale.setTo 2
#      blockedLayer.scale.set 2, 2
      @backgroundLayer.resizeWorld()

      @player.createInstance 'Topdown', @game
      @player.addToGame @game
      @player.getMapPosition @map, 'playerStart', 'player'

#      @treasureGroup = new Group.Treasure @game
#      @treasureGroup.getData @map, 'objectLayer'
#
#      @doors = new Group.Door @game
#      @doors.getData @map, 'objectLayer'

      @controller = new Controller.Topdown @game

#      notification.updatePlace @map.key
      return

    update: ->
#      notification.update()

      command = @controller.inputHandle()
      if command
        command.execute @player
      else @player.stay()

#      @game.physics.arcade.collide @player.getInstance(), @house
#
#      @game.physics.arcade.collide @player.getInstance(), @treasureGroup, @player.interact, null, this
#
#      @game.physics.arcade.collide @player.getInstance(), @doors, @player.interact, null, this

      return
