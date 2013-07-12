require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@user = FactoryGirl.create :user
  end

  test "must have username" do
  	@user.username = ""

  	assert !@user.save
  	assert_equal "can't be blank", @user.errors[:username].first
  end

  test "must have valid email" do
  	@user.email = "blah"

  	assert !@user.save
  	assert_equal "is invalid", @user.errors[:email].first
  end

  test "must have password" do
  	@user1 = User.new(username: "bobly", email: "bob@bob.com")
  	@user1.password = ""

  	assert !@user1.save
  	assert_equal "can't be blank", @user1.errors[:password].first
  end

  test "password_confirmation must match password" do
  	@user2 = User.new(username: "bobly", email: "bob@bob.com")
  	@user2.password = "testing"
  	@user2.password_confirmation = "doesntmatch"

  	assert !@user2.save	
  	assert_equal "doesn't match Password", @user2.errors[:password_confirmation].first
	end

  test "no duplicate emails" do
    @user3 = FactoryGirl.build :user

    assert !@user3.save
    assert_equal "has already been taken", @user3.errors[:email].first
  end
end
