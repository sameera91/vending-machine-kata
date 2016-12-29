require_relative '../lib/vending-machine.rb'
require 'pry'

describe './lib/vending-machine.rb' do
  describe VendingMachine do
    describe 'lib/vending-machine.rb' do
      it 'accepts coins so that I can collect money from the customer' do
        vendingmachine = VendingMachine.new
        expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you want to your coins to be returned.").at_least(:twice)
        expect(vendingmachine).to receive(:gets).and_return("quarter")
        expect($stdout).to receive(:puts).with(0.25)
        expect(vendingmachine).to receive(:gets).and_return("exit")
        expect($stdout).to receive(:puts).with("bye.")
        vendingmachine.insert_coin
      end

      it 'allows customers to select products' do
        vendingmachine = VendingMachine.new
        expect($stdout).to receive(:puts).with("INSERT COIN. Valid options include: nickel, dime, quarter. Enter 'select product' once you are ready to select a product. Enter 'return coins' if you want to your coins to be returned.").at_least(:twice)
        expect(vendingmachine).to receive(:gets).and_return("quarter")
        expect($stdout).to receive(:puts).with(0.25)
        expect(vendingmachine).to receive(:gets).and_return("quarter")
        expect($stdout).to receive(:puts).with(0.50)
        expect(vendingmachine).to receive(:gets).and_return("select product")
        expect($stdout).to receive(:puts).with("Select a product. Valid options include: cola, chips or candy.")
        expect(vendingmachine).to receive(:gets).and_return("chips")
        expect($stdout).to receive(:puts).with("THANK YOU. Your change is: 0.0")
        expect(vendingmachine).to receive(:gets).and_return("exit")
        expect($stdout).to receive(:puts).and_return("Invalid product.").at_least(:twice)
        expect(vendingmachine).to receive(:gets).and_return("exit")
        vendingmachine.insert_coin
      end
    end
  end
end