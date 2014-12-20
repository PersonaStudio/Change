define [
  'Phaser'
  'services'
  'notification'
  'controller'
  './topdownPlayer'
], (
  Phaser
  Services
  notification
  Controller
  TopdownPlayer
) ->

  class Player
    constructor: ->
      @_instance = null
      @_controller = null
      @_collideObject = null
      @_inventory = {}
      return

    updateInfo: (data) ->
      @health = data.health
      @stamina = data.stamina
      @gold = data.gold
      return

    createInstance: (opt, game, x = 0, y = 0 ) ->
      @_instance = new TopdownPlayer game, x, y
      @_controller = new Controller.Topdown game, this
      return

    getInstance: -> @_instance

    addToGame: (game) ->
      game.add.existing @_instance
      return

    getMapPosition: (map, name, targetLayer) ->
      object = Services.findObjectsByType map, name, targetLayer
      @setPosition
        x: object[0].x
        y: object[0].y
      return

    move: ->
      @_controller.move()
      return

    interact: (player, object) =>
      @_collideObject = object
      @_controller.button.select.enabled = true
      return

    select: ->
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
