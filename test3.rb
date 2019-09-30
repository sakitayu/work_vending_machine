class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
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

# ステップ2  ジュースの管理

class JuiceManagement
  def initialize
    @juice = [{price: 120, name: "cola", stock: 5}, 
            {price: 100, name: "water", stock: 5}, 
            {price: 200, name: "redbull", stock: 5}]
  end

  def cola
    @juice[0]
    # ↓デバッグ用なんであとでコメントアウト↓
    p @juice[0]
  end

  def water
    @juice[1]
    # ↓デバッグ用なんであとでコメントアウト↓
    p @juice[1]
  end

  def redbull
    @juice[2]
    # ↓デバッグ用なんであとでコメントアウト↓
    p @juice[2]
  end

end

# juice_management = JuiceManagement.new
# juice_management.redbull

# ステップ3 購入 & ステップ4 機能拡張

# def possible_to_buy(put_money, 在庫) #購入できるかリスト取得
#   drinks_possible_to_buy = []
#   if 投入金額 >= 120 && コーラの在庫 >= 1 &&
#     drinks_possible_to_buy << "cola"
#   elsif 投入金額 >= 100 && 水の在庫 >= 1
#     puts "水を購入できます"
#   elsif 投入金額 >= 200 && レッドブルの在庫 >= 1
#     puts "レッドブルを購入できます"
#   else
#     nil
#   end
# end

def buy(juice) # 購入操作
  case juice
  when cola
    if 投入金額 >= 120 && コーラの在庫 >= 1
      コーラの在庫 -= 1
      売り上げ金額 += コーラの金額
    else
    nil #何もしない
    end
  when water
    if 投入金額 >= 100 && 水の在庫 >= 1
      水の在庫 -= 1
      売り上げ金額 += 水の金額
    else
    nil #何もしない
    end
  when redbull
    if 投入金額 >= 100 && レッドブルの在庫 >= 1
      レッドブルの在庫 -= 1
      売り上げ金額 += レッドブルの金額
    else
    nil #何もしない
    end
  end
end

def current_sales # 現在の売り上げを取得
  current_sum
end

def change_money # 払い戻し操作
  投入金額 - コーラの金額
end


# vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
# vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

#buy = Buy.new

# vm.buy ()


vm = VendingMachine.new
vm.slot_money (100)
tonyu_money = vm.current_slot_money