class UserAbility
  include CanCan::Ability
  def initialize(user)
    if user
      if user.role? :special
        can :manage, :all
      elsif user.role? :normal
        can :manage, :all
      elsif user.role? :beginner
        can :read, :all        
      end
    else
      cannot :manage, :all
    end
  end
end