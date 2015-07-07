FactoryGirl.define do

  factory :user do
    email      { Faker::Internet.email }
    password   "qqqqqqqq"
    username  "user"
    
  end




  factory :list do
    title    'test_list'
    user
    id 1
  end

  factory :task do
    body 'test_task'
    user
    list
  end

  
end