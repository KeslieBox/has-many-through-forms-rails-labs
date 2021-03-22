class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #accepts_nested_attributes_for :user not :users because it only belongs to one user
  accepts_nested_attributes_for :user

  #no iteration because the comment only has one user  
  def user_attributes=(user_attributes)
    if !user_attributes[:username].empty?
      self.user= User.find_or_create_by(username: user_attributes[:username])
    end
  end
end
