PP.ApplicationController = Ember.Controller.extend

  currentUser: ( ->
    return PP.currentUser
  ).property('PP.currentUser')

  isLoggedIn: ( ->
    PP.currentUser?
  ).property 'PP.currentUser'


