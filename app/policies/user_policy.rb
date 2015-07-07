class UserPolicy
  attr_reader :user, :users

  def initialize(user, users)
    @user = user
  end

  def index?
    @user && @user.admin?
  end

  def update?
    @user && @user.admin?
  end

  def destroy?
    @user && @user.admin?
  end

end
