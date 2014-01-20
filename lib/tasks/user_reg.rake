# register a user

require 'Author'

desc 'Registers a test user'
task :seed_user do |t|
  client = Author::Client.new(ENV['API_HOST'])
  auth = Author::Proxy.new(client)
  auth.register_and_login('test@user.com', '12345678')
  puts auth.session
end