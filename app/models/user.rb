# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  before_save { |user| user.email = email.downcase }
  
  validates :name, presence: true, length: { maximum:50 }
  VALID_EMAIL_REGEX = /\A[a-zA-Z][\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
                                    uniqueness: { case_sensitive: false }
  

  attr_accessible :email, :name
end
