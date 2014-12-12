define ['Phaser', './game', 'characters'], (Phaser, Game, Character) ->

  class Loading extends Phaser.State
    constructor: ->
      super

    preload: ->
      @loadingBar = @game.add.sprite @game.world.centerX, @game.world.centerY , 'loadingBar'
      @loadingBar.anchor.setTo 0.5
      @game.load.setPreloadSprite @loadingBar

      @game.load.tilemap 'map', 'assets/img/demo/level1.json', null, 1, Phaser.Tilemap.TILED_JSON
      @game.load.image 'gameTiles', 'assets/img/demo/tiles.png'
      @game.load.image 'player', 'assets/img/demo/player.png'
      @game.load.image 'bluecup', 'assets/img/demo/bluecup.png'
      @game.load.image 'greencup', 'assets/img/demo/greencup.png'
      @game.load.image 'browndoor', 'assets/img/demo/browndoor.png'

      return

    create: ->

      player = Character.Player

      player.updateInfo
        health: 100
        stamina: 100

      @game.state.add 'Game', Game, yes
      return





