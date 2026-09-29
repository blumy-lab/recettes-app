ALTER TABLE recipes
  ADD COLUMN nutrition_calories numeric,
  ADD COLUMN nutrition_proteins numeric,
  ADD COLUMN nutrition_fat numeric,
  ADD COLUMN nutrition_carbs numeric,
  ADD COLUMN nutrition_base integer;
