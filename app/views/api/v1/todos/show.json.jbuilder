json.data do

  json.current_user do
    json.partial! "api/v1/users/user", user: current_user
  end

  json.todo do
    json.partial! "todo", todo: @todo
  end
end