define ['Phaser', 'objects', 'services'], (Phaser, Object, Services) ->

  class DoorGroup extends Phaser.Group
    constructor: (@game, parent) ->
      super @game, parent

    getData: (map, targetLayer) =>
      result = Services.findObjectsByType map, 'door', targetLayer
      result.forEach (elm) =>
        Services.createFromTiledObject @game, @, elm, Object.Door
        return




