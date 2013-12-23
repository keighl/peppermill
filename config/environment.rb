# Load the rails application
require File.expand_path('../application', __FILE__)

EMAIL_REGEX = /^[A-Za-z0-9][A-Za-z0-9\-\.\+\_]+?([A-Za-z0-9]+)@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/i

TODO_PRIORITIES = {
  low:  0,
  medium: 1,
  high: 2
}


# Initialize the rails application
Peppermill::Application.initialize!
