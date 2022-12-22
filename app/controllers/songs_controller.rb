class SongsController < ApplicationController
  before_action :set_song, only: %i[show update destroy]

  # GET /songs
  # GET /songs.json
  def index
    query = Song.filter(filtering_params)
    @songs = query.page(params[:page])
    render json: {
      result: @songs,
      number_pages: (query.count / WillPaginate.per_page.to_f).ceil,
      count: @songs.length,
      total: query.count
    }
  end

  # GET /songs/1
  # GET /songs/1.json
  def show; end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    if @song.save
      render :show, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    if @song.update(song_params)
      render :show, status: :ok, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    params.require(:song).permit(:title, :artist, :genre, :lyrics)
  end

  def filtering_params
    params.slice(:title, :artist)
  end
end
