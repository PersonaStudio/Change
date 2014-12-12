define ['Phaser', 'objects', 'services'], (Phaser, Object, Services) ->

  class TreasureGroup extends Phaser.Group
    constructor: (@game, parent) ->
      super @game, parent

    getData: (map, targetLayer) =>
      result = Services.findObjectsByType map, 'treasure', targetLayer
      result.forEach (elm) =>
        Services.createFromTiledObject @game, @, elm, Object.Treasure
        return




