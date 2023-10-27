class Artist < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :albums, class_name: 'Album'
  has_many :followers
  has_many :listeners, through: :followers

end
