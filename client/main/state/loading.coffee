define ['Phaser'], (Phaser) ->

  class Loading extends Phaser.State
    constructor: ->
      super

    preload: ->
      @loadingBar = @game.add.sprite @game.world.centerX, @game.world.centerY , 'loadingBar'
      @loadingBar.anchor.setTo 0.5
      @game.load.setPreloadSprite @loadingBar

      @game.load.tilemap 'map', 'assets/img/demo/testing.json', null, 1, Phaser.Tilemap.TILED_JSON
      @game.load.image 'gameTiles', 'assets/img/demo/tiles.png'

    create: ->


      return





