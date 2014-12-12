define ['Phaser', 'characters', 'services'], (Phaser, Character, Services) ->

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

      @cursors = @game.input.keyboard.createCursorKeys()
#      @createItems()
#      @createDoor()
      return

    update: ->
      @player.move @cursors

      @game.physics.arcade.collide @player, @blockedLayer
#      @game.physics.arcade.collide @player, @backgroundLayer

      @game.physics.arcade.overlap @player, @items, @collect, null, this

      return

    collect: (player, collectable) ->
      collectable.destroy()
      return

    createItems: ->
      @items = @game.add.group()
      @items.enableBody = true
      result = Services.findObjectsByType 'item', @map, 'objectLayer'
      result.forEach (elm) =>
        Services.createFromTiledObject elm, @items
        return
      return

    createDoor: ->
      @doors = @game.add.group()
      @doors.enableBody = true
      result = Services.findObjectsByType 'door', @map, 'objectLayer'
      result.forEach (elm) =>
        Services.createFromTiledObject elm, @doors







