class Cat < ApplicationRecord
  scope :kid_friendly, -> { where(kid_friendly: true)}
  scope :most_recent, -> { order(created_at: :desc).limit(3)}
  scope :age, -> { order(age: :asc)}
  scope :random, -> { order("RANDOM()").first}
end
