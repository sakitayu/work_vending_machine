class Drink
  attr_reader :name,:price,:item,:stock,:drink_info,:vm
  def initialize(args)
    @name = args[:name]
    @price = args[:price]
    @stock = 0
    @vm = args[:vm]
    @drink_info = {name: @name,price: @price,stock: @stock}
    @vm.item_lists << @drink_info
  end
  
  def drink_stock(number)
    @stock += number
    item_listing()
  end
  
  def item_listing()
    @vm.item_lists.map { |key,value| key[:stock] = self.stock  if key[:name] == self.name}
  end
end

class Guest
  def select(drink)
    drink.vm.buy_drink(drink)
  end
end

class VendingMachine
  attr_reader :slot_money,:sales,:item_lists,:id
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize(args)
    @id = args[:id]
    @slot_money = 0
    @sales = 0
    @item_lists = []
  end

  def buy_drink(drink)
    if drink.stock > 0 && drink.vm.slot_money >= drink.price
      drink.drink_stock(-1)
      reduce_money(drink)
      record_money(drink)
    else
      nil
    end
  end

  def record_money(drink)
    @sales += drink.price
  end

  def reduce_money(drink)
    @slot_money -= drink.price
    return_money
  end
  
  def current_slot_money
    @slot_money
  end
  
  def slot(money)
    if MONEY.include?(money)
      @slot_money += money
    else
      money
    end
  end
  
  def return_money 
    slot_money = @slot_money
    @slot_money = 0
    slot_money
  end
  
  def total_sales
    @sales
  end
  
  def possible_to_buy_lists
    lists = self.item_lists.find_all {|key,value| (key[:price] <= self.slot_money) && (key[:stock] > 0)}
   Array[id: self.id].push(lists)
  end
end
