define ['angular', './controller', './restService'], (angular, Login, restService) ->

  angular
    .module 'change.login', []
    .service 'restService', ['$q', '$http', restService]
    .controller 'LoginCtrl', ['$scope', 'restService', Login]