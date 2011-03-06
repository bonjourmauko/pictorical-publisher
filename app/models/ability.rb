class Ability
  include CanCan::Ability

  def initialize(current_user)

    #user ||= User.new
    
    if current_user.admin?
      can :manage, :all
    else
      can [:index, :show], [Author, Text]
      #can :show,    Author
      can :new,     Book
      can [:edit, :change, :review], Book do |book|
        book.try(:user) == current_user
      end
    end
    
  end
end
