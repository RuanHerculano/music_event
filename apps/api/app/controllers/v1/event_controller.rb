module V1
  class EventController < ApiController
    def create
      @event = Event.create!(create_params)
      render 'create.json', status: :created
    end

    def index
      @events = Event.all.page(params[:page]).per(params[:per])
      render 'list.json'
    end

    def festivals
      @events = Event.festivals.page(params[:page]).per(params[:per])
      render 'list.json'
    end

    def concerts
      @events = Event.concerts.page(params[:page]).per(params[:per])
      render 'list.json'
    end

    private
    def create_params
      params.require(:event).permit(
        :name,
        :schedule,
        :artist_ids,
        :genres_ids
      ).merge(event_artists: event_artists,
              event_genres: event_genres)
    end

    def event_artists
      artist_ids.map.with_index do |id, index|
        EventArtist.new({ artist_id: id,
                          order: index })
      end
    end

    def event_genres
      genres_ids.map do |id|
        EventGenre.new(genre_id: id)
      end
    end

    def artist_ids
      params[:event][:artist_ids] || []
    end

    def genres_ids
      params[:event][:genre_ids] || []
    end
  end
end
