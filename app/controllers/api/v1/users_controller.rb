class Api::V1::UsersController < Api::ApplicationController
    def current
        render json: current_user
    end

    def create
        user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :img)
        user = User.new user_params
        if user.save
            session[:user_id] = user.id
            render json: { id: user.id }
        end
    end

    def index
        users = User.order(av_highscore: :desc)
        render(json: users, each_serializer: UserCollectionSerializer)
    end

    def show
        user = User.find(params[:id])
        render(json: user)
    end

    def update
        user_params = params.require(:user).permit(:av_highscore, :av_moves_per_game)
        user = User.find(params[:id])
        user.update(user_params)
        render json: {id: user.id }
    end
end
