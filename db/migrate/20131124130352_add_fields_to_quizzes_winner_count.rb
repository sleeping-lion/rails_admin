class AddFieldsToQuizzesWinnerCount < ActiveRecord::Migration
  def up
    add_column :quizzes, :winner_count, :integer, :null => true, :default => 1
  end

  def down
    remove_column :quizzes, :winner_count
  end
end
