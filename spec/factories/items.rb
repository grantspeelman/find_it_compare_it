# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :item do
    title "Title"
    sequence :url do |n|
      "http://website#{n}.com"
    end
    board
  end

end
