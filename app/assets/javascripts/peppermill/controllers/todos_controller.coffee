PP.IndexController = Ember.ObjectController.extend

  requestInProgress: false

  actions:
    create: ->
      @send 'hideErrors'
      return if @get 'requestInProgress'

      self = @
      $('.new-todo-name').blur()

      return unless self.get('new_todo_name')

      @set 'requestInProgress', true

      payload = PP.Utils.applyCredsToData
        todo:
          name: self.get('new_todo_name')
      $.post("#{PP.API_BASE}/todos", payload).then (res) ->
        self.set 'requestInProgress', false
        self.get("todos").unshiftObject res.data.todo
        self.set 'new_todo_name', null
      , (res) ->
        self.set 'requestInProgress', false
        self.send('handleError', res)