define ['angular'], (angular) ->

  class restService
    constructor: ($q, @$http) ->
      @q = $q
      return

    loginRequest: (username, password) ->
      defer = @q.defer()
      @$http.post '/login', {username: username, password: password}
      .success (data) ->
        defer.resolve data
      defer.promise

    signupRequest: (username, password) ->
      defer = @q.defer()
      @$http.post '/signup', {username: username, password: password}
      .success (data) ->
        defer.resolve data
      defer.promise
