class RemoveTasksTableAddTaskToTimeframes < ActiveRecord::Migration
  def up
    drop_table :tasks
    add_column :timeframes, :task, :text
  end

  def down
    create_table :tasks do |t|
      t.integer :timeframe_id, null: false
      t.string :description
      t.timestamps
    end
    remove_column :timeframes, :task
  end
end
