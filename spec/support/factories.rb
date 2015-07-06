FactoryGirl.define do

  factory :user do
    email      "test@mail.ru"
    password   "qqqqqqqq"
    username  "user"
    
  end




  factory :list do
    title    'test_list'
    user
  end

  factory :task do
    body 'test_task'
    user
    list
  end

  
end