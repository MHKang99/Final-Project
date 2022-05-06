class Api::V1::PostsController < Api::ApplicationController
    def index
        posts = Post.order(created_at: :desc)
        render(json: posts, each_serializer: PostCollectionSerializer)
    end
end
