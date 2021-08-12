class ArtworkSharesController < ApplicationController

    def create
        @artwork_share = ArtworkShare.new(artwork_shares_params)
        if @artwork_share.save
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: unprocessable_entity
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find_by(id: params[:id])
        if @artwork_share
            @artwork_share.destroy
            render json: @artwork_share
        else
            render json: { error: 'There is no artwork share.' }, status: 404
        end
    end

    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end