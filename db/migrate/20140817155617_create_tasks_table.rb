class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :schedule_id, null: false
      t.integer :timeframe_id, null: false
      t.string :description
    end
  end
end
