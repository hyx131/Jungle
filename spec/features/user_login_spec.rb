require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    User.create!(
      first_name: "Toto",
      last_name: "Ro",
      email: "toto@email.com",
      password: "string",
      password_confirmation: "string"
    )
  end

  scenario "user can login susscessfully" do

    #ACT 
    visit '/login'
    fill_in 'email', with: 'toto@email.com'
    fill_in 'password', with: 'string'
    page.find_button('Login').click

    # VERIFY
    expect(page).to have_text 'Signed in as: Toto'
    
    #DEBUG
    save_screenshot
  end
  
end
