class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |t|
        t.string :username 
        t.string :name
        t.integer :grade
        t.string :city
        t.string :state 
      end
    end
  end

  # 