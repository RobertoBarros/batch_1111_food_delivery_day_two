require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Perguntar o name e o price do meal
    name = @view.ask_name
    price = @view.ask_price

    # Criar um novo objeto meal
    new_meal = Meal.new(name: name, price: price)

    # Mando o meal repository armazenar o objeto meal
    @meal_repository.create(new_meal)
  end

  def list
    # Pegar todos os meals do repository
    meals = @meal_repository.all

    # Mandar a view exibir o array de meals
    @view.display(meals)
  end
end
