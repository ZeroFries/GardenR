require 'test_helper'

class FlowerTest < ActiveSupport::TestCase
  setup do 
  	@flower = FactoryGirl.create :flower
  end

  test "should have url" do
  	@flower.url = ""

  	assert !@flower.save
  	assert_equal "can't be blank", @flower.errors[:url].first
  end

  test "should have name" do
  	@flower.name = ""

  	assert !@flower.save
  	assert_equal "can't be blank", @flower.errors[:name].first
  end

  test "it should have an owner" do
  	user = FactoryGirl.create :user
  	f = user.flowers.build url: "hi", name: "yo"
  	f.save

  	assert_equal f.user_id.class, Fixnum
  end

  test "user can have flowers" do
  	user = FactoryGirl.create :user
  	f = user.flowers.build url: "hi", name: "yo"
  	f.save

  	assert user.flowers.size >= 1
  end
end
