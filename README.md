# Chitter
============

Chitter is a clone of twitter, allowing users to post messages to a public stream.

##Features
- As a user, in order to access Chitter, I want to sign up to the service.
- As a signed-up user, in order to access Chitter, I want to log in.
- As a paranoid user, in order to protect my account, I want to sign out.
- As a user, in order to communicate with a wide audience, I want to post a message (peep) to chitter.
- As a curious user, in order to see what people have to say, I want to view peeps in chronological order.

##Technologies Used
- Ruby
- Sinatra
- RSpec/Capybara
- FactoryGirl

##Reflections
The instruction for this project was to keep it as simple and straightforward as possible, to treat it as a consolidation of what we had learned over Week 4 at Makers Academy with regard to databases. I felt, however, that I had neglected some of the lessons I had learned about TDD while trying to absorb the new concepts and syntax.

For this project then, I tried to think about and adhere to best practices for testing. In particular, ensuring that each module of the programme, be it a controller or model, be tested in isolation. Through this I learned about FactoryGirl, a gem for DRYing out test code by allowing you to quickly set up the environment for a test with the necessary data.