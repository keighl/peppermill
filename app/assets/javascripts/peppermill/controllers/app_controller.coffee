PP.ApplicationController = Ember.Controller.extend

  currentUser: ( ->
    console.log 'currentUser changed'
    return PP.currentUser
  ).property('PP.currentUser')

  isLoggedIn: ( ->
    PP.currentUser?
  ).property 'PP.currentUser'


