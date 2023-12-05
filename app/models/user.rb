class User < ApplicationRecord
    has_many :operations, as: :author
    has_many :groups
end
