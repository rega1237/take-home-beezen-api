class Tag < ApplicationRecord
  has_and_belongs_to_many :alerts

  validates :name, presence: true, uniqueness: true
end
