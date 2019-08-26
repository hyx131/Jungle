require 'rails_helper'

describe Product do

  describe 'Validations' do

    category = Category.new    
    product = Product.new(name: "Toto", price: 50, quantity: 100, category_id: category.id)
    
    it "is not valid without a name" do
      product.name = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.price = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do 
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product.category_id = nil
      expect(product).to_not be_valid
    end

    it "has errors included in the .errors.full_messages array" do
      product.name = nil
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

  end

end





