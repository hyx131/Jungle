require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "directs to products details page when clicked on the product partials" do

    #ACT
    visit root_path
    page.find('.products header h4').click
    
    # VERIFY
    expect(page).to have_css '.product-detail'
    
    #DEBUG
    save_screenshot
  end


end
