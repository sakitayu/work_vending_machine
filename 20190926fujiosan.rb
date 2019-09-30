# スーパークラスで商品の内容を定義
 class Product
  attr_reader :name, :price,:stock
  $total = 0
  def initialize(name, price,stock)
    @name = name
    @price = price
    @stock = stock
  end
end
# 実際の商品をスーパークラスを継承しサブクラスで定義
class Cola < Product
  attr_reader :name, :price,:stock
  def initialize()
    super(name = "cola",price = 120 ,stock = 5)
  end  
end

class Water < Product
  attr_reader :name, :price,:stock
  def initialize()
    super(name = "water",price = 100 ,stock =5)
  end  
end

class Redbull < Product
  attr_reader :name, :price,:stock
  def initialize()
    super(name = "redbull",price = 200 ,stock =5)    
  end  
end


class VendingMachine 
  attr_reader :slot_money
   MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    cola = Cola.new
    water = Water.new
    redbull = Redbull.new
    @slot_money = 0
    @total = 0
    @cola_stock = cola.stock
    @water_stock =  water.stock
    @redbull_stock = redbull.stock
   end 

  def money_in(money)
    if MONEY.include?(money)
      @slot_money += money
      # nil
    else
      puts "#{money}を受け付けません"
    end
  end  
  
  def return_money 
    slot_money = @slot_money
    @slot_money = 0
    puts "返却#{slot_money}円"
  end 

  def total
    puts "売上合計は#{@total}円"
  end  

  def stock_check(product)
    case product  
      when "cola"
      if @cola_stock > 0
        true
      else
        nil
      end
      when "water"
      if @water_stock > 0
        true
      else
        nil
      end
      when "redbull"
      if @redbull_stock > 0
        true
      else
        nil
      end
    end  
  end    

  def buy_thing(product)
   if stock_check(product)
      case product  
        when "cola"
          cola = Cola.new
          if cola.price <= self.slot_money
            @slot_money -= cola.price
            @total += cola.price
            @cola_stock -= 1
          else 
            nil
          end
        
        when "water"
          water = Water.new
          if water.price <= self.slot_money
            @slot_money -= water.price
            @total += water.price
            @water_stock -= 1
          else 
            nil
          end
        
        when "redbull"
          redbull = Redbull.new
   
          if redbull.price <= self.slot_money
            @slot_money -= redbull.price
            @total += redbull.price
            @redbull_stock -= 1
          else 
          nil
        end
      end  
    else 
      puts "在庫なし"
    end        
end
end

vm = VendingMachine.new
vm.money_in(111)
vm.money_in(100)
# 買える商品で在庫がある商品を表示する機能を追加する必要あり?
vm.money_in(500)
vm.money_in(10000)
vm.money_in(1000)
vm.buy_thing("cola")
vm.buy_thing("cola")
vm.buy_thing("cola")
vm.buy_thing("cola")
vm.buy_thing("cola")
vm.buy_thing("water")
vm.buy_thing("redbull")
vm.buy_thing("cola")
vm.buy_thing("cola")

#　お釣りボタン押す
vm.return_money
#　お釣りボタン押す
vm.return_money
# 合計金額出す
vm.total

#以下出力
#111を受け付けません
#10000を受け付けません
#在庫なし
#在庫なし
#返却700円
#返却0円
#売上合計は900円