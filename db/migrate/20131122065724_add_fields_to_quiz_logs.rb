class AddFieldsToQuizLogs < ActiveRecord::Migration
  def change
    add_column :quiz_logs, :winner_flag, :integer, :null => false, :default => 0
  end

  def down
    remove_column :quiz_logs, :winner_flag
  end
end
