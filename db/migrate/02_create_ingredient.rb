class CreateIngredient < ActiveRecord::Migration[5.2]
    def change
      create_table :ingredient do |t|
        t.string :name
      end
    end
  end