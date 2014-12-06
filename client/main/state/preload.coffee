define ['Phaser', './loading'], (Phaser, Loading) ->

  class Preload extends Phaser.State
    constructor: ->
      super

    preload: ->
      @game.load.image 'loadingBar', 'assets/img/demo/preloader-bar.png'
      return

    create: ->
      @game.stage.backgroundColor = '#000'

#      @game.scale.scaleMode = Phaser.ScaleManager.EXACT_FIT
      @game.scale.pageAlignHorizontally = true
      @game.scale.pageAlignVertically = true
      @game.scale.setScreenSize true

      @game.state.add 'Loading', Loading, yes
      return

