class AddNullFalseToTimeframesTime < ActiveRecord::Migration
  def up
    change_column :timeframes, :time, :string, null: false
  end

  def down
    change_column :timeframes, :time, :string
  end
end
