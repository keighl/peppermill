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

    hideErrors: ->
      PP.set 'error', null

    showErrors: (error) ->
      $("html, body").animate
        scrollTop: 0
      , 300
      PP.set 'error', error

    hideFlash: ->
      PP.set 'flash', null

    showFlash: (message) ->
      PP.set 'flash', message
      $("html, body").animate
        scrollTop: 0
      , 300
      self = @
      setTimeout ->
        self.send 'hideFlash'
      , 3000

    handleError: (reason) ->
      if reason.status == 401
        @transitionTo 'login'
      else if reason.status == 400
        @send 'showErrors', reason.responseJSON.data.error
      else if reason.status == 404
        @transitionTo 'not_found'
      else
        console.log reason

    error: (reason, transition) ->
      if reason.status == 401
        @transitionTo 'login'
      else if reason.status == 400
        @send 'showErrors', reason.responseJSON.data.error
      else if reason.status == 404
        @transitionTo 'not_found'
      else
        throw reason
        console.log reason

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
