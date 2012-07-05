class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
      cannot :create, User
    else
      can :read, User
      can :update, User, :id => user.id
    end
  end
end
