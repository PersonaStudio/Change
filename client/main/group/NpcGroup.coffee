define ['Phaser', 'characters', 'services'], (Phaser, Character, Services) ->

  class NpcGroup extends Phaser.Group
    constructor: (@game, parent) ->
      super @game, parent

    configChild: =>
      @forEach (elm) ->
        elm.enableAnimation()
        return
      return

    getData: (map, targetLayer) =>
      result = Services.findObjectsByType map, 'npc', targetLayer
      result.forEach (elm) =>
        Services.createFromTiledObject @game, @, elm, Character.NPC
        return
      @configChild()



