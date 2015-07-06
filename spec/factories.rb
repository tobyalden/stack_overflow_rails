FactoryGirl.define do
  factory(:user) do
    email('john@gmail.com')
    password('badpassword')
  end
end
