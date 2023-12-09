class Operation < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :group_operations,dependent: :destroy
  validates_presence_of :name, :amount
  validates :amount, numericality: { greater_than: 0 }
end
