define ['angular'], (angular) ->


  class LoginCtrl
    constructor: ($scope, restService) ->
      $scope.login = ->
        restService.loginRequest($scope.userName, $scope.password)
        .then (data) ->
          if data.status is 'success'
            location.reload()
          return
        return

      $scope.signup = ->
        restService.signupRequest($scope.userName, $scope.password)
        .then (data) ->
          if data.status is 'success'
            restService.getGame()
          return
        return
