define ['Phaser'], (Phaser) ->

  class Game extends Phaser.State
    constructor: -> super

    create: ->
      @map = @game.add.tilemap 'map'
      @map.addTilesetImage 'tiles', 'gameTiles'

      @backgroundLayer = @map.createLayer 'backgroundLayer'
      @blockedLayer = @map.createLayer 'blockedLayer'

#      @backgroundLayer.fixedToCamera = false
#      @blockedLayer.fixedToCamera = false

      @map.setCollisionBetween 1, 2000, true, 'blockedLayer'
#      @map.setCollisionBetween 1, 2000, true, 'backgroundLayer'
#
#      @backgroundLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400

#      @blockedLayer.position.set @game.world.centerX - 300, @game.world.centerY - 400
#      backgroundLayer.scale.setTo 2
#      blockedLayer.scale.set 2, 2
      @backgroundLayer.resizeWorld()

      @createItems()
      @createDoor()
      @createPlayer()
      return

    update: ->
      @player.body.velocity.x = 0
      @player.body.velocity.y = 0

      if @cursors.up.isDown
        @player.body.velocity.y -= 50
      else if @cursors.down.isDown
        @player.body.velocity.y += 50
      else if @cursors.left.isDown
        @player.body.velocity.x -=50
      else if @cursors.right.isDown
        @player.body.velocity.x += 50

      @game.physics.arcade.collide @player, @blockedLayer
#      @game.physics.arcade.collide @player, @backgroundLayer

      @game.physics.arcade.overlap @player, @items, @collect, null, this

      return

    collect: (player, collectable) ->
      collectable.destroy()
      return

    findObjectsByType: (type, map, layer)->
      result = []
      map.objects[layer].forEach (elm) ->
        if elm.properties.type is type
          elm.y -= map.tileHeight
          result.push elm
      result

    createFromTiledObject: (elm, group) ->
      sprite = group.create elm.x, elm.y, elm.properties.sprite
      Object.keys(elm.properties).forEach (key) ->
        sprite[key] = elm.properties[key]
      return

    createItems: ->
      @items = @game.add.group()
      @items.enableBody = true
      result = @findObjectsByType 'item', @map, 'objectLayer'
      result.forEach (elm) =>
        @createFromTiledObject elm, @items
        return
      return

    createDoor: ->
      @doors = @game.add.group()
      @doors.enableBody = true
      result = @findObjectsByType 'door', @map, 'objectLayer'
      result.forEach (elm) =>
        @createFromTiledObject elm, @doors

    createPlayer: ->
      result = @findObjectsByType 'playerStart', @map, 'objectLayer'
      @player = @game.add.sprite result[0].x, result[0].y, 'player'
      @game.physics.arcade.enable @player
      @game.camera.follow @player
      @cursors = @game.input.keyboard.createCursorKeys()






