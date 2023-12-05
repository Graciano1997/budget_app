class Operation < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :groups
end
