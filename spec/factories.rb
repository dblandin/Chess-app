FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword" 
  end

  factory :game do
    sequence :name do |n|
      "dummygame#{n}"
    end
    
  end

  factory :piece do
    current_row_index {rand(0..7)}
    current_column_index {rand(0..7)}
  end
    
end