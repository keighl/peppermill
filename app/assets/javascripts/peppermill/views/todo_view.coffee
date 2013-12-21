PP.TodoView = Ember.View.extend

  requestInProgress: false
  templateName: '_todo'
  editMode: false

  todoEditName: null

  dueAt: ( ->
    todo = @get 'todo'
    a    = moment todo.due_at
    b    = moment().startOf('day')
    diff = a.diff b, 'days'

    switch diff
      when 0
        "Due today"
      when -1
        "Due yesterday"
      when 1
        "Due tomorrow"
      else
        if diff > 1
          "Due in #{Math.abs(diff)}d"
        else
          "Due #{Math.abs(diff)}d ago"
  ).property 'todo.due_at'

  didInsertElement: ->
    self = @
    $self = @.$()
    $('.datepicker', $self).datepicker
      separator: '-',
      format: 'yyyy-mm-dd'
    .on 'changeDate', (e) ->
      self.set 'todo.due_at', moment(e.date).format('YYYY-MM-DD')
      $('.datepicker', $self).datepicker 'hide'
      self.send 'update'

  actions:

    toggleComplete: ->
      return if @get 'requestInProgress'
      @toggleProperty 'todo.complete'
      @send 'update'

    changeDate: ->
      return if @get 'requestInProgress'
      @$('.datepicker').datepicker('show')

    cancelledNameEdit: ->
      @set('editMode', false) unless @get 'todoEditName'
      @send 'update'

    updateName: ->
      @set('editMode', false) unless @get 'todoEditName'
      @send 'update'

    toggleEditMode: ->
      @set 'todoEditName', @get('todo.name')
      @set 'editMode', true

    togglePriority: ->
      return if @get 'requestInProgress'
      @toggleProperty 'todo.priority'
      @send 'update'

    update: ->
      return if @get 'requestInProgress'
      @set 'requestInProgress', true
      @send 'hideErrors'

      self       = @
      todo       = self.get 'todo'
      controller = self.get 'controller'
      payload    = PP.Utils.applyCredsToData
        _method: 'PUT'
        todo:
          complete: todo.complete
          due_at: todo.due_at
          priority: todo.priority

      if self.get('todoEditName')
        payload.todo.name = self.get 'todoEditName'

      $.post("#{PP.API_BASE}/todos/#{todo.id}", payload).then (res) ->
        self.set 'todo', res.data.todo
        self.set 'requestInProgress', false
        self.set 'editMode', false
      , (res) ->
        self.set 'requestInProgress', false
        self.set 'editMode', false
        controller.send 'handleError', res

PP.TodoEditNameField = Ember.TextField.extend
  becomeFocused: ( ->
    self = @
    @$().focus()
    @$().blur ->
      self.get('parentView').send 'cancelledNameEdit'
  ).on 'didInsertElement'