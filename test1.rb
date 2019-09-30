slot_money = 0


cola = {price: 100, stock: 5}
p cola

def stock(drink)
  drink[:stock] -= 1
end

# def sales(drink)
#   slot_money += drink[:price]
# end

stock(cola)
# sales(cola)

p cola

stock(cola)

p cola

#メソッドで複数の値を出すには配列かハッシュがいいかも