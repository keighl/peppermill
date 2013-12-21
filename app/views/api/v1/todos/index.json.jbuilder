json.data do

  json.current_user do
    json.partial! "api/v1/users/user", user: current_user
  end

  json.todos do
    json.array!(@todos) do |todo|
      json.partial! "todo", todo: todo
    end
  end
end