Ember.TEMPLATES["_todo"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, hashTypes, hashContexts, escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  var buffer = '', hashContexts, hashTypes;
  data.buffer.push("\n<form ");
  hashContexts = {'on': depth0,'target': depth0};
  hashTypes = {'on': "STRING",'target': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "updateName", {hash:{
    'on': ("submit"),
    'target': ("view")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n");
  hashContexts = {'valueBinding': depth0,'classNames': depth0};
  hashTypes = {'valueBinding': "STRING",'classNames': "STRING"};
  data.buffer.push(escapeExpression(helpers.view.call(depth0, "PP.TodoEditNameField", {hash:{
    'valueBinding': ("view.todoEditName"),
    'classNames': ("todo-edit-name-field")
  },contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n</form>\n");
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = '', stack1, stack2, hashContexts, hashTypes, options;
  data.buffer.push("\n<a href='#' ");
  hashContexts = {'on': depth0,'target': depth0};
  hashTypes = {'on': "STRING",'target': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "toggleEditMode", {hash:{
    'on': ("click"),
    'target': ("view")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "view.todo.name", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n</a>\n<a href='#' ");
  hashContexts = {'on': depth0,'target': depth0};
  hashTypes = {'on': "STRING",'target': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "toggleComplete", {hash:{
    'on': ("click"),
    'target': ("view")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(" ");
  hashContexts = {'class': depth0};
  hashTypes = {'class': "STRING"};
  options = {hash:{
    'class': ("view.todo.complete:complete:incomplete")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers['bind-attr'] || (depth0 && depth0['bind-attr'])),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "bind-attr", options))));
  data.buffer.push(">\n");
  hashTypes = {};
  hashContexts = {};
  stack2 = helpers.unless.call(depth0, "view.todo.complete", {hash:{},inverse:self.program(6, program6, data),fn:self.program(4, program4, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("\n</a>\n<a class=\"datepicker\" href='#' ");
  hashContexts = {'on': depth0,'target': depth0};
  hashTypes = {'on': "STRING",'target': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "changeDate", {hash:{
    'on': ("click"),
    'target': ("view")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(" ");
  hashContexts = {'data-date': depth0};
  hashTypes = {'data-date': "STRING"};
  options = {hash:{
    'data-date': ("view.todo.due_at")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers['bind-attr'] || (depth0 && depth0['bind-attr'])),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "bind-attr", options))));
  data.buffer.push(" data-date-format='yyyy-mm-dd'>\n");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "view.dueAt", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n</a>\n<a href='#' ");
  hashContexts = {'on': depth0,'target': depth0};
  hashTypes = {'on': "STRING",'target': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "togglePriority", {hash:{
    'on': ("click"),
    'target': ("view")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(" ");
  hashContexts = {'class': depth0};
  hashTypes = {'class': "STRING"};
  options = {hash:{
    'class': ("view.todo.priority:high:low")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers['bind-attr'] || (depth0 && depth0['bind-attr'])),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "bind-attr", options))));
  data.buffer.push(">\n");
  hashTypes = {};
  hashContexts = {};
  stack2 = helpers['if'].call(depth0, "view.todo.priority", {hash:{},inverse:self.program(10, program10, data),fn:self.program(8, program8, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("\n</a>\n");
  return buffer;
  }
function program4(depth0,data) {
  
  
  data.buffer.push("\nComplete?\n");
  }

function program6(depth0,data) {
  
  
  data.buffer.push("\nIncomplete?\n");
  }

function program8(depth0,data) {
  
  
  data.buffer.push("\nHigh\n");
  }

function program10(depth0,data) {
  
  
  data.buffer.push("\nLow\n");
  }

  hashTypes = {};
  hashContexts = {};
  stack1 = helpers['if'].call(depth0, "view.editMode", {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n");
  return buffer;
  
});

Ember.TEMPLATES["application"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, hashTypes, hashContexts, escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  var buffer = '', stack1, stack2, hashContexts, hashTypes, options;
  data.buffer.push("\n");
  hashContexts = {'classNames': depth0};
  hashTypes = {'classNames': "STRING"};
  options = {hash:{
    'classNames': ("hdr-user")
  },inverse:self.noop,fn:self.program(2, program2, data),contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  stack2 = ((stack1 = helpers.linkTo || (depth0 && depth0.linkTo)),stack1 ? stack1.call(depth0, "settings", options) : helperMissing.call(depth0, "linkTo", "settings", options));
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("\n");
  hashTypes = {};
  hashContexts = {};
  options = {hash:{},inverse:self.noop,fn:self.program(4, program4, data),contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  stack2 = ((stack1 = helpers.linkTo || (depth0 && depth0.linkTo)),stack1 ? stack1.call(depth0, "logout", options) : helperMissing.call(depth0, "linkTo", "logout", options));
  if(stack2 || stack2 === 0) { data.buffer.push(stack2); }
  data.buffer.push("\n<hr>\n");
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = '', hashTypes, hashContexts;
  data.buffer.push("\n<div class='hdr-user-name'></div>\nhi,\n");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "currentUser.username", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n");
  return buffer;
  }

function program4(depth0,data) {
  
  
  data.buffer.push("\nLogout?\n");
  }

function program6(depth0,data) {
  
  var buffer = '', hashContexts, hashTypes;
  data.buffer.push("\n<a class=\"button hdr-button-login\" href='' ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "loginButton", {hash:{
    'on': ("click")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n<strong>Login</strong>\n</a>\n");
  return buffer;
  }

function program8(depth0,data) {
  
  var buffer = '', stack1, hashTypes, hashContexts;
  data.buffer.push("\n<div class='alert alert-error'>\n  <h4 class='alert-header'>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "error.message", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</h4>\n  <ul>\n    ");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers.each.call(depth0, "e", "in", "error.errors", {hash:{},inverse:self.noop,fn:self.program(9, program9, data),contexts:[depth0,depth0,depth0],types:["ID","ID","ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n  </ul>\n</div>\n<hr>\n");
  return buffer;
  }
function program9(depth0,data) {
  
  var buffer = '', hashTypes, hashContexts;
  data.buffer.push("\n    <li>");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "e", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("</li>\n    ");
  return buffer;
  }

  hashTypes = {};
  hashContexts = {};
  stack1 = helpers['if'].call(depth0, "isLoggedIn", {hash:{},inverse:self.program(6, program6, data),fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers['if'].call(depth0, "error", {hash:{},inverse:self.noop,fn:self.program(8, program8, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n");
  hashTypes = {};
  hashContexts = {};
  data.buffer.push(escapeExpression(helpers._triageMustache.call(depth0, "outlet", {hash:{},contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n");
  return buffer;
  
});

Ember.TEMPLATES["index"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, hashContexts, hashTypes, escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = '', hashContexts, hashTypes;
  data.buffer.push("\n");
  hashContexts = {'todoBinding': depth0};
  hashTypes = {'todoBinding': "STRING"};
  data.buffer.push(escapeExpression(helpers.view.call(depth0, "PP.TodoView", {hash:{
    'todoBinding': ("todo")
  },contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n");
  return buffer;
  }

  data.buffer.push("<h1>Todos</h1>\n<form ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "create", {hash:{
    'on': ("submit")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n");
  hashContexts = {'valueBinding': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'valueBinding': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  data.buffer.push(escapeExpression(helpers.view.call(depth0, "Ember.TextField", {hash:{
    'valueBinding': ("new_todo_name"),
    'placeholder': ("Add a todo..."),
    'classNames': ("new-todo-name")
  },contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push("\n</form>\n");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers.each.call(depth0, "todo", "in", "todos", {hash:{},inverse:self.noop,fn:self.program(1, program1, data),contexts:[depth0,depth0,depth0],types:["ID","ID","ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n");
  return buffer;
  
});

Ember.TEMPLATES["login"] = Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, hashContexts, hashTypes, options, escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  
  data.buffer.push("\nLog in?\n");
  }

function program3(depth0,data) {
  
  
  data.buffer.push("\nJoin?\n");
  }

  data.buffer.push("<a href=\"\" ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "toggleSignup", {hash:{
    'on': ("click")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n");
  hashTypes = {};
  hashContexts = {};
  stack1 = helpers['if'].call(depth0, "isSignup", {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],hashContexts:hashContexts,hashTypes:hashTypes,data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n</a>\n<div ");
  hashContexts = {'class': depth0};
  hashTypes = {'class': "STRING"};
  options = {hash:{
    'class': ("isSignup::cb-hidden")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers['bind-attr'] || (depth0 && depth0['bind-attr'])),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "bind-attr", options))));
  data.buffer.push(">\n<form ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "signup", {hash:{
    'on': ("submit")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n<div class='form-item'>\n  <label for='username'>Username</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("signup_username"),
    'type': ("text"),
    'placeholder': ("Username"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n<div class='form-item'>\n  <label for='username'>Email</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("signup_email"),
    'type': ("email"),
    'placeholder': ("Email"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n<div class='form-item'>\n  <label for='username'>Password</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("signup_password"),
    'type': ("password"),
    'placeholder': ("Password"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n<div class='form-item'>\n  <label for='username'>Confirm Password</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("signup_password_confirmation"),
    'type': ("password"),
    'placeholder': ("Confirm password"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n");
  hashContexts = {'class': depth0,'type': depth0,'value': depth0};
  hashTypes = {'class': "STRING",'type': "STRING",'value': "STRING"};
  options = {hash:{
    'class': ("button button-action button-full"),
    'type': ("submit"),
    'value': ("Join Now")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</form>\n</div>\n<div ");
  hashContexts = {'class': depth0};
  hashTypes = {'class': "STRING"};
  options = {hash:{
    'class': ("isSignup:cb-hidden")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers['bind-attr'] || (depth0 && depth0['bind-attr'])),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "bind-attr", options))));
  data.buffer.push(">\n<form ");
  hashContexts = {'on': depth0};
  hashTypes = {'on': "STRING"};
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "login", {hash:{
    'on': ("submit")
  },contexts:[depth0],types:["STRING"],hashContexts:hashContexts,hashTypes:hashTypes,data:data})));
  data.buffer.push(">\n<div class='form-item'>\n  <label for='login_email'>Username or Email</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("login_email"),
    'type': ("text"),
    'placeholder': ("Username or Email"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n<div class='form-item'>\n  <label for='login_password'>Password</label>\n  ");
  hashContexts = {'value': depth0,'type': depth0,'placeholder': depth0,'classNames': depth0};
  hashTypes = {'value': "ID",'type': "STRING",'placeholder': "STRING",'classNames': "STRING"};
  options = {hash:{
    'value': ("login_password"),
    'type': ("password"),
    'placeholder': ("Password"),
    'classNames': ("input")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</div>\n");
  hashContexts = {'class': depth0,'type': depth0,'value': depth0};
  hashTypes = {'class': "STRING",'type': "STRING",'value': "STRING"};
  options = {hash:{
    'class': ("button button-action button-full"),
    'type': ("submit"),
    'value': ("Log In")
  },contexts:[],types:[],hashContexts:hashContexts,hashTypes:hashTypes,data:data};
  data.buffer.push(escapeExpression(((stack1 = helpers.input || (depth0 && depth0.input)),stack1 ? stack1.call(depth0, options) : helperMissing.call(depth0, "input", options))));
  data.buffer.push("\n</form>\n</div>\n");
  return buffer;
  
});