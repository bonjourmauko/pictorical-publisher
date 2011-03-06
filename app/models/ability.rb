class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    
    if user.admin?
      can :manage, :all
    else
      can :index,   Author
      can :show,    Author
      can :new,     Book
      can :edit,    Book { |book| book.try(:user) == user }
      can :change,  Book { |book| book.try(:user) == user }
      can :review,  Book { |book| book.try(:user) == user }
      can :read,    Page
      can :index,   Text
      can :show,    Text
    end
    
  end
end
