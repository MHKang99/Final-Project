class Api::V1::GamesController < Api::ApplicationController
    before_action :find_game, only: [:destroy]
    
    def index
        games = Game.order(highscore: :desc)
        render(json: games, each_serializer: GameCollectionSerializer)
    end

    def create
        game = Game.new(game_params)
        game.user = current_user
        game.save!
        render json: { id: game.id }
    end

    def destroy
        game = Game.find_by_id(params[:id])
        if game.destroy
            render( json: { status:200 } )
        else
            render( json: { status:500 } )
        end
    end

    def show
        game = Game.find(params[:id])
        render(json: game)
    end

    def user_index
        games = Game.where(user_id: (params[:id])).reorder(highscore: :desc)
        render(json: games)
    end

    private

    def game_params
        params.require(:game).permit(:moves, :win, :highscore)
    end

    def find_game
        game = Game.find_by_id(params[:id])
    end
end
