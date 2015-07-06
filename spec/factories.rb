FactoryGirl.define do
  factory(:user) do
    email('john@gmail.com')
    password('badpassword')
  end

  factory(:question) do
    association :user, factory: :user
    title('how do i computer')
    body('halp')
  end
end
