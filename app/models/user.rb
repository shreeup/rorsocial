class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

         has_many :tweets
         has_many :items

         validates :username, presence: true, uniqueness: true, length: {minimum:6}
         validates :name, presence: true

         acts_as_followable
         acts_as_follower
         
         acts_as_voter
end
