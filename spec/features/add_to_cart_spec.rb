require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      1.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "'My Cart' increases by 1 each time 'Add to cart' is clicked" do
     #ACT
     visit root_path
     page.find_button('Add').click
     
     # VERIFY
      expect(page).to have_text 'My Cart (1)'
     
     #DEBUG
     save_screenshot
    end

end
