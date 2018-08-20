class Ability
  include CanCan::Ability

  def initialize(userer)
    can :read, :all . # permissions for every user, even if not logged in
    if gamer.present?  # additional permissions for logged in users (they can manage their posts)
      if gamer.admin?  # additional permissions for administrators
        can :manage, :all
      end
      if gamer.casual?
        can :read, :all
      end
      if gamer.leader?
        can :read, :all
        can :create, Team
        can :update, Team
        can :create, Group
        can :update, Group
      if gamer.pro?
        can :read, :all
        can :create, Group
        can :update, Group

    end
  end
end
