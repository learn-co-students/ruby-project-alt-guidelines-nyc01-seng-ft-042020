

def greet
    puts 'Welcome to MPA, the best resource for recipe mealplanning in the world!'
  end
   
  greet

  puts "Need a recipe for something you already have in the house?"
  puts "Enter the ingredient name to get started!"
  ingredient = gets
  print "Ok, let's find a recipes that uses #{ingredient}!"

#   Recipe.find()
      # SELECT recipes.name 
      # FROM recipes
      # INNER JOIN recipes_ingredients 
      # ON recipe.id = 
      # recipe_id where ingredient_id matches ingredient above
      # return a list of recipes

#   binding.pry