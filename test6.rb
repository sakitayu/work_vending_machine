@juice = [{price: 120, name: "cola", stock: 1}, # stockの値を変動させて実験
          {price: 100, name: "water", stock: 0}, # stockの値を変動させて実験
          {price: 200, name: "redbull", stock: 1}] # stockの値を変動させて実験

@juice[0][:stock] += 1
puts @juice[0][:stock]
puts @juice