class AlbumsController < ApplicationController
    #before_filter :check_if_logged_in, :except => [:new, :create]
    before_filter :check_if_admin, :except => [:index,:show]

def index
    @albums = Album.order(:name)
end
def show
  @album = Album.find(params[:id])
end


def new
  @album =Album.new()
end

def create
  @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
end

def update
  album = Album.find(params[:id])
  if album.update_attributes(params[:album])
    redirect_to albums_path
  else
    render :new
  end
end

def edit
  @album = Album.find(params[:id])
  render :new
end

def destroy
  Album.find(params[:id]).delete
  redirect_to albums_path
end

end
