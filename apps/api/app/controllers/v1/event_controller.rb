module V1
  class EventController < ApiController
    def create
      @event = Event.create!(create_params)
      render 'create.json', status: :created
    end

    def index
      list_gatherer(:all)
      render 'list.json'
    end

    def festivals
      list_gatherer(:festivals)
      render 'list.json'
    end

    def concerts
      list_gatherer(:concerts)
      render 'list.json'
    end

    private
    def list_gatherer(method)
      @events = Event.send(method).without_genres(params[:exclude_genre])
        .with_genres(params[:include_genre])
        .order_by_schedule
        .page(params[:page])
        .per(params[:per])
    end

    def create_params
      params.require(:event).permit(
        :name,
        :schedule,
        :location,
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
