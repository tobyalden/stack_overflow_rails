class UserPolicy
  attr_reader :user, :users

  def initialize(user, users)
    @user = user
  end

  def index?
    @user && @user.admin?
  end

end
