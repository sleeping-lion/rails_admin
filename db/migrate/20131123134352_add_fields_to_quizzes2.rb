class AddFieldsToQuizzes2 < ActiveRecord::Migration
  def up
    add_column :quizzes, :full_description, :string, :null => true, :limit => 2000
  end

  def down
    remove_column :quizzes, :full_description
  end
end
