define [
  'Phaser'
  './Normal'
  './Select'
], (
  Phaser
  NormalText
  SelectText
) ->
  style:
    font: 'bold 20pt Arial'
    fill: 'white'
    align: 'left'
    wordWrap: true

  render: (game, script, containBox) ->
    if @_instance
      game.world.remove @_instance
    switch script.type
      when 'normal'
        @_instance = new NormalText game, containBox, script.msg, @style
      when 'select'
        @_instance = new SelectText game, containBox, script.msg, @stylethis
    game.add.existing @_instance
    @_instance

  executeScript: ->
    @_instance.select()

  remove: (game) ->
    game.world.remove @_instance
    @_instance.destroy true




