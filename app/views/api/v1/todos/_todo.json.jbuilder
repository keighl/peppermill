json.(todo, :id, :name, :complete, :priority)

json.due_at todo.due_at.to_s

json.created_at todo.created_at.to_s