require.config
  baseUrl: '.'
  paths:
    angular: 'lib/bower_components/angular/angular'
    'angular-animate': 'lib/bower_components/angular-animate/angular-animate'
    'angular-scroll': 'lib/bower_components/angular-scroll/angular-scroll'
    requireLib: 'lib/bower_components/requirejs/require'
    'ui-bootstrap': 'lib/bower_components/angular-bootstrap/ui-bootstrap-tpls'
    config: 'config'
    'ui-router': 'lib/bower_components/ui-router/release/angular-ui-router'

  shim:
    angular:
      exports: 'angular'
    'angular-animate':
      deps: ['angular']
    'angular-scroll':
      deps: ['angular']
    'ui-bootstrap':
      deps: ['angular']
    'ui-router':
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