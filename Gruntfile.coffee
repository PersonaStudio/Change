module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      template:
        options:
          cwd: 'client'
        files: ['**', '!**/*.coffee', '!lib/bower_components/*.*']
        tasks: ['copy:template']
      client:
        options:
          cwd: 'client'
        files: ['**/*.coffee']
        tasks: ['coffee:client']
      server:
        options:
          cwd: 'server'
        files: ['**/*.coffee', '**/*.js']
        tasks: ['copy:server', 'coffee:server', 'express:dev']
#       express:
#        files: 'server.js'
#        tasks: ['express:dev']
#        options:
#          spawn: false

    express:
      dev:
        options:
          script: 'target/server/server.js'
          node_env: 'dev'
          port: 3030
      prod:
        options:
          script: ''
          node_env: 'prod'

    coffee:
      options:
        expand: true
      server:
        cwd: 'server'
        src: ['**/*.coffee']
        dest: 'target/server'
        ext: '.js'
      client:
        expand: true
        cwd: 'client'
        src: ['**/*.coffee']
        dest: 'target/client'
        ext: '.js'

    copy:
      template:
        expand: true
        cwd: 'client'
        src: ['**', '!**/*.coffee', '!lib/bower_components/**']
        dest: 'target/client'
      lib:
        expand: true
        cwd: 'client'
        src: ['lib/**']
        dest: 'target/client'

      server:
        expand: true
        cwd: 'server'
        src: ['**', '!**/*.coffee']
        dest: 'target/server'

    clean:
      all:
        src: ['target']

#  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'dev', ['clean:all', 'copy', 'coffee']
  grunt.registerTask 'watchClient', ['watch:template', 'watch:client']
  grunt.registerTask 'watchServer', ['watch:server']
  grunt.registerTask "default", ['dev', 'express:dev', 'watch']







