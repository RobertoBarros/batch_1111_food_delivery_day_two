class MealsView

  def ask_name
    puts "Enter meal name:"
    gets.chomp
  end

  def ask_price
    puts "Enter meal price:"
    gets.chomp.to_i
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - R$ #{meal.price}"
    end
  end
end
