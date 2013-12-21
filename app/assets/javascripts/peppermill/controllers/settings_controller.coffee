PP.SettingsController = Ember.ObjectController.extend

  requestInProgress: false

  actions:

    update: ->
      @send 'hideErrors'
      return if @get 'requestInProgress'
      @set 'requestInProgress', true

      self    = @
      user    = @get 'user'
      payload = PP.Utils.applyCredsToData
        _method: 'PUT'
        user:
          username: user.username
          email: user.email
          password: user.password
          password_confirmation: user.password_confirmation

      $.post("#{PP.API_BASE}/me", payload).then (res) ->
        self.set 'requestInProgress', false
        self.send 'updateCurrentUser', res.data.current_user
        self.set 'model', res.data
      , (res) ->
        self.set 'requestInProgress', false
        self.send('handleError', res)
