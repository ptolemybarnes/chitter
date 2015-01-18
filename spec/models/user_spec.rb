
describe User, '.signup' do
    
  user_details = { name: "Oz",                    
                  email: "oz@wizard.com",
               password: "secret",
  password_confirmation: "secret"}

  it 'creates a user when passwords match' do
    user = User.signup(user_details)

    expect(User.first(:name => "Oz")).to eq(user)

    #teardown
  end

  it 'does not save user with non-matching passwords' do
    user_details[:password_confirmation] = "mistake"

    expect{ User.signup(user_details) }.to change(User, :count).by 0

    user_details[:password_confirmation] = "secret"
  end

  it "does not save user when email is already in use" do
    first_user = User.signup(user_details)

    second_user= User.signup(user_details)

    expect(second_user.saved?).to eq false
  end
end