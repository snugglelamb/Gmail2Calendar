#Gmail2Calendar
##Authentication
<ul>Integrated with devise + omniauth to get access to user's google account. However, users need to register for a project first and provide the API ID and secret.</ul>
##User story and testing
<ul>Integrated with cucumber + capybara + factory girl + rspec for testing</ul>
<ul> As in our application, users only need to sign up/in or cancel their account. We write the user story in the two scopes.</ul>
##UI
<ul>UI is based on bootstrap plus some customized modification</ul>
##Models
<ul>Three models are created by using scaffold: User, Mygmail and Event</ul>
<ul>
	The relational database looks like below
	
	User 1 has many Mygmails, Mygmail 1 has many Events. 
	User 1 has many Events through Mygmail.
	
	
##Schema Information
###Table name: users
```ruby
	  id                     :integer          not null, primary key
	  name                   :string
	  psw                    :string
	  account                :string
	  created_at             :datetime         not null
	  updated_at             :datetime         not null
	  email                  :string           default(""), not null
	  encrypted_password     :string           default(""), not null
	  reset_password_token   :string
	  reset_password_sent_at :datetime
	  remember_created_at    :datetime
	  sign_in_count          :integer          default("0"), not null
	  current_sign_in_at     :datetime
	  last_sign_in_at        :datetime
	  current_sign_in_ip     :string
	  last_sign_in_ip        :string
```

###Table name: mygmails
```ruby	
	  id         :integer          not null, primary key
	  eid        :string
	  created_at :datetime         not null
	  updated_at :datetime         not null
```	
	
###Table name: events
	
```ruby
	  id         :integer          not null, primary key
	  name       :string
	  shedule    :datetime
	  location   :string                                                              
	  mygmail_id :integer
	  created_at :datetime         not null
	  updated_at :datetime         not null
```
###Relevant Links
[Using Devise on rails app](http://guides.railsgirls.com/devise/)

[Authentication using devise](https://deepakrip007.wordpress.com/2013/09/22/authentication-using-devise-in-rails-3/)

[devise documentation](https://github.com/plataformatec/devise)

[Using devise helpers](https://github.com/plataformatec/devise/blob/master/lib/devise/controllers/helpers.rb)


