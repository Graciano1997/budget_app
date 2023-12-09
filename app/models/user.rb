class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :operations, as: :author, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates_presence_of :name, :email, :password
end
