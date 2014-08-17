class AddNullFalseToTasksDescription < ActiveRecord::Migration
  def up
    change_column :tasks, :description, :string, null: false
  end

  def down
    change_column :tasks, :description, :string
  end
end
