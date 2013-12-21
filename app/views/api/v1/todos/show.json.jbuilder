json.data do

  json.todo do
    json.partial! "todo", todo: @todo
  end
end