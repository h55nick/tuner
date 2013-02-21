class SongsController < ApplicationController
before_filter :check_if_admin, :except => [:index,:show]

#No check for admin
def index
 @songs = Song.all(:order => :name)
end
def show
  @song = Song.find(params[:id])
end

#Freshies (admin only)
def new
  @song = Song.new()
end
def create
  @song = Song.new(params[:song])
  @song.save ? redirect_to(songs_path) : render(:new)
end

#Oldies trick (admin only)
def edit
  @song = Song.find(params[:id])
  render :new
end
def update
Song.find(params[:id]).update_attributes(params[:song]) ? redirect_to(songs_path) : render(:new)
end

def destroy
  Song.find(params[:id]).delete ? redirect_to(songs_path) : []
end


end
