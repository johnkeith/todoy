class CreateSchedulesTable < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.string :day_of_week, null: false
      t.text :description
    end
  end
end
