class Alert < ApplicationRecord
  include ActionView::Helpers::DateHelper
  self.inheritance_column = :_type_disabled

  has_and_belongs_to_many :tags

  validates :type, presence: true
  validates :type, inclusion: { in: ["Open Portal", "Closed Portal"], message: "Type only accepts Open Portal and Closed Portal as values" }
  validates :description, presence: true
  validates :origin, presence: true

  def tag_names(names)
    self.tags = names.map { |name| Tag.find_or_create_by(name: name.strip.downcase) }
  end

  def created_at_in_words
    time_ago_in_words(created_at)
  end

  def as_json(options = {})
    super(options.merge({methods: [:created_at_in_words]}))
  end
end
