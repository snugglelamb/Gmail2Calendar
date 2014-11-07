<h1>Demo Brief</h1>
<br>
scaffold model: user, quotes(belong to user)<br>
Apply devise gem on user<br>
Define default url to homepage(users#index)<br>
Add sign in/out label on header<br>
Add register with name (attribute created in scaffold)<br>
Change the layout of show under user model<br>
Add some simple validation & a scroll bar on creating quotes<br>
<br>
Add restriction:<br>
       with   before_filter :authenticate_user! added in application_controller.rb
       User can do nothing but login when logged out
       
Useful resources:<br>
       http://guides.railsgirls.com/devise/<br>
       https://deepakrip007.wordpress.com/2013/09/22/authentication-using-devise-in-rails-3/<br>
       https://github.com/plataformatec/devise<br>
       https://github.com/plataformatec/devise/blob/master/lib/devise/controllers/helpers.rb<br>

<br>

Add bootstrap<br>
       remember not to use --force unless you know what you're doing<br>
       accidently delete show button, add it back but without bootstrap layout<br>
Adjust layout<br>
       move the sign in/out label to the bottom as footer<br>
       adjust display value and scroll bar back to normal<br>
              since bootstrap --force will overwrite former changes to layout<br>
<br>
Please Try it out :)<br>
Li<br>
