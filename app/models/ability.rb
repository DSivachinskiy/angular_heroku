class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(User)
        can :manage, List
        can :manage, Task    
    end
    can :read, List
    can :read, Task
  end
end
