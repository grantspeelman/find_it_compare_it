class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
      cannot :create, User
    else
      can :read, User
      can :update, User, :id => user.id
      can :manage, Board, :user_id => user.id
      can :manage, BoardTestFeature, :board_id => user.boards.collect { |b| b.id }
      can :create, Item
      can :manage, Item, :board_id => user.boards.collect { |b| b.id }
    end
  end
end
