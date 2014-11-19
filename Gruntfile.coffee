module.exports = (grunt) ->
  getCopyConfig = (mode) ->
    global =
      expand: true
      cwd: 'app'
      src: ['**', '!**/*.coffee']
      dest: 'target'
      options:
        noProcess: ['**/*.{png,gif,jpg,ico,svg,ttf,eot,woff}']
    switch mode
      when 'dev'
        global.options.process = (content) -> content.replace /@dev{([^\}]*)}/, (match, body) -> body.trim()
      when 'prod'
        global.options.process = (content) -> content.replace /@dev{[^\}]*}/, ''
    global

  grunt.initConfig
    watch:
      compile:
        files: ['app/**']
        tasks: ['compile']
        options:
          spawn: false

    coffee:
      compile:
        expand: true
        cwd: 'app'
        src: ['**/*.coffee']
        dest: 'target'
        ext: '.js'

    clean:
      all: ['target', 'dist', 'distTemp']
      postDist: ['target', 'distTemp']

    copy:
      compile: getCopyConfig 'dev'
      distTemp: getCopyConfig 'prod'
      dist:
        files: [
          expand: true, cwd: 'distTemp', src: ['bower_components/bootstrap-css-only/fonts/**'], dest: 'dist/', options: noProcess: ['**/*.{png,gif,jpg,ico,svg,ttf,eot,woff}']
        ,
          expand: true, cwd: 'distTemp', src: ['bower_components/fontawesome/fonts/**'], dest: 'dist/', options: noProcess: ['**/*.{png,gif,jpg,ico,svg,ttf,eot,woff}']
        ,
          expand: true, cwd: 'distTemp', src: ['img/**'], dest: 'dist/', options: noProcess: ['**/*.{png,gif,jpg,ico,svg,ttf,eot,woff}']
        ,
          expand: true, cwd: 'distTemp', src: ['**/*.html'], dest: 'dist/'
        ,
          expand: true, cwd: 'distTemp', src: ['css/**'], dest: 'dist/'
        ,
          expand: true, cwd: 'distTemp', src: ['js/boot.js'], dest: 'dist/'
        ,
          expand: true, cwd: 'distTemp', src: ['fonts/**'], dest: 'dist/'
        ]

    requirejs:
      dist:
        options:
          mainConfigFile: 'target/js/config.js'
          appDir: 'target'
          dir: 'distTemp'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'default', ['compile', 'watch:compile']
  grunt.registerTask 'compile', ['clean:all', 'copy:compile', 'coffee:compile']
  grunt.registerTask 'compileDist', ['clean:all', 'copy:distTemp', 'coffee:compile']
  grunt.registerTask 'dist', ['compileDist', 'requirejs', 'copy:dist', 'clean:postDist']