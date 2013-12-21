PP.IndexController = Ember.ObjectController.extend

  requestInProgress: false
  sortScope: 'by_incomplete'

  isByIncomplete: ( ->
    @get('sortScope') == "by_incomplete"
  ).property 'sortScope'

  isByDueDate: ( ->
    @get('sortScope') == "by_due_date"
  ).property 'sortScope'

  isByPriority: ( ->
    @get('sortScope') == "by_priority"
  ).property 'sortScope'

  actions:

    sortBy: (scope) ->
      return if @get 'requestInProgress'
      self = @
      @set 'requestInProgress', true
      @set 'sortScope', scope

      payload = PP.Utils.applyCredsToData
        sort: scope

      $.getJSON("#{PP.API_BASE}/todos", payload).then (res) ->
        self.set 'model', res.data
        self.set 'requestInProgress', false
      , ->
        self.set 'requestInProgress', false
        self.send('handleError', res)

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
