class VendingMachine
  attr_reader:slot_money
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
  end 
  def current_slot_money
    @slot_money
  end
  def money_in(money)
    if MONEY.include?(money)
      @slot_money += money
      nil
    else
      money
    end
  end  
  def return_money 
    slot_money = @slot_money
    @slot_money = 0
    slot_money
  end
end
# ここまでがデフォルトコード  
​
​
​
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
# スーパークラスを継承しサブクラスで各商品を定義
# インスタンス化するごとに在庫を１減らす
class Cola < Product
  attr_reader :name, :price,:stock,:total
  def initialize()
    super(name = "cola",price = 120 ,stock = 5)
    @stock -= 1
  end  
end

class Water < Product
  attr_reader :name, :price,:stock,:total
  def initialize()
    super(name = "water",price = 100 ,stock =5)
    @stock -= 1
  end  
end

class Redbull < Product
  attr_reader :name, :price,:stock,:total
  def initialize()
    super(name = "redbull",price = 200 ,stock =5)
    @stock -= 1
​
    
  end  
end

# 商品の在庫チェッククラス、can_buyメソッドでtrue,falseを返す  
class Check
  def can_buy?(product)
    case product  
      when "cola"
        cola = Cola.new
        if cola.stock >=0
          true
        else nil 
        end  
      
      when "water"
        water = Water.new
        if water.stock >=0
          true
        else nil 
        end
       
      when "redbull"
        redbull = Redbull.new
        if redbull.stock >=0
          true
        else nil
        end  
      end
  end
end 
​
# 売り上げ総額を求めるクラス、グローバル変数を使用
# class Total
#   def total_check()
#     $total
#   end 
# end   
​
# 商品購入クラス、商品の在庫をチェックし、買える場合は売り上げ計上する。（開発途中）
# class Buy
#   def buy_thing(product,money)
#     check = Check.new
#     if check.can_buy?(product)
#       vm = VendingMachine.new
#       vm.money_in(money)
#       case product  
#       when "cola"
#         cola = Cola.new 
#         if cola.price == vm.slot_money
# ​
#         $total += cola.price
#           puts "ちょうど買えた"
# ​
#         elsif cola.price < vm.slot_money
#           $total += cola.price
#           puts "お釣り"
#         else 
#           puts "足りない"
#         end
#       when "water"
#         water = Water.new 
#         if water.price == vm.slot_money
#         $total += water.price
#           puts "ちょうど買えた"
#         elsif water.price < vm.slot_money
#           $total += water.price
#           puts "お釣り"
#         else 
#           puts "足りない"    
#         end
#       when "redbull"
#         redbull = Redbull.new 
#         if redbull.price == vm.slot_money
#           $total += redbull.price
#           puts "ちょうど買えた"
#         elsif redbull.price < vm.slot_money
#           $total += redbull.price
#           puts "お釣り"
#         else 
#           puts "足りない"    
#         end
#       end  
#     else 
#       puts "在庫なし"
#   end        
# end
# end  
​
# 商品名と金額を引数に入れる
# buy = Buy.new
# buy.buy_thing("cola",100)
# buy.buy_thing("water",100)
# buy.buy_thing("redbull",1000)

# water.buy
# water.buy
# cola.buy
# redbull.buy みたいにする感じで開発する→在庫が変動する


cola = Cola.new

cola

class VendingMachine