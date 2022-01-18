class EpisodesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :episode_not_found

    def index
        episodes = Episode.all
        render json: episodes, status: :ok
    end

    def show
        episode = Episode.all.find(episode_params[:id])
        render json: episode, serializer: EpisodeGuestSerializer, status: :ok
    end

    def destroy
        episode = Episode.all.find(episode_params[:id])
        episode.destroy 
        render json: {}, status: :no_content
    end


    private

    def episode_params
        params.permit(:id, :date, :number)
    end

    def episode_not_found
        render json: {"error" => "Episode not found"}, status: :not_found
    end

end
