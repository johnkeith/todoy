class CreateTimeframes < ActiveRecord::Migration
  def change
    create_table :timeframes do |t|
      t.integer :schedule_id
      t.string :time
      t.timestamps
    end
  end
end
