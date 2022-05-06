class UserCollectionSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :av_highscore, :av_moves_per_game
end
