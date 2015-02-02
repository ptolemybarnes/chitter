require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id  , Serial 
  property :text, Text, :length => 1..140
  property :peeped_at, DateTime

  belongs_to :user

  def to_url(root)
    root + self.id.to_s
  end
  
end