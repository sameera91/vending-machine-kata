class VendingMachine

  attr_accessor :total_coin_value, :cola_quantity, :chips_quantity, :candy_quantity

  COLA = 1.00
  CHIPS = 0.50
  CANDY = 0.65

  def initialize
    @total_coin_value = 0 
    @cola_quantity = 10
    @chips_quantity = 10
    @candy_quantity = 10
  end

  def insert_coin
    input = ""
    until input === "exit"
      puts "Enter a coin. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product."
      input = gets.strip
      if input === "nickel" || input === "dime" || input === "quarter"
        puts "valid coin."
        coin_weight_size(input)
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
        if @total_coin_value >= COLA
          calculate_change(@cola_quantity, COLA)
        else
          puts "PRICE = #{COLA}"
        end
      elsif input === "chips"
        if @total_coin_value >= CHIPS
          calculate_change(@chips_quantity, CHIPS)
        else
          puts "PRICE = #{CHIPS}"
        end
      elsif input === "candy"
        if @total_coin_value >= CANDY
          calculate_change(@candy_quantity, CANDY)
        else
          puts "PRICE = #{CANDY}"
        end
      else
        puts "Invalid product."
     end
   end
  end

  def calculate_change(quantity, product)
    puts "THANK YOU."
    quantity = quantity - 1
    change_value = @total_coin_value - product
    @total_coin_value = change_value
    puts "Your change is: #{change_value}" 
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