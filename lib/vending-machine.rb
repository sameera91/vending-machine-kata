class VendingMachine

  attr_accessor :total_coin_value, :cola_quantity, :chips_quantity, :candy_quantity, :intial_change_value

  COLA = 1.00
  CHIPS = 0.50
  CANDY = 0.65

  def initialize
    @total_coin_value = 0 
    @initial_change_value = 3.00
    @cola_quantity = 10
    @chips_quantity = 10
    @candy_quantity = 10
  end

  def insert_coin
    input = ""
    until input === "exit"
      if @initial_change_value === 0
        puts "EXACT CHANGE ONLY. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you want to your coins to be returned."
      else
        puts "INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you want to your coins to be returned."
      end
      input = gets.strip
      if input === "nickel" || input === "dime" || input === "quarter"
        coin_weight_size(input)
      elsif input === "return coins"
        return_coins
      elsif input === "select product"
        select_product
      elsif input === "exit"
        puts "bye."
      else
        puts "invalid coin."
      end
    end
  end

  def select_product
    input = ""
    until input === "exit"
      puts "Select a product. Valid options include: cola, chips or candy."
      input = gets.strip
      if input === "cola"
        if !sold_out?(@cola_quantity)
          if @total_coin_value >= COLA
            calculate_change(@cola_quantity, COLA)
          else
            puts "PRICE = #{COLA}"
          end
        else
          puts "This product is sold out. Please select another one."
        end
      elsif input === "chips"
        if !sold_out?(@chips_quantity)
          if @total_coin_value >= CHIPS
            calculate_change(@chips_quantity, CHIPS)
          else
            puts "PRICE = #{CHIPS}"
          end
        else
          puts "This product is sold out. Please select another one."
        end
      elsif input === "candy"
        if !sold_out?(@candy_quantity)
          if @total_coin_value >= CANDY
            calculate_change(@candy_quantity, CANDY)
          else
            puts "PRICE = #{CANDY}"
          end
        else
          puts "This product is sold out. Please select another one."
        end
      else
        puts "Invalid product."
     end
   end
  end

  def return_coins
    if @total_coin_value != 0
      @total_coin_value = 0
      puts "Your coins have been returned."
    else
      puts "No coins to return."
    end
  end

  def sold_out?(product)
    if product === 0
      true
    else 
      false
    end
  end

  def calculate_change(quantity, product)
    quantity = quantity - 1
    coin_return = @total_coin_value - product
    @total_coin_value = coin_return
    @intial_change_value = @initial_change_value - coin_return
    puts "THANK YOU. Your change is: #{coin_return}" 
  end

  def coin_weight_size(input)
    if input === "nickel"
      weight = "5.00 g"
      size = "21.21 mm"
    elsif input === "dime"
      weight = "2.27 g"
      size = "17.90 mm"
    elsif input == "quarter"
      weight = "5.67 g"
      size = "24.26 mm"
    end

    coin_value(weight, size)
  end

  def coin_value(weight, size)
    coins = { ["5.00 g", "21.21 mm"] => 0.05,
              ["2.27 g", "17.90 mm"] => 0.10,
              ["5.67 g", "24.26 mm"] => 0.25}

    coins.each do |key, value|
      if weight === key[0] and size === key[1]
        coin_value = value
        total_value(coin_value)
      end
    end
  end

  def total_value(coin_value)
      @total_coin_value = @total_coin_value + coin_value
    
      puts @total_coin_value
  end

end