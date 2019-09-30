# 在庫確認クラス
# 在庫がゼロの場合配列から外す

current_slot_money = 120 # ここの値を変動させて実験

@juice = [{price: 120, name: "cola", stock: 1}, # stockの値を変動させて実験
          {price: 100, name: "water", stock: 0}, # stockの値を変動させて実験
          {price: 200, name: "redbull", stock: 1}] # stockの値を変動させて実験



# 投入金額、在庫の点で購入可能なドリンクのリストを取得
possible_to_buy = []
@juice.each do |juice|
  if juice[:stock] >= 1
    if current_slot_money >= juice[:price]
      possible_to_buy << juice[:name]
    else
      nil
    end
  end
end

puts possible_to_buy


# ↓そもそも自動販売機はこんな表示しない
# if possible_to_buy.empty?
#   puts "購入できるドリンクはありあせん"
# else
#   puts "以下のドリンクを購入できます"
#   puts possible_to_buy
# end

# p @drinks[1][:stock]