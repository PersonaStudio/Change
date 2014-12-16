require.config
#  baseUrl: 'http://localhost:3030/'
  packages: [
    'login'
    {
      name: 'states'
      location: './main/state'
      main: 'main'
    }
    {
      name: 'characters'
      location: './main/character'
      main: 'main'
    }
    {
      name: 'services'
      location: './main/services'
      main: 'main'
    }
    {
      name: 'objects'
      location: './main/object'
      main: 'main'
    }
    {
      name: 'group'
      location: './main/group'
      main: 'main'
    }
    {
      name: 'controller'
      location: './main/controller'
      main: 'main'
    }
  ] 
  paths:
    angular: 'lib/bower_components/angular/angular'
    'angular-animate': 'lib/bower_components/angular-animate/angular-animate'
    requireLib: 'lib/bower_components/requirejs/require'
    'ui-bootstrap': 'lib/bower_components/angular-bootstrap/ui-bootstrap-tpls'

    'Phaser': 'lib/bower_components/phaser/build/phaser'
    config: 'config'

 

  shim:
    angular:
      exports: 'angular'
    'angular-animate':
      deps: ['angular']
    'ui-bootstrap':
      deps: ['angular']

# optimization config
  modules: [
    name: 'boot'
    include: ['requireLib', 'config']
  ]

  optimize: 'uglify2'
  optimizeCss: 'standard.keepLines'
  generateSourceMaps: false
  preserveLicenseComments: false