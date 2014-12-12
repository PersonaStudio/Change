define [

], (

) ->
  class Services
    findObjectsByType: (map, type, layer) ->
      console.log map
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

  new Services()





