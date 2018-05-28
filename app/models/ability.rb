class Ability
  include CanCan::Ability

  def initialize(user)
    
    can(:manage, Idea) do |idea|
      user == idea.user
    end

    # can(:manage, Reveiw) do |review|
    #   user == review.user
    # end
  
  end
end