class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :flower

  validates_uniqueness_of :flower_id, scope: :user_id
end
