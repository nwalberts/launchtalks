class Presentation < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
end
