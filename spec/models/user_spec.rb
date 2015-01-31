
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
    loki_the_user = create(:a_user, name: "Loki")

    user = User.authenticate(name: "Loki", password: loki_the_user.password)

    expect(user).to eq(loki_the_user)
  end
end

describe User do

  scenario "has peeps" do
    bernard_the_user = create(:a_user, name: "Bernard")
    
    first_peep       = create(:a_peep, user: bernard_the_user, text: "Hello, World!")

    expect(bernard_the_user.peeps).to eq([first_peep])
  end
end






