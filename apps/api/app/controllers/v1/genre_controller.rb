module V1
  class GenreController < ApiController
    def create
      @genre = Genre.create!(create_params)
      render 'create.json', status: :created
    end
    
    def index
      @genres = Genre.all
      render 'list.json'
    end

    private

    def create_params
      params.require(:genre).permit(
        :name
      )
    end
  end
end
