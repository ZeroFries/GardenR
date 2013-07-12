# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    up_vote false
    user nil
    flower nil
  end
end
