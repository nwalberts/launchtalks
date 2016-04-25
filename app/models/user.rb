class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :presentations, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  before_create :build_default_profile

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    names = data["name"].split(" ")
    first_name = names[0]
    last_name = names[1]
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(first_name: first_name,
          last_name: last_name,
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          password: Devise.friendly_token[0,20]
        )
      end
   end
end

  private

  def build_default_profile
    build_profile
    true
  end
end
