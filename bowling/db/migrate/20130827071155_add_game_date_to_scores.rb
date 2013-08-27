class AddGameDateToScores < ActiveRecord::Migration
  def change
    add_column :scores, :game_date, :datetime
  end
end
