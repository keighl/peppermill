window.PP = Ember.Application.create
  LOG_TRANSITIONS: true,
  LOG_ACTIVE_GENERATION: true,
  LOG_VIEW_LOOKUPS: true

if Modernizr.history
  PP.Router.reopen
    location: 'history'

PP.API_BASE = '/api/v1'

PP.set 'currentUser', null
PP.set 'currentUser', JSON.parse(localStorage.PPCurrentUser) if localStorage.PPCurrentUser

PP.Utils =
  creds: ->
    data =
      token: localStorage.PPAuthToken

  applyCredsToData: (data) ->
    data.token = localStorage.PPAuthToken
    data