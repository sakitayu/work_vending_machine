# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。
# 例
# irb
# require ‘/Users/yamamotoshou/workspace/pea_work/sample.rb’
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）
# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money
class VendingMachine
  attr_accessor :carts
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    self.carts = [
      Cart.new(
        name: “コーラ“,
        price: 120,
        number: 5
      ),
      Cart.new(
        name: “ペプシ“,
        price: 140,
        number: 2
      ),
      Cart.new(
        name: “ファンタ“,
        price: 180,
        number: 100
      )
    ]
  end
  def get_drinks_info
    self.carts.map { |cart|
      # cokes = Cart.new(
      #   name: “コーラ“,
      #   price: 120,
      #   number: 5
      # )
      # cokes.name
      # cokes.price
      # cokes.number
       {
        name: cart.name,
        price: cart.price,
        number: cart.number
      }
    }
    # results = []
    # self.carts.each { |cart|
    #    results.push({
    #     name: cart.name,
    #     price: cart.price,
    #     number: cart.number
    #   })
    # }
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    if MONEY.include?(money)
    # 自動販売機にお金を入れる
      @slot_money += money
      nil
    else
      money
    end
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    slot_money = @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
    # 返すお金の金額を表示する
    slot_money
  end
end
class Cart
  attr_accessor :drinks
  attr_accessor :name
  attr_accessor :price
  attr_accessor :number # 在庫数
  def initialize(name: nil, price: nil, number: nil)
    return if (name.nil? || price.nil? || number.nil?)
    self.drinks = Array.new(number) { |i| Drink.new(name: name, price: price) }
    # [Drink.new(name: “コーラ“, price: 120), Drink.new(name: “コーラ“, price: 120) , Drink.new(name: “コーラ“, price: 120), Drink.new(name: “コーラ“, price: 120) ...]
    self.name = name
    self.price = price
    self.number = number
  end
end
class Drink
  attr_accessor :name
  attr_accessor :price
  def initialize(name: nil, price: nil)
    return if (name.nil? || price.nil?)
    self.name = name
    self.price = price
  end
end
v = VendingMachine.new()
p v.get_drinks_info