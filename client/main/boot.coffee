require [ 'Phaser', './preload'], (Phaser, Preload) ->

  window.onload = ->
    config =
      width: 1000
      height: 1000

    game = new Phaser.Game config.width, config.height, Phaser.AUTO
    game.state.add 'Preload', Preload, yes

