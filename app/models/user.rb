class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 } # same as validates(:name, presence: true)
  validates :email, presence: true, length: { maximum: 255 }
end