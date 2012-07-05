# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :item do
    sequence :url do |n|
      "http://website#{n}.com"
    end
  end

end
