PP.Router.map ()->

  @route 'login'
  @route 'logout'
  @route 'settings'
  @route 'not_found'

# Inheritance #####################################################################

PP.Route = Ember.Route.extend

  beforeModel: (transition) ->
    transition.send 'hideErrors'

  actions:

    hideErrors: ->
      app = @controllerFor 'application'
      app.set 'error', null

    showErrors: (error) ->
      app = @controllerFor 'application'
      app.set 'error', error

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
