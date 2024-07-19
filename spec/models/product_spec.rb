require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "can save a product with a name, price, quantity, and category" do 
      @category = Category.new
      @product = Product.new(
        name: "Cheese", 
        price: 500,
        quantity: 42,
        category: @category)

      @product.save!
      expect(@product.id).to be_present
    end

    it 'must have a name' do
      @category = Category.new
      @product = Product.new(
        name: nil,
        price: 10,
        quantity: 1,
        category: @category
      )
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'must have a price' do
      @category = Category.new
      @product = Product.new(
        name: "Test",
        price_cents: nil,
        quantity: "1",
        category: @category)

      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'must have a quantity' do
      @category = Category.new
      @product = Product.new(
        name: 'name',
        price: 10,
        quantity: nil,
        category: @category
      )
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'must have a category' do
      @category = Category.new
      @product = Product.new(
        name: 'name',
        price: 10,
        quantity: 1,
        category: nil
      )
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end