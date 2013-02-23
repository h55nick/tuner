class UsersController < ApplicationController
    before_filter :check_if_logged_in, :except => [:new, :create]
    before_filter :check_if_admin, :only => [:index, :destroy]


#No need for Log-in
    def new
        @user = User.new()
    end


    def create
        @user = User.new(params[:user])
        if @user.save
          #Create a 'hidden' mixtape to hold songs
          @user.mixtapes = [Mixtape.create(:name=>"All Songs") ]
          @user.save
          redirect_to root_path
        else
          render :new
        end
      end


      def show
        redirect_to root_path
      end
#Purchase song + add to mixtape
def purchase
  song = Song.find(params[:id])
  if @auth.balance > song.price && song.update_attributes(params[:song]) && @auth.update_attributes(:balance =>(@auth.balance - song.price))
          @auth.mixtapes[0].songs << song if !@auth.mixtapes[0].nil?
        redirect_to mixtapes_path
  else
    redirect_to song_path(song.id)
  end
end

#Need Login
  def edit
      @user = User.find(params[:id])
      if  ((@user == @auth )|| (is_admin) )
        render :new
        else
          redirect_to root_path
      end
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(root_path)
    else
      render :new
    end
  end

  #Need admin!
  def index
      @users = User.all(:order => "balance DESC")
  end
  def destroy
    User.find(params[:id]).delete
    redirect_to users_path
  end

######### Checks  #######################


end
