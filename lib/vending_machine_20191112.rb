class Drink
  attr_reader :name,:price,:item,:stock,:info
  def initialize(vm,name,price)
    @name = name
    @price = price
    @stock = 0
    @id = 0
    @info = {name: @name,price: @price,stock: @stock}
    vm.item_lists << @info
  end
  
  def drink_stock(vm,number)
    @stock += number
    item_listing(vm)
  end
  
  def item_listing(vm)
    vm.item_lists.map { |key,value| key[:stock] = self.stock  if key[:name] == self.name}
  end
end

class Guest
  def buy(vm,drink)
    if drink.stock > 0
      if vm.slot_money >= drink.price
      drink.drink_stock(vm,-1)
      vm.reduce_money(drink)
      vm.record_money(drink)
      end  
    else
      nil
    end
  end
end

class VendingMachine
  attr_reader :slot_money,:sales,:item_lists,:id
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize(id)
    @id = id
    @slot_money = 0
    @sales = 0
    @item_lists = []
  end
  # 売り上げ計上
  def record_money(drink)
    @sales += drink.price
  end
  # @slot_moneyから商品額を減らしお釣りを返す
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
    vm_id = Array[id: self.id]
    vm_id.push(lists)
  end
end
# # 客をインスタンス化
# guest = Guest.new
# # 引数は自販機のIDとなる
# vm1 = VendingMachine.new(1)
# # その自販機が扱う商品を定義
# vm1_cola = Drink.new(vm1,"cola",120)
# vm1_water = Drink.new(vm1,"water",100)
# vm1_redbull = Drink.new(vm1,"redbull",200)
# # その自販機が扱う商品を数量分ストック
# vm1_cola.drink_stock(vm1,5)
# vm1_water.drink_stock(vm1,5)
# vm1_redbull.drink_stock(vm1,5)
# # その自販機にお金を入れる
# vm1.slot(1000)
# # その客がその自販機の商品の購入ボタンを押す
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_cola)
# vm1.slot(1000)
# guest.buy(vm1,vm1_water)
# vm1.slot(1000)
# # 購入できる商品リストを返す
# p vm1.possible_to_buy_lists
