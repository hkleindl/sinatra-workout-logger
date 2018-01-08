class User < ActiveRecord::Base
  has_many :workouts
  has_many :exercises, through: :workouts

  has_secure_password

  def slug
    self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug_name)
    self.all.find do |o|
      o.slug == slug_name
    end
  end
end
