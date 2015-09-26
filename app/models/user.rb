class User < ActiveRecord::Base
  has_many :bots, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates_length_of :phone_number, is: 10

end
