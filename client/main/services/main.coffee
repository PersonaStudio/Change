define [

], (

) ->
  class Services
    findObjectsByType: (map, type, layer) ->
      result = []
      map.objects[layer].forEach (elm) ->
        if elm.properties.type is type
#          elm.y -= map.tileHeight
          result.push elm
      result

    createFromTiledObject: (game, group, elm, spriteClass) ->
      sprite = new spriteClass game, elm.x, elm.y, elm.properties.sprite
      Object.keys(elm.properties).forEach (key) ->
        sprite[key] = elm.properties[key]
      group.add sprite
      return

  new Services()





