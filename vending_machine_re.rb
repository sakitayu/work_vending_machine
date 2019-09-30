# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# 例

# irb
# require '/Users/shibatadaiki/work_shiba/full_stack/sample.rb'
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
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
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

  # 格納されているジュースの情報（値段と名前と在庫）を取得する
  def management
    # cola = {price: 120, name: "コーラ", stock: 5}
    @cola = [120, "コーラ", 5] # ← colaに再代入して更新したい
    return @cola
    # 現在の売上金額を取得する
    #return @cola[0] * @cola[2]
  end

  # 投入金額、在庫の点で、コーラが購入できるかどうかを取得する
  def possible_to_buy(price, stock)
    # @slot_money
    # @cola[2]
    if stock == 0 || price < 120
      puts "購入できません" # あとでfalseを出力に書き換える
    else
      puts "購入できます" # あとでtrueを出力に書き換える
    end
    # 投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない↑
  end

  # 現在の売上金額を取得する。
  def sales
    return @cola[0] * @cola[2]
  end

end

#Class Management
#  COLA = [{product: "コーラ", price "120"}, {product: "コーラ", price "120"},{product: "コーラ", price "120"}, {product: "コーラ", price "120"}, {product: "コーラ", price "120"}]
#  COLA.length
#end

#Class Juice
#  JUICE = [{product: "コーラ", price: 120}]
#
#end
#Class Sales
#
#end