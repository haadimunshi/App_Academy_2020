class ArtworksController < ApplicationController

    def index
        artworks = Artwork.where(artist_id: params[:user_id])
        shared_artwork_records = ArtworkShare.where(viewer_id: params[:user_id])

        shared_artworks = []
        shared_artwork_records.map do |shared_artwork_record|
            shared_artworks << shared_artwork_record.artwork
        end
        
        all_artworks = artworks + shared_artworks
        render json: all_artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 412
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end


    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
