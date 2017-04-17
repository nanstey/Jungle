require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should be valid with all fields provided' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new(name: 'Rocket Skates', price: 500.00, quantity: 20, category: @cat)
      expect(@product).to be_valid
    end
    it 'should not be valid without a name' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new(name: nil, price: 500.00, quantity: 20, category: @cat)
      expect(@product).to_not be_valid
    end
    it 'should not be valid without a price' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new(name: 'Rocket Skates', price: nil, quantity: 20, category: @cat)
      expect(@product).to_not be_valid
    end
    it 'should not be valid without a quantity' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new(name: 'Rocket Skates', price: 500.00, quantity: nil, category: @cat)
      expect(@product).to_not be_valid
    end
    it 'should not be valid without a category' do
      @cat = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new(name: 'Rocket Skates', price: 500.00, quantity: 20, category: nil)
      expect(@product).to_not be_valid
    end
  end
end

