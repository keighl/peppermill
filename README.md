# PepperMill

PepperMill is a simple Todo app written with Ember.js, and a Rails API behind it. I wrote the first version in under 48 hours (check the commits!).

### Running

```
$ git clone https://github.com/keighl/peppermill
$ cd peppermill
$ bundle install
$ bundle exec foreman start
```

# PepperMill API

## Authentication

All API requests must be authenticated to user by supplying a valid API token. You can find your API token on the bottom of your settings page.

**Note: The signup and login endpoints don't require authentication**

To supply your key, simply append it as a `token` paramter to the request:

```
/api/v1/todos?token=YOUR_API_KEY
```

## Object Payloads

**Todo**

```
{
  id: 30324,
  name: "Buy cheese for grandma!",
  complete: false,
  priority: false,
  due_at: "2013-12-22",
  created_at: "2013-12-22 20:18:00 UTC"
}
```

**User**

```
{
  id: 13,
  created_at: "2013-12-22T20:16:52Z",
  username: "keighl",
  email: "keighl@example.com",
  token: "ew4hXvhBZtQU....."
}
```

**Error**

```
{
  message: "Oh snap!",
  errors: "Your credentials are invalid"
}
```

## Endpoints

**GET /api/v1/todos**

```
Request Options:
{
  sort: by_by_incomplete|by_priority|by_due_date
}

Response: (200)

{
  data: {
    current_user: USER,
    todos: [
      TODO,
      TODO,
    ]
  }
}
```

**GET /api/v1/todo**

```
Response: (200)

{
  data: {
    current_user: USER,
    todo: TODO
  }
}
```

**POST /api/v1/todo**

```
Request Options:
{
  todo: {
    name: 'Buy grandma cheese',
    due_at: '2014-01-01',
    complete: false,
    priority: false
  }
}

Response: (201)

{
  data: {
    current_user: USER,
    todo: TODO
  }
}
```

**PUT /api/v1/todo/ID**

```
Request Options:
{
  todo: {
    name: 'Buy grandma cheese',
    due_at: '2014-01-01',
    complete: false,
    priority: false
  }
}

Response: (200)

{
  data: {
    current_user: USER,
    todo: TODO
  }
}
```

**GET /api/v1/me**

```
Response: (200)

{
  data: {
    current_user: USER,
    user: USER
  }
}
```

**PUT /api/v1/me**

```
Request Options:
{
  user: {
    username: 'grandma',
    email: 'grandma@example.com',
    password: 'cheese',
    password_confirmation: 'cheese'
  }
}

Response: (200)

{
  data: {
    current_user: USER,
    user: USER
  }
}
```

**POST /api/v1/users**

```
Request Options:
{
  user: {
    username: 'grandma',
    email: 'grandma@example.com',
    password: 'cheese',
    password_confirmation: 'cheese'
  }
}

Response: (201)

{
  data: {
    current_user: USER,
    user: USER
  }
}
```

**POST /api/v1/users/login**

```
Request Options:
{
  email: 'grandma', // accepts username too
  password: 'cheese'
}

Response: (200)

{
  data: {
    current_user: USER,
    user: USER
  }
}
```
