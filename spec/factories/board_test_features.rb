# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board_test_feature do
    sequence :name do |n|
      "feature #{n}"
    end
    score 10
    board
  end
end
