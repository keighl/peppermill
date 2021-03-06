PP.LoginController = Ember.ObjectController.extend

  requestInProgress: false
  isSignup: true

  actions:

    resetController: ->
      @set 'model', {}
      @set 'isSignup', true
      @set 'requestInProgress', false
      @set 'login_email', ""
      @set 'login_password', ""
      @set 'signup_username', ""
      @set 'signup_email', ""
      @set 'signup_password', ""
      @set 'signup_password_confirmation', ""

    toggleSignup: ->
      @send 'hideErrors'
      @send 'hideFlash'
      @toggleProperty 'isSignup'

    handleLogin: (res) ->
      self = @
      localStorage.PPCurrentUser  = JSON.stringify res.data.current_user
      localStorage.PPAuthToken = res.data.current_user.token
      self.send 'updateCurrentUser', res.data.current_user
      self.transitionToRoute 'index'

    login: ->
      return if @get 'requestInProgress'
      @set 'requestInProgress', true
      @send 'hideErrors'
      @send 'hideFlash'
      self    = @
      payload =
        email: self.get 'login_email'
        password: self.get 'login_password'
      $.post("#{PP.API_BASE}/users/login", payload).then (res) ->
        self.set 'requestInProgress', false
        self.send 'handleLogin', res
      , (res) ->
        self.set 'requestInProgress', false
        self.send 'handleError', res

    signup: ->
      return if @get 'requestInProgress'
      @set 'requestInProgress', true
      @send 'hideErrors'
      @send 'hideFlash'
      self    = @
      payload =
        user:
          username: self.get 'signup_username'
          email: self.get 'signup_email'
          password: self.get 'signup_password'
          password_confirmation: self.get 'signup_password_confirmation'

      $.post("#{PP.API_BASE}/users", payload).then (res) ->
        self.set 'requestInProgress', false
        self.send 'handleLogin', res
      , (res) ->
        self.set 'requestInProgress', false
        self.send 'handleError', res