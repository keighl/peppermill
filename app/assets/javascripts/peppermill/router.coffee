PP.Router.map ()->

  @route 'login'
  @route 'logout'
  @route 'settings'
  @route "not_found", path: "*path"

# Inheritance #####################################################################

PP.Route = Ember.Route.extend

  beforeModel: (transition) ->
    transition.send 'hideErrors'
    transition.send 'hideFlash'

  actions:

    showErrors: (error) ->
      self = @
      self.send 'hideFlash'
      PP.set 'error', error
      $("html, body").animate
        scrollTop: 0
      , 300
      setTimeout ->
        self.send 'hideErrors'
      , 4000

    showFlash: (message) ->
      self = @
      self.send 'hideErrors'
      PP.set 'flash', message
      $("html, body").animate
        scrollTop: 0
      , 300
      setTimeout ->
        self.send 'hideFlash'
      , 4000

    hideFlash: ->
      PP.set 'flash', null

    hideErrors: ->
      PP.set 'error', null

    handleError: (reason) ->
      if reason.status == 401
        @transitionTo 'login'
      else if reason.status == 400
        @send 'showErrors', reason.responseJSON.data.error
      else if reason.status == 404
        @transitionTo 'not_found'
      else
        @send 'showErrors',
          message: 'Whoops!'
          errors: [
            'Something went wrong on our side. Try again?'
          ]

    error: (reason, transition) ->
      if reason.status == 401
        @transitionTo 'login'
      else if reason.status == 400
        @send 'showErrors', reason.responseJSON.data.error
      else if reason.status == 404
        @transitionTo 'not_found'
      else
        @send 'showErrors',
          message: 'Whoops!'
          errors: [
            'Something went wrong on our side. Try again?'
          ]
        throw reason

    updateCurrentUser: (user) ->
      localStorage.PPAuthToken   = user.token if user?
      localStorage.PPCurrentUser = JSON.stringify user if user?
      PP.set 'currentUser', user

    handleLogout: (res) ->
      localStorage.removeItem 'PPCurrentUser'
      localStorage.removeItem 'PPAuthToken'
      PP.set 'currentUser', null

    setPageTitle: (title) ->
      $('title').html "#{title} | PepperMill"

PP.AuthenticatedRoute = PP.Route.extend
  beforeModel: (transition) ->
    @_super transition
    @transitionTo 'login' unless PP.currentUser?

# Login ######################################################################

PP.LoginRoute = PP.Route.extend
  renderTemplate: -> @render 'login'

  setupController: (controller) ->
    controller.send 'resetController'
    @send 'handleLogout'
    @send 'setPageTitle', 'Login'

PP.LogoutRoute = PP.Route.extend
  setupController: (controller) ->
    @send 'handleLogout'
    @transitionTo "login"

# Index ############

PP.IndexRoute = PP.AuthenticatedRoute.extend
  model: ->
    self = @
    $.getJSON("#{PP.API_BASE}/todos", PP.Utils.creds()).then (res) ->
      res.data

  setupController: (controller, model) ->
    controller.set 'model', model
    @send 'setPageTitle', 'Todos'

# Settings ############

PP.SettingsRoute = PP.AuthenticatedRoute.extend
  model: ->
    self = @
    $.getJSON("#{PP.API_BASE}/me", PP.Utils.creds()).then (res) ->
      res.data

  setupController: (controller, model) ->
    controller.set 'model', model
    @send 'setPageTitle', 'Me'
