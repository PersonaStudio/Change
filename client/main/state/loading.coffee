define ['Phaser', './game', 'characters'], (Phaser, Game, Character) ->

  class Loading extends Phaser.State
    constructor: ->
      super

    preload: ->
      @loadingBar = @game.add.sprite @game.world.centerX, @game.world.centerY , 'loadingBar'
      @loadingBar.anchor.setTo 0.5
      @game.load.setPreloadSprite @loadingBar

      @game.load.tilemap 'map', 'assets/img/village/basic-village.json', null, 1, Phaser.Tilemap.TILED_JSON
      @game.load.image 'MedTown', 'assets/img/village/tilesets/Inq XP MT- Medieval Town.png'
      @game.load.image 'Mud', 'assets/img/village/tilesets/Inq XP MT - Mud.png'
      @game.load.image 'Road', 'assets/img/village/tilesets/Inq XP MT - Road.png'
      @game.load.image 'Citadelle', 'assets/img/village/tilesets/tileset___citadelle_de_rennel_by_dal_obsidienne-d6ockia.png'
      @game.load.image 'Dirt', 'assets/img/village/tilesets/Inq XP MT - Dirt.png'
      @game.load.image 'Dirt1', 'assets/img/village/tilesets/Inq XP MT - Dirt(1).png'
      @game.load.image 'Dirt2', 'assets/img/village/tilesets/Inq XP MT - Dirt(2).png'
      @game.load.image 'Water', 'assets/img/village/tilesets/Inq XP MT - Water3.png'
      @game.load.image 'Water1', 'assets/img/village/tilesets/Inq XP MT - Water1.png'
      @game.load.image 'Water2', 'assets/img/village/tilesets/Inq XP MT - Water2.png'
      @game.load.image 'Water3', 'assets/img/village/tilesets/Inq XP MT - Water5.png'
      @game.load.image 'Water4', 'assets/img/village/tilesets/Inq XP MT - Water6.png'
      @game.load.image 'ROTATE_Citadelle', 'assets/img/village/tilesets/(ROTATE)tileset___citadelle_de_rennel_by_dal_obsidienne-d6ockia copy.png'



      # @game.load.image 'player', 'assets/img/demo/player.png'
      @game.load.spritesheet 'player', 'assets/img/list.png', 32, 32, 48
#      @game.load.image 'bluecup', 'assets/img/demo/bluecup.png'
#      @game.load.image 'greencup', 'assets/img/demo/greencup.png'
#      @game.load.image 'browndoor', 'assets/img/demo/browndoor.png'

      return

    create: ->

      player = Character.Player


      player.updateInfo
        health: 100
        stamina: 100
        gold: 100

      @game.state.add 'Game', Game, yes
      return





