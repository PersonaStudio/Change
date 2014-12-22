require [ 'Phaser', 'states'], (Phaser, states) ->

  config =
    width: 600
    height: 600

  frame = window.document.getElementById 'gamestage'
  frame.style.width = window.innerWidth
  frame.style.height = window.innerHeight
  frame.style.backgroundColor = '#000'


  game = new Phaser.Game config.width, config.height, Phaser.AUTO, 'gamestage'
  game.state.add 'Preload', states.Preload, yes
  return
