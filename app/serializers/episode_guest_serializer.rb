class EpisodeGuestSerializer < ActiveModel::Serializer
  attributes :id, :date, :number

  # has_many :appearances
  has_many :guests, through: :appearances
end
