define [
  'Phaser'
  'services'
  './topdownPlayer'
], (
  Phaser
  Services
  TopdownPlayer
) ->

  class Player
    constructor: ->
      @_instance = null
      return

    createInstance: (opt, game, x = 0, y = 0 ) ->
      @_instance = new TopdownPlayer game, x, y
      return

    addToGame: (game) ->
      game.add.existing @_instance
      return

    updateInfo: (data) ->
      @health = data.health
      @stamina = data.stamina
      return

    getMapPosition: (map, name, targetLayer) ->
      object = Services.findObjectsByType map, name, targetLayer
      @_instance.x = object[0].x
      @_instance.y = object[0].y
      return

    move: (cursors) ->
      @_instance.move cursors
      return






