class Alert < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_and_belongs_to_many :tags

  validates :type, presence: true
  validates :description, presence: true
  validates :origin, presence: true

  def tag_names(names)
    self.tags = names.map { |name| Tag.find_or_create_by(name: name.strip.downcase) }
  end
end
