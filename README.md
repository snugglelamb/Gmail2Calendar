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
	The relational database looks like below
	
	User 1 has many Mygmails, Mygmail 1 has many Events. 
	User 1 has many Events through Mygmail.
	
	
<h2>Schema Information</h2>
<h3>Table name: users</h3>
	
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
	  

<h3>Table name: mygmails</h3>
	
	  id         :integer          not null, primary key
	  eid        :string
	  created_at :datetime         not null
	  updated_at :datetime         not null
	
	
<h3>Table name: events</h3>
	
	  id         :integer          not null, primary key
	  name       :string
	  shedule    :datetime
	  location   :string                                                              
	  mygmail_id :integer
	  created_at :datetime         not null
	  updated_at :datetime         not null


