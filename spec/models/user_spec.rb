
describe User, '.signup' do

  details = {name: "Tom", email: "tom@gmail.com", password: "secret", password_confirmation: "secret"}

  it 'creates a user when passwords match' do
    tom = User.signup(details)

    expect(User.first(:name => "Tom")).to eq(tom)
  end

  it 'does not save user with non-matching passwords' do
    details[:password_confirmation] = "mistake"

    expect{ User.signup(details) }.to change(User, :count).by 0

    details[:password_confirmation] = "secret"
  end

  it "does not save user when email is already in use" do
    first_user     = User.signup(details)
    details[:name] = "John"

    second_user= User.signup(details)

    expect(second_user.saved?).to eq false

    details[:name] = "Tom"
  end
end

describe User, '.signin' do

  scenario "signs in existing user" do
    oz_the_user = create(:oz_the_user)

    user = User.signin(name: "Oz", password: "secret")

    expect(user.email).to eq(oz_the_user.email)
  end
end






