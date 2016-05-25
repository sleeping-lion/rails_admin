class AddFieldsToQuizzes < ActiveRecord::Migration
  def up
    add_column :quizzes, :type, :integer, :null => false, :default => 1
  end

  def down
    remove_column :quizzes, :type
  end
end
