require_relative '../views/orders_view'

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end


  def add
    # 1. Encontrar um meal escolhido pelo manager
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @orders_view.ask_index
    meal = meals[index]

    # 2. Encontrar um customer escolhido pelo manager
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @orders_view.ask_index
    customer = customers[index]

    # 3. Encontrar um rider pelo manager
    riders = @employee_repository.all_riders
    @orders_view.display_riders(riders)
    index = @orders_view.ask_index
    employee = riders[index]

    # 4. Criar uma instância de Order
    order = Order.new(meal: meal, customer: customer, employee: employee)

    # 5. Adicionar a Order ao repository
    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @orders_view.display(orders)
    index = @orders_view.ask_index
    order = orders[index]
    order.deliver!
    @order_repository.save_csv
  end


end
