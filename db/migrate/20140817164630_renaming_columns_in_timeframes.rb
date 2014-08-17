class RenamingColumnsInTimeframes < ActiveRecord::Migration
  def up
    remove_column :timeframes, :time, :string
    add_column :timeframes, :hour, :integer, null: false
    add_column :timeframes, :am_pm, :string, null: false
  end

  def down
    add_column :timeframes, :time, :string, null: false
    remove_column :timeframes, :hour, :integer, null: false
    remove_column :timeframes, :am_pm, :string, null: false
  end
end
