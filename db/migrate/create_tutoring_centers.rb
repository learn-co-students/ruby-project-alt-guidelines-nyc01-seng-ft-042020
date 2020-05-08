class CreateTutoringCenters < ActiveRecord::Migration[5.2]
    def change
      create_table :tutoring_centers do |t|
        t.string :name
        t.string :city
        t.string :state
      end
    end
  end

  # 