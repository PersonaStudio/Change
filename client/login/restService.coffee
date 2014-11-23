define ['angular'], (angular) ->

  class restService
    constructor: ($q, @$http) ->
      @q = $q
      return

    loginRequest: (userName, password) ->
      defer = @q.defer()
      @$http.post '/login', {userName: userName, password: password}
      .success (data) ->
        defer.resolve data
      defer.promise

    signupRequest: (userName, password) ->
      defer = @q.defer()
      @$http.post '/signup', {userName: userName, password: password}
      .success (data) ->
        defer.resolve data
      defer.promise
