class CreateEnrollments < ActiveRecord::Migration[5.2]
    def change
      create_table :enrollments do |t|
        t.integer :user_id
        t.integer :tc_id
        t.string :status
        t.string :semester_of_enrollment 
      end
    end
  end

  # 