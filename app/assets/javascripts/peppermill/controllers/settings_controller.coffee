PP.SettingsController = Ember.ObjectController.extend

  requestInProgress: false

  actions:

    update: ->
      @send 'hideErrors'
      @send 'hideFlash'
      return if @get 'requestInProgress'
      @set 'requestInProgress', true

      self    = @
      user    = @get 'user'
      payload = PP.Utils.applyCredsToData
        _method: 'PUT'
        user:
          username: user.username
          email: user.email
          password: self.get('password')
          password_confirmation: self.get('password_confirmation')

      $.post("#{PP.API_BASE}/me", payload).then (res) ->
        self.set 'requestInProgress', false
        self.send 'updateCurrentUser', res.data.current_user
        self.set 'model', res.data
        self.send 'showFlash', 'Your settings were updated!'
      , (res) ->
        self.set 'requestInProgress', false
        self.send('handleError', res)
