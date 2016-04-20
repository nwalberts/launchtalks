class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :presentations, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  before_create :build_default_profile

  private

  def build_default_profile
    build_profile
    true
  end
end
