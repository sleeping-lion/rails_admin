class ChangeFieldsToQuizAnswer < ActiveRecord::Migration
  def change
   change_column :quiz_answers, :is_correct, :boolean, :null=>false, :default=>false
  end
end
