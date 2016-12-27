class VendingMachine

  attr_accessor :total_coin_value

  def initialize
    @total_coin_value = 2 
  end

  def insert_coin
    input = ""
    until input === "exit"
      puts "Enter a coin. Valid options include: nickel, dime, quarter."
      input = gets.strip
      if input === "nickel" || input === "dime" || input === "quarter"
        puts "valid coin."
        coin_weight_size(input)
      elsif input === "exit"
        puts "bye."
      else
        puts "invalid coin."
      end
    end
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