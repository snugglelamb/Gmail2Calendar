FactoryGirl.define do  factory :event do
    name "MyString"
schedule "2014-11-12 18:08:18"
location "MyString"
mygmail nil
  end
  
 

    factory :user do
        email "aabb@hh.de"
        password "ruby"
        #password_confrimation "ruby"
    end
end