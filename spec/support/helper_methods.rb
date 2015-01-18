module HelperMethods

  def signin_as user
    visit '/user/signin'

    fill_in 'name'                 , with: user.name
    fill_in 'password'             , with: user.password
    click_button 'Login'
  end

end