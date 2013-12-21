class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.boolean :priority, default: false
      t.string :name
      t.date :due_at
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
