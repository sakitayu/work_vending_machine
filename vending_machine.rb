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





vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

