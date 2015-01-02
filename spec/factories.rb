FactoryGirl.define do
  factory :user do
    email "alex@test.com"
    password "password"
  end

  factory :rating do
    stars 3
  end

  factory :podcast do
    genre "storytelling"
    mood "happy"
  end  

  trait :with_ratings do
    after :create do |podcast|
      FactoryGirl.create_list :rating, 4, :podcast => podcast
    end
  end
end
