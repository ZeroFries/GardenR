FactoryGirl.define do
  factory :user do
    username "Stuart"
    email "Stu@stu.com"
    password "glean"
    password_confirmation "glean"
  end

  factory :flower do
  	url "flower.jpg"
  	name "blue flower"
  	description "beautiful blue"
  end

  factory :comment do
  	note "amazing"
  end
end