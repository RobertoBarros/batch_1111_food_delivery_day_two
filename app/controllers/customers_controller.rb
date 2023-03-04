require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # Perguntar o name e o address do customer
    name = @view.ask_name
    address = @view.ask_address

    # Criar um novo objeto customer
    new_customer = Customer.new(name: name, address: address)

    # Mando o customer repository armazenar o objeto customer
    @customer_repository.create(new_customer)
  end

  def list
    # Pegar todos os customers do repository
    customers = @customer_repository.all

    # Mandar a view exibir o array de customers
    @view.display(customers)
  end
end
