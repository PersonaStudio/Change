require [
  'angular'

  'angular-animate'
  'angular-scroll'
  'ui-bootstrap'
  'ui-router'], (
  angular
) ->
  angular
  .module 'main', ['duScroll','ngAnimate', 'ui.bootstrap', 'ui.router']

  angular.bootstrap document, ['main']