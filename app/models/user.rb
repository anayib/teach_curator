class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :boards, :dependent => :destroy

  validates :name, :lastname, :username, presence: true 
  validates :email, :username, uniqueness: true
 
end
