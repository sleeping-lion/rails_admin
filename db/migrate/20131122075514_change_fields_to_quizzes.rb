class ChangeFieldsToQuizzes < ActiveRecord::Migration
  def up
    remove_column :quizzes, :type
    add_column :quizzes, :quiz_type, :integer, :null => false, :default => 1
  end

  def down
    remove_column :quizzes, :quiz_type
  end
end
