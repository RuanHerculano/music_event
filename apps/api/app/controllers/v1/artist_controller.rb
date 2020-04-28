module V1
  class ArtistController < ApiController
    def create
      @artist = Artist.create!(create_params)
      render 'create.json', status: :created
    end
    
    def index
      @artists = Artist.all.page(params[:page]).per(params[:per])
      render 'list.json'
    end

    private

    def create_params
      params.require(:artist).permit(
        :name
      )
    end
  end
end
