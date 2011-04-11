class Ability
  include CanCan::Ability

  def initialize(current_user)

    if current_user.admin?
      can :manage, :all
    else
      can [:index, :show], Text

      can [:new, :create], Illustration
      can [:show, :destroy], Illustration do |illustration|
        illustration.try(:user) == current_user
      end
      
      can [:new], Book
      can [:show, :edit, :change, :review, :add_text, :remove_text], Book do |book|
        book.try(:user) == current_user
      end
    end

  end
end
