class CreateRecipes < ActiveRecord::Migration[4.2]
    def change
      create_table :recipes do |t|
        t.string :name
        t.string :meal_type
        t.string :directions
      end
    end
  end