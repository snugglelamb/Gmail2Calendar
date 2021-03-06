#Gmail2Calendar
	CIT 597 team project: Zhi Li, Siyu Qiu

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
	  provider               :string
 	  uid                    :string
 	  token                  :string
```

###Table name: mygmails
```ruby	
	  id         :integer          not null, primary key
	  eid        :string
	  created_at :datetime         not null
	  updated_at :datetime         not null
	  user_id    :integer
 	  content    :text
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
## Why these models
### user
	app user, must have a google account fist so as to use Gmail2Calendar
	grant promission to view profile, gmail and google calendar
### mygmail
	belong to user
	with content so as to extract events
### event
	things to be added to calendar
	
## Association and Why
	user has many mygmails & mygmail belongs to user
	one user will have many gmails
	mygmail has many events & evenr belongs to mygmail
	a email may have more than one events
	user has many events through mygmail
	by setting has many through, add assess mehtods to user to search events
##Validations
	for Mygmail model 
	validates :user_id, presence: true
	force that a mygmail must belong to a user
	for Event model
	validates :mygmail_id, presence: true
	force that an event must belong to a gmail
	for User model
	validates :psw, length:{ minimum: 4 }
	for security
## Controller
	controller is a connection between model and views
	the most important funtion is getGmail and addevent in mygmail_controller
	also omniauth_callbacks_controller contains core information for oauth2 authentication
	
### Extract Gmail from mailbox and store in database
	First user need to sign in with oauth2
	At user index page, pick a date in the widget
	Our app will automatically parse down emails from the input date
	Parsed emails are stored in Mymail Table

### Extract event and send to Google Calendar
	During email parsing, if email contents have time format string(e.g. 2014/11/20), an event will be extracted and stored in Event table. Current version only support content with time format, but will soon come up with further updates.
	The stored event will be automatically added to google calendar, with correct time.
	Current time zone is set to EST.

### Additional functions
	Add Calendar Preview through iframe
		Now user could see what changes are made to his/her google calendar
		Usage: click link 'Calendar' on the menu bar, or type in url /user/:id/calendar
	Add sort_by_eid function in Mygmail index page, could sort emails stored in database
		Usage: Click the button or type in url /users/:id/mygmails/sort
	Add Datetime picking widget to select date
##View
	Based on bootstrap with embellish view.
	In the index page of user, deplay how many emails have been parsed and how many events 
	have been added with graphical data analysis.
	We embeds Google Calendar into our app to show the final result of adding events extracted from
	users' gmail to the users' Google Calendar.
## Test
###Unit Test
	test models: User, Mygmail, Event
	in user model: test function google_auth2 on 3 kinds of user: present, registered, non-registered
	test design descreption: The above three conditions cover all the situation when a user try to use our app
	coverage: 100%
	
	
###Functional Test
	test controllers: 
		user_controller, mygmail_controller, event_controller, application_controller
	user_controller: 
		test 7 resourseful methods index, create, delete, edit, update, new, destroy 
		user model is bunded with devis, to test it we set environment for devise
		and mock authentication for OmniAuth.
	mygmail_controller: 
		apart from the 7 common methods,test addevent, parsetext, sortbyid,  getGmails 
	event_controller: 
		test 7 common methods
			  
	coverage: 99.3%

###Other Parts
	helpers: devise_helper, event_helper, mygmail_helper, user_helper, application_helper
###EC
	Our test covers:
	All Files (98.9%) 
	Controllers (99.3%)
	Models (100.0%)
	Mailers (100.0%)
	Helpers (93.75%) The missing part is for flashing errors with no predefined error message.
	Libraries (100.0%)


###In Total
	All Files 98.9%
	12 files in total. 182 relevant lines. 180 lines covered and 2 lines missed

##heroku

	Performance: 
		All parts work fine!!!!
		
=========
###Deployed Links
[Url to Gmail2Calendar on heroku](https://gmail2calendar.herokuapp.com)

###Relevant resources
[Using Devise on rails app](http://guides.railsgirls.com/devise/)

[Authentication using devise](https://deepakrip007.wordpress.com/2013/09/22/authentication-using-devise-in-rails-3/)

[devise documentation](https://github.com/plataformatec/devise)

[Using devise helpers](https://github.com/plataformatec/devise/blob/master/lib/devise/controllers/helpers.rb)

## 



