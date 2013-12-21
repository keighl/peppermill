class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.integer :priority, default: 0
      t.string :name
      t.date :due_at
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
