<h1>Gmail2Calendar</h1> 
<h2>Authentication</h2>
<ul>Integrated with devise + omniauth to get access to user's google account. However, users need to register for a project first and provide the API ID and secret.</ul>
<h2>User story and testing</h2>
<ul>Integrated with cucumber + capybara + factory girl + rspec for testing</ul>
<ul> As in our application, users only need to sign up/in or cancel their account. We write the user story in the two scopes.</ul>
<h2>UI</h2>
<ul>UI is based on bootstrap plus some customized modification</ul>
<h2>Models</h2>
<ul>Three models are created by using scaffold: User, Mygmail and Event</ul>
<ul>
	The relational database looks like below<\br>
	Users 1---has many----{ Mygmails 1-----has many------{ Events<\br>
	1                          ^                          \ /<\br>
	|                          |                           |<\br>
	|                          |                           |<\br>
  	-----------------has many through-----------------------<\br>
	
	<\br><\br><\br>
	# == Schema Information<\br>
	#<\br>
	# Table name: users<\br>
	#<\br>
	#  id                     :integer          not null, primary key<\br>
	#  name                   :string<\br>
	#  psw                    :string<\br>
	#  account                :string<\br>
	#  created_at             :datetime         not null<\br>
	#  updated_at             :datetime         not null<\br>
	#  email                  :string           default(""), not null<\br>
	#  encrypted_password     :string           default(""), not null<\br>
	#  reset_password_token   :string<\br>
	#  reset_password_sent_at :datetime<\br>
	#  remember_created_at    :datetime<\br>
	#  sign_in_count          :integer          default("0"), not null<\br>
	#  current_sign_in_at     :datetime<\br>
	#  last_sign_in_at        :datetime<\br>
	#  current_sign_in_ip     :string<\br>
	#  last_sign_in_ip        :string<\br>
	#
	# Table name: mygmails<\br>
	#<\br>
	#  id         :integer          not null, primary key<\br>
	#  eid        :string<\br>
	#  created_at :datetime         not null<\br>
	#  updated_at :datetime         not null<\br>
	#<\br>
	# Table name: events<\br>
	#<\br>
	#  id         :integer          not null, primary key<\br>
	#  name       :string<\br>
	#  shedule    :datetime<\br>
	#  location   :string                                                              <\br>
	#  mygmail_id :integer<\br>
	#  created_at :datetime         not null<\br>
	#  updated_at :datetime         not null<\br>
</ul>

