class AddNullFalseToTimeframesScheduleId < ActiveRecord::Migration
  def up
    change_column :timeframes, :schedule_id, :integer, null: false
  end

  def down
    change_column :timeframes, :schedule_id, :integer
  end
end
