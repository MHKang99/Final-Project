class GameSerializer < ActiveModel::Serializer
  attributes :id, :moves, :highscore, :created_at
  belongs_to :user, key: :author
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name
  end
end
