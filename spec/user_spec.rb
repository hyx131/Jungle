require 'rails_helper'

describe User do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @user = User.new
      @user.first_name = "Toto"
      @user.last_name = "Ro"
      @user.email = "toto2@email.com"
      @user.password = "string"
      @user.password_confirmation = "string"

      expect(@user).to be_valid
    end

    it "is not valid without a first_name" do
      @user = User.new
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("can't be blank")

      @user.first_name = "Toto"
      @user.valid?
      expect(@user.errors[:first_name]).to_not include("can't be blank")
    end
    
    it "is not valid without a last_name" do
      @user = User.new
      @user.last_name = nil
      @user.valid?
      expect(@user.errors[:last_name]).to include("can't be blank")

      @user.last_name = "Ro"
      @user.valid?
      expect(@user.errors[:last_name]).to_not include("can't be blank")
    end
    
    it "is not valid without a password" do
      @user = User.new
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
      
      @user.password = "string"
      @user.valid?
      expect(@user.errors[:password]).to_not include("can't be blank")
    end
    
    it "is not valid if password and password_confirmation mismatches" do
      @user = User.new
      @user.password = "string"
      @user.password_confirmation = "string2"
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "should have a password length longer than 6 characters" do
      @user = User.new
      @user.password = "str"
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")

      @user.password = "string"
      @user.valid?
      expect(@user.errors[:password]).to_not include("is too short (minimum is 6 characters)")
    end

    it "is not valid without an email" do
      @user = User.new
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")

      @user.email = "toto@email.com"
      @user.valid?
      expect(@user.errors[:email]).to_not include("can't be blank")
    end

    it "is not valid if email is not unique" do
      @user = User.new
      @user.email = "toto@email.com"    
      @user.email = "toto@email.com"
      @user.valid?
      expect(@user.errors[:email]).to include("has already been taken")
    end

  end

  describe '.authenticate_with_credentials' do

    it "is valid with correct password" do
      user = User.new(
        first_name: "Toto",
        last_name: "Ro",
        email: "toto@email.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save

      expect(User.authenticate_with_credentials("toto@email.com", "string")).not_to be(nil)
    end

    it "is invalid with incorrect password" do
      user = User.new(
        first_name: "Toto",
        last_name: "Ro",
        email: "toto@email.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save

      expect(User.authenticate_with_credentials("toto@email.com", "str")).to be(nil)
    end

    it "is valid with extra whitespace in input email" do
      user = User.new(
        first_name: "Toto",
        last_name: "Ro",
        email: "toto@email.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save

      expect(User.authenticate_with_credentials(" toto@email.com   ", "string")).not_to  be(nil)
    end

    it "is valid with inconsistent case from input email" do
      user = User.new(
        first_name: "Toto",
        last_name: "Ro",
        email: "toto@email.com",
        password: "string",
        password_confirmation: "string"
      )
      user.save

      expect(User.authenticate_with_credentials("TOTO@email.com", "string")).not_to  be(nil)
    end
  end

end





