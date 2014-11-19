module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      dev:
        expand: true
        cwd: 'app'
        files: ['**/*.html', '**/*.coffee']
        tasks: ['copy:debug', 'coffee:compile']
      coffee:
        files: 'app/*.coffee'
        tasks: ['coffee:dev']
      express:
        files: 'server.js'
        tasks: ['express:dev']
        options:
          spawn: false

    express:
      dev:
        options:
          script: 'server.js'
          node_env: 'dev'
          port: 3030
      prod:
        options:
          script: ''
          node_env: 'prod'

    coffee:
      compile:
        expand: true
        cwd: 'app'
        src: ['**/*.coffee']
        dest: 'target/'
        ext: '.js'
      compileJoined:
        options:
          join: true
        files:
          'app/js/application.js':
            ['**/*.coffee']

    copy:
      debug:
        expand: true
        cwd: 'app'
        src: ['**', '!**/*.coffee', '!lib/bower_components/*.*']
        dest: 'target/'
      dev:
        expand: true
        cwd: 'app'
        src: ['**', '!**/*.coffee']
        dest: 'target/'


    clean:
      all:
        src: ['target']

  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'dev', ['clean:all', 'copy:dev', 'coffee:compile']
  grunt.registerTask "default", ['dev', 'express:dev', 'watch:dev', 'watch:express']







