# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Category, user: user
    can :manage, Product, user: user
    can :read, Category
    can :create, :all
  end
end
