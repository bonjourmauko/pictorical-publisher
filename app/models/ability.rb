class Ability
  include CanCan::Ability

  def initialize(current_user)

    if current_user.admin?
      can :manage, :all
    else
      can [:index, :show], [Text]
      can :new, Book
      can [:edit, :change, :review], Book do |book|
        book.try(:user) == current_user
      end
    end

  end
end
