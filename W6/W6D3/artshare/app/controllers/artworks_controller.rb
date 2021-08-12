class ArtworksController < ApplicationController

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def index
        if params.has_key?(:user_id)
            artist_id = params[:user_id]
            @artworks = Artwork.where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', artist_id, artist_id )
            .joins(:shared_viewers)
        # else
        #     @artworks = Artwork.all
        end
        render json: @artworks
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render json: @artwork
        else
            render json: {error: 'There is no artwork with that id.'}, status: 404
        end
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.nil?
            render json: {error: 'There is no artwork with that id.'}, status: 404
            return
        end
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            @artwork.destroy
            render json: @artwork
        else
            render json: {error: 'There is no artwork with that id.'}, status: 404
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end