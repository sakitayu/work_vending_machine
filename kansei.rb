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
    return possible_to_buy
  end
  
  def buy(juice) # 購入操作 文字列を数字に入れ替えることも視野に入れてます
    case juice
    when "cola"
      if @slot_money >= 120 && @juice[0][:stock] >= 1
        @juice[0][:stock] -= 1
        @sales += 120
        @slot_money -= 120
      else
      nil #何もしない
      end
    when "water"
      if @slot_money >= 100 && @juice[1][:stock] >= 1
        @juice[1][:stock] -= 1
        @sales += 100
        @slot_money -= 100
      else
      nil #何もしない
      end
    when "redbull"
      if @slot_money >= 200 && @juice[2][:stock] >= 1
        @juice[2][:stock] -= 1
        @sales += 200
        @slot_money -= 200
      else
      nil #何もしない
      end
    end
    # p "コーラ、水、redbull それぞれの在庫"
    # p @juice[0][:stock]
    # p @juice[1][:stock]
    # p @juice[2][:stock]
    # p "売り上げ"
    # p @sales
    # p "お釣り"
    # p @slot_money
  end

end





# irbで順番に実行してみてください

# ①irbを立ち上げる
# require '/Users/sakitayu/workspace/work_vending_machine/kansei.rb'
# （↑のパスは、このkansei.rbファイルが入っているパスを指定してください）

# ②初期設定（自動販売機インスタンスを作成して、vmという変数に代入します）
# vm = VendingMachine.new

# ③作成した自動販売機に下記の順番でお金を入れる (10, 50, 100, 500, 1000以外は入力しても加算されません)
# vm.slot_money (100)
# vm.slot_money (100)
# vm.slot_money (500)
# vm.slot_money (1000)

# ④作成した自動販売機に入れたお金がいくらかを表示する (→今回は1700になります)
# vm.current_slot_money

# ⑤投入金額、在庫の点で購入可能なドリンクのリストを表示する (["cola", "water", "redbull"]になります)
# vm.possible_to_buy

# ⑥購入操作で返り値に釣り銭を出力する (→コーラ/水は１つずつ購入、redbullだけ５つ購入して在庫を0にしてます)
# vm.buy("cola")
# vm.buy("water")
# vm.buy("redbull")
# vm.buy("redbull")
# vm.buy("redbull")
# vm.buy("redbull")
# vm.buy("redbull")

# ⑦投入金額、在庫の点で購入可能なドリンクのリストを再度表示する (["cola", "water"]になります)
# vm.possible_to_buy

# ⑧作成した自動販売機に入れたお金を返してもらう (480のお釣りになります)
# vm.return_money

# ⑨自動販売機に今現在入っているいお金を表示する（0になります）
# vm.current_slot_money
