# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :board_name_word do |n|
    names = %W(Purple Neptune Meaningful Lantern Cheerful Disappointed Metaphor Insane Creek Barbaric Waterbird
               Appropriate Alarm Rusty Xylophone Red Gamma Locomotive Stony Knife Rough Autopsy Tasty Cheerful
               Endless Anaconda Dreaded Beta Northernmost Gruesome Winter Lost Rhinestone Hidden Sienna Smoke Tidy
               Tungsten Lost Mustard Tidy Doorstop Late Cat Sad Flannel Meaningful Doorstop Alien Sunshine Rocky
               Microphone Solid Burst Red Green Smoke Rough Avenue Black Subtle Coffin Hook Brave Swift Subdivision
               Disappointed Obscure Teal Uranium Appropriate Wrench Stony Weather)
    n < names.size ? names[n] : "#{names.sample} #{n}"
  end

  factory :board do
    name {  "#{FactoryGirl.generate(:board_name_word)} #{FactoryGirl.generate(:board_name_word)}" }
    user
  end

end
