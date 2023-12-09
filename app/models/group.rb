class Group < ApplicationRecord
  belongs_to :user
  has_many :group_operations
  validates_presence_of :name, :icon
end
