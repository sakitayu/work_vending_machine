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
  attr_reader :slot_money,:sales,:item_lists,:id,:vm
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize(args)
    @id = args[:id] || 0
    @slot_money = 0
    @sales = 0
    @item_lists = []
  end

  def buy_drink(drink)
    if drink.stock > 0
      if drink.vm.slot_money >= drink.price
      drink.drink_stock(-1)
      reduce_money(drink)
      record_money(drink)
      end  
    else
      nil
    end
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
# 客をインスタンス化
guest = Guest.new
# 自販機にIDをつける
vm1 = VendingMachine.new(id: 1)
# その自販機が扱う商品を定義
cola = Drink.new(vm:vm1,name:"cola",price:120)
water = Drink.new(vm:vm1,name:"water",price:100)
redbull = Drink.new(vm:vm1,name:"redbull",price:200)
# その自販機が扱う商品を数量分ストック
cola.drink_stock(5)
water.drink_stock(5)
redbull.drink_stock(5)
# その自販機にお金を入れる
vm1.slot(100)
# その客がその自販機の商品の購入ボタンを押す
guest.select(water)
vm1.slot(100)
guest.select(water)
vm1.slot(100)
# 購入できる商品リストを返す
p vm1.possible_to_buy_lists
vm1.slot(1000)
p vm1.possible_to_buy_lists
