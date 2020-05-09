class RemoveGradeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :grade
  end
end
