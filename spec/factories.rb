FactoryGirl.define do
  factory :oz_the_user, class: User do
    name "Oz"
    email "oz@wizard.com"
    password "secret"
    password_confirmation "secret"
  end

  factory :loki_the_user, class: User do
    name "Loki"
    email "loki@azgard.com"
    password "secret"
    password_confirmation "secret"
  end
end