json.data do

  json.todos do
    json.complete do
      json.array!(@todos[:complete]) do |todo|
        json.partial! "todo", todo: todo
      end
    end

    json.incomplete do
      json.array!(@todos[:incomplete]) do |todo|
        json.partial! "todo", todo: todo
      end
    end
  end
end