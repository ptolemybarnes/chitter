FactoryGirl.define do
  factory :a_user, class: User do
    name "Oz"
    email { "#{name}@email.com" }
    password "secret"
    password_confirmation { "#{password}" }
  end

  factory :a_peep, class: Peep do
    text "Hello, World!"
    a_user
  end
end