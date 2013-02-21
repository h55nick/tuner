class ArtistsController < ApplicationController
  before_filter :check_if_admin, :except => [:index]

def index
  @artists = Artist.order(:name)
end
def show
  @artist = Artist.find(params[:id])
end

def new
  @artist = Artist.new()
end
def create
  @artist = Artist.new(params[:artist])
  @artist.save ? redirect_to(artists_path) : render(:new)
end

def edit
  @artist = Artist.find(params[:id])
  render :new
end

def update
  Artist.find(params[:id]).update_attributes(params[:artist]) ? redirect_to(artists_path) : render(:new)
end

def destroy
  Artist.find(params[:id]).delete
  redirect_to artists_path
end


end