require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
  	@comment = FactoryGirl.create :comment
  end

	test "it shouldn't be blank" do
  	@comment.note = ""

  	assert !@comment.save
  end

  test "it should have a flower" do
  	f = FactoryGirl.create :flower
  	c = f.comments.build note: "awesome"
  	c.save

  	assert_equal c.flower_id.class, Fixnum
  end

  test "it should have an owner" do
  	u = FactoryGirl.create :user
  	c = u.comments.build note: "awesome"
  	c.save

  	assert_equal c.user_id.class, Fixnum
  end

  test "it should have a flower AND owner" do
  	u = FactoryGirl.create :user
  	f = FactoryGirl.create :flower
  	c = f.comments.build note: "awesome"
  	c.user_id = u.id
  	c.save

  	assert_equal c.user_id.class, Fixnum
  	assert_equal c.flower_id.class, Fixnum
  end
end
