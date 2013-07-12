require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
  	@user = FactoryGirl.create :user
  	@flower = FactoryGirl.create :flower
  	@rating = @flower.ratings.create up_vote: true
  	@rating.user = @user
  	@rating.save
  end

  test "ratings have a user and a flower" do
  	assert @rating.user_id > 0
  	assert @rating.flower_id > 0
  end

  test "user can rate a flower once" do
  	@rating2 = @flower.ratings.create up_vote: true
  	@rating2.user = @user

  	assert !@rating2.save	
  end
end
