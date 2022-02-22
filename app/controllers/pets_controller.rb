class PetsController < ApplicationController
  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
  end
end
