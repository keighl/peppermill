PP.ApplicationController = Ember.Controller.extend

  dataError: null
  tmpCurrentUser: null

  currentUser: ( ->
    console.log 'currentUser changed'
    return PP.currentUser
  ).property('PP.currentUser')

  isLoggedIn: ( ->
    PP.currentUser?
  ).property 'PP.currentUser'