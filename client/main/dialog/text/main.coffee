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
    switch script.type
      when 'normal'
        @_instance = new NormalText game, containBox, script.msg, @style
      when 'select'
        @_instance = new SelectText game, containBox, script.msg, @style
    @_instance

  executeScript: ->
    @_instance.select()



