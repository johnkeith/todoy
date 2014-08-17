class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :timeframe_id, null: false
      t.string :description
      t.timestamps
    end
  end
end
