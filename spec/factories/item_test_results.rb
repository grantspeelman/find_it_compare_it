# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :item_test_result do
    item
    board_test_feature
    result false
    user
  end

end
