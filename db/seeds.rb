
Ingredient.create(name: Faker::Name.name)
Recipe.create(name: Faker::Company.name)
RecipesIngredients.create(recipe_id: Recipe.all.sample.id, ingredient_id: Ingredient.all.sample.id)

