require [ 'Phaser', 'states'], (Phaser, states) ->

  config =
    width: window.innerWidth
    height: window.innerHeight

  game = new Phaser.Game config.width, config.height, Phaser.AUTO, 'gamestage'
  game.state.add 'Preload', states.Preload, yes
  return
