FactoryGirl.define do
  factory :oz_the_user, class: User do
    name "Oz"
    email "oz@wizard.com"
    password "secret"
    password_confirmation "secret"
  end
end