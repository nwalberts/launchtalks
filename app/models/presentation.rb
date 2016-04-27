class Presentation < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
end
