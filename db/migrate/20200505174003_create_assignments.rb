class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |a|
      a.string :task
      a.integer :grade
      a.integer :student_id
      a.integer :teacher_id
    end
  end
end
