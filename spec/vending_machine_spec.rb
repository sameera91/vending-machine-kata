require_relative '../lib/vending-machine.rb'
require 'pry'

describe VendingMachine do
  describe 'lib/vending-machine.rb' do
    it 'accepts coins so that I can collect money from the customer' do
      vendingmachine = VendingMachine.new
      expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like to your coins to be returned. Enter 'exit' if you would like to exit.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("quarter")
      expect($stdout).to receive(:puts).with(0.25)
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).with("bye.")
      vendingmachine.insert_coin
    end

    it 'rejects invalid coins' do
      vendingmachine = VendingMachine.new
      expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like to your coins to be returned. Enter 'exit' if you would like to exit.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("penny")
      expect($stdout).to receive(:puts).with("Invalid coin.")
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).with("bye.")
      vendingmachine.insert_coin
    end

    it 'allows customers to select products' do
      vendingmachine = VendingMachine.new
      expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like to your coins to be returned. Enter 'exit' if you would like to exit.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("quarter")
      expect($stdout).to receive(:puts).with(0.25)
      expect(vendingmachine).to receive(:gets).and_return("quarter")
      expect($stdout).to receive(:puts).with(0.50)
      expect(vendingmachine).to receive(:gets).and_return("select product")
      expect($stdout).to receive(:puts).with("SELECT PRODUCT. Valid options include: cola, chips or candy. Enter exit if you would like to go back.")
      expect(vendingmachine).to receive(:gets).and_return("chips")
      expect($stdout).to receive(:puts).with("THANK YOU. Your change is: 0.0")
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).and_return("Invalid product.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("exit")
      vendingmachine.insert_coin
    end

    it 'allows customers to have their money returned' do
      vendingmachine = VendingMachine.new
      expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like to your coins to be returned. Enter 'exit' if you would like to exit.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("quarter")
      expect($stdout).to receive(:puts).with(0.25)
      expect(vendingmachine).to receive(:gets).and_return("quarter")
      expect($stdout).to receive(:puts).with(0.50)
      expect(vendingmachine).to receive(:gets).and_return("return coins")
      expect($stdout).to receive(:puts).with("Your coins have been returned.")
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).with("bye.")
      vendingmachine.insert_coin
    end

    it 'tells customers when selected item is not available' do
      vendingmachine = VendingMachine.new
      vendingmachine.instance_variable_set(:@cola_quantity, 0)
      expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like to your coins to be returned. Enter 'exit' if you would like to exit.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("select product")
      expect($stdout).to receive(:puts).with("SELECT PRODUCT. Valid options include: cola, chips or candy. Enter exit if you would like to go back.")
      expect(vendingmachine).to receive(:gets).and_return("cola")
      expect($stdout).to receive(:puts).with("SOLD OUT. Please select another item.")
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).and_return("Invalid product.").at_least(:twice)
      expect(vendingmachine).to receive(:gets).and_return("exit")
      vendingmachine.insert_coin
    end

    it 'tells customers when exact change is required' do
      vendingmachine = VendingMachine.new
      vendingmachine.instance_variable_set(:@initial_change_value, 0)
      expect($stdout).to receive(:puts).with("EXACT CHANGE ONLY. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you would like your coins to be returned. Enter 'exit' if you would like to exit.")
      expect(vendingmachine).to receive(:gets).and_return("exit")
      expect($stdout).to receive(:puts).with("bye.")
      vendingmachine.insert_coin
    end
  end
end
