require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "T.Hanks", username: "Gump", email: "gump@bubbagump.com")
  end
  
  test "name should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  #TODO - check name length, both min and max
  
  test "username should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end
  
  #TODO - check username length, both min and max
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email should be valid" do
    assert @user.valid?
  end
  
  test "email should be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
  
  #TODO - check email length, both min and max
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@gmail.com]
    valid_addresses.each do |valid_addr|
      @user.email = valid_addr
      assert @user.valid?, '#{valid_addr.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org eee@i_am.com foo@as+wd.com]
    invalid_addresses.each do |invalid_addr|
      @user.email = invalid_addr
      assert_not @user.valid?, '#{invalid_addr.inspect} should be invalid'
    end
  end
  
end