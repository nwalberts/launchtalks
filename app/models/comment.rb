class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation

  validates :body, presence: true
  validates :user, presence: true
  validates :presentation, presence: true
end
