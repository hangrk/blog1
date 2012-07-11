FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :post do
    title "Lorem ipsum"
    content "Lorem ipsum"
    user
  end

  factory :category do
    name "uncategorized"
  end
end