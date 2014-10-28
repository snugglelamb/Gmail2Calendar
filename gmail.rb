require 'gmail'
require 'date'

username = ''
password = ''
gmail = Gmail.connect(username, password)
start = Date.today - 1
Gmail.connect(username, password) do |gmail|
  if gmail.logged_in?
    puts "yes"
  end
  gmail.inbox.emails(:after => start ).each do |email|
    puts  text = email.text_part.body.to_s        
   # puts  html = email.html_part.body.to_s
  end
end

gmail.logout