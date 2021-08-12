class ArtworksController < ApplicationController

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end