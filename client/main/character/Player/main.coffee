define [
  'Phaser'
  'services'
  'controller'
  './topdownPlayer'
], (
  Phaser
  Services
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
      @_instance.x = object[0].x
      @_instance.y = object[0].y
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

    addToInventory: (item) ->
      if @_inventory[item.name]
        @_inventory[item.name].value += item.value
      else
        @_inventory[item.name] = item
      return











