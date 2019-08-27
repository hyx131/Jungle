# require 'rails_helper'

# describe User do

#   describe 'Validations' do

#     user = User.new(first_name: "Toto", last_name: "Ro", email: "toto@email.com", password: "string", password_confirmation: "string")

#     it "is not valid without a first_name and last_name" do 
#       user.first_name = nil, user.last_name = nil
#       expect(user).to_not be_valid
#     end

#     it "is not valid without a password" do
#       user.password = nil, user.password_confirmation = nil
#       expect(user).to_not be_valid
#     end

#     it "is not valid if password and password_confirmation mismatches" do
#       user.password = "string", user.password_confirmation = "string2"
#       expect(user).to_not be_valid
#     end

#     it "is not valid without an email" do
#       user.email = nil
#       expect(user).to_not be_valid
#     end

#     it "is not valid if email is not unique" do
#       # user2 = User.new(email: "toto.@email.com")
#       user.email = "Toto@email.com"
#       expect(user).to_not be_valid
#     end

#     it "should have a password length longer than 5 characters" do 
#       user.password = 'str', user.password_confirmation = 'str'
#       # user.save
#       expect(user).to_not be_valid
#     end


#   end

# end





