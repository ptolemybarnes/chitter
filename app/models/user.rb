class User
  include DataMapper::Resource

  attr_reader :password, :email
  attr_accessor :password_confirmation

  property :id             , Serial
  property :name           , String, :unique => true
  property :email          , String, :unique => true
  property :password_digest, Text

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def self.signup(user_details)
    User.create(user_details)
  end

end