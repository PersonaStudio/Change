require.config
  baseUrl: 'http://localhost:3030/'
  packages: ['login', 'main']
  paths:
    angular: 'lib/bower_components/angular/angular'
    'angular-animate': 'lib/bower_components/angular-animate/angular-animate'
    requireLib: 'lib/bower_components/requirejs/require'
    'ui-bootstrap': 'lib/bower_components/angular-bootstrap/ui-bootstrap-tpls'
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