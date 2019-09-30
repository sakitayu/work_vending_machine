class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    # ジュースの初期在庫
    @juice = [{price: 120, name: "cola", stock: 5}, 
            {price: 100, name: "water", stock: 5}, 
            {price: 200, name: "redbull", stock: 5}]
    # 売り上げの初期設定
    @sales = 0
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

  # 投入金額、在庫の点で購入可能なドリンクのリストを取得するメソッド
  def possible_to_buy
    possible_to_buy = []
    @juice.each do |juice|
      if juice[:stock] >= 1
        if @slot_money >= juice[:price]
          possible_to_buy << juice[:name]
        else
          nil
        end
      end
    end
    puts possible_to_buy
  end
  
  def buy(juice) # 購入操作 文字列を数字に入れ替えることも検索
    case juice
    when "cola"
      if @slot_money >= 120 && @juice[0][:stock] >= 1
        @juice[0][:stock] -= 1
        @sales += 120
        change_m = @slot_money - 120
      else
      nil #何もしない
      end
    when "water"
      if @slot_money >= 100 && @juice[1][:stock] >= 1
        @juice[1][:stock] -= 1
        @sales += 100
        change_m = @slot_money - 100
      else
      nil #何もしない
      end
    when "redbull"
      if @slot_money >= 200 && @juice[2][:stock] >= 1
        @juice[2][:stock] -= 1
        @sales += 200
        change_m = @slot_money - 200
      else
      nil #何もしない
      end
    end
    p "コーラ、水、redbull それぞれの在庫"
    p @juice[0][:stock]
    p @juice[1][:stock]
    p @juice[2][:stock]
    p "売り上げ"
    p @sales
    p "お釣り"
    p change_m
  end

end





vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
vm.slot_money (100)
vm.slot_money (100)
vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
vm.current_slot_money
p "投入金額"
p vm.current_slot_money #
# 現在の投入金額を pull_money に代入  いらない消して
# pull_money = vm.current_slot_money  いらない消して

#  投入金額、在庫の点で購入可能なドリンクのリストを表示する
p "投入金額、在庫の点で購入可能なドリンク"
vm.possible_to_buy


# vm.buy("water")
# vm.buy("water")
# vm.buy("redbull")
vm.buy("cola")

vm.buy("water")