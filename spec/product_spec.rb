require 'rails_helper'

describe Product do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @category = Category.new
      @category.name = "Toto Category"
      @product = Product.new
      @product.name = "Toto"
      @product.price = 50
      @product.quantity = 5
      @product.category = @category

      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product = Product.new
      @product.name = nil
      @product.valid? # check for errors on an object, if don't run this check, resosurce.errors ([]) will be empty and the following 'expect' statement won't run
      expect(@product.errors[:name]).to include("can't be blank")

      @product.name = "Toto"
      @product.valid?
      expect(@product.errors[:name]).to_not include("can't be blank")
    end

    it "is not valid without a price" do 
      @product = Product.new
      @product.price = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")

      @product.price = 50
      @product.valid?
      expect(@product.errors[:price_cents]).to_not include("is not a number")
    end

    it "is not valid without a quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")

      @product.quantity = 5
      @product.valid?
      expect(@product.errors[:quantity]).to_not include("can't be blank")
    end

    it "is not valid without a category" do
      @product = Product.new
      @category = Category.new

      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")

      @product.category = @category
      @product.valid?
      expect(@product.errors[:category]).to_not include("can't be blank")
    end

  end

end





