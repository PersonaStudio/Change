require [
  'angular'
  './main'
  'angular-animate'
  'ui-bootstrap'], (
  angular
) ->
  angular
    .module 'main', ['ngAnimate', 'ui.bootstrap', 'change.login']

  angular.bootstrap document, ['main']