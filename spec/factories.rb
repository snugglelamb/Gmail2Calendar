FactoryGirl.define do  factory :mygmail do
    content "MyText"
  end
  factory :event do
    name "MyString"
schedule "2014-11-12 18:08:18"
location "MyString"
mygmail nil
  end
  
 

    factory :user do
        email "aabb@hh.de"
        password "rubyrubyruby"
        #password_confrimation "ruby"
    end
end