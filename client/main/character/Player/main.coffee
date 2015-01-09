define [
  'Phaser'
  'services'
  'notification'
  './topdownPlayer'
], (
  Phaser
  Services
  notification
  TopdownPlayer
) ->

  class Player
    constructor: ->
      @_instance = null
      @_collideObject = null
      @_isCollided = null
      @_inventory = {}
      return

    updateInfo: (data) ->
      @health = data.health
      @stamina = data.stamina
      @gold = data.gold
      return

    createInstance: (opt, game, x = 0, y = 0 ) ->
      @_instance = new TopdownPlayer game, x, y
      return

    getInstance: -> @_instance

    addToGame: (game) ->
#      game.add.existing @_instance
      game.world.addAt @_instance, 3
      return

    getMapPosition: (map, name, targetLayer) ->
      object = Services.findObjectsByType map, name, targetLayer
      @setPosition
        x: object[0].x
        y: object[0].y
      return

    goUp: ->
      @_isCollided = false
      @_instance.goUp()
      return

    goDown: ->
      @_isCollided = false
      @_instance.goDown()
      return

    goLeft: ->
      @_isCollided = false
      @_instance.goLeft()
      return

    goRight: ->
      @_isCollided = false
      @_instance.goRight()
      return

    stay: ->
      @_instance.stay()

    interact: (player, object) =>
      @_collideObject = object
      @_isCollided = true
      return

    select: ->
      if @_isCollided
        @_collideObject.interact this

    setPosition: (point) ->
      @_instance.x = point.x
      @_instance.y = point.y
      return

    addToInventory: (item) ->
      if @_inventory[item.name]
        @_inventory[item.name].value += item.value
      else
        @_inventory[item.name] = item
      notification.updateItem item
      return
