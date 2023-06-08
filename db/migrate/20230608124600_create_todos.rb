
class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :task
      t.boolean :completed, default: false
      t.boolean :is_editing, default: false

      t.timestamps null: false
    end
  end
end

