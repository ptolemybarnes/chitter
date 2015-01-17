
describe User, '.signup' do
  it 'creates a user' do
    user = User.create(:name => "Oz", :email => "oz@wizard.com")

    expect(User.first(:name => "Oz")).to eq(user)
  end
end