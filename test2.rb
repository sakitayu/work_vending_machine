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

juice_management = JuiceManagement.new
juice_management.redbull




# juce = [{price: 120, name: "cola", stock: 5}, 
#         {price: 100, name: "water", stock: 5}, 
#         {price: 200, name: "redbull", stock: 5}]

# p juce[0][:name]