require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id  , Serial 
  property :text, Text, :length => 1..140
  property :peeped_at, DateTime

  belongs_to :user
end