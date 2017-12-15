FactoryBot.define do
	sequence(:email) { |n| "user#{n}@egmail.com" }
	
	factory :user do
		email 
    password "1234567890"
    first_name "Peter"
    last_name "Smith"
    admin false
  end

    factory :admin, class: User do
    email
    password "test123"
    admin true
    first_name "Mac"
    last_name "Probert"
  end


end