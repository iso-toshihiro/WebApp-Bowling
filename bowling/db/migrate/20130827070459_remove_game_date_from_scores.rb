class RemoveGameDateFromScores < ActiveRecord::Migration
  def up
    remove_column :scores, :game_date
  end

  def down
    add_column :scores, :game_date, :time
  end
end
