require 'httparty'
class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :link, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :description, presence: true
  validates :lon, presence: true
  validates :lat, presence: true


  def self.meetups
    response = HTTParty.get("https://api.meetup.com/find/groups?key=#{ENV["MEETUP_KEY"]}&zip=02111&radius=5&topic_id=9300&upcoming_events=true&sign=true")
    response.each do |meetup|
      Meetup.create(
      name: meetup["name"],
      link: meetup["link"],
      city: meetup["city"],
      state: meetup["state"],
      description: meetup["description"],
      lon: meetup["lon"],
      lat: meetup["lat"]
      )
    end
  end
end
