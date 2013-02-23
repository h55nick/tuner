class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authentication


  def add_mixtape_to_user(mixtape)
      @auth.mixtapes << mixtape
      @auth.save
  end
  def is_auth
      !@auth.nil?
  end
   def is_admin
      !@auth.nil? && @auth.is_admin
    end
  def usersongs #returns array of songs
      if is_auth
        pre_songlist =[]
        song_list =[]
          @auth.mixtapes.each do |mixtape|
              mixtape.songs.each do |song|
                  pre_songlist  << song
                end
              end
          song_list = pre_songlist.uniq
      else
          song_list = "Please Log In"
      end
      song_list
  end




  private
  def authentication
    @auth = User.find(session[:user_id]) if session[:user_id].present?
  end
  def check_if_logged_in
      redirect_to root_path if @auth.nil?
  end
  def check_if_admin
      redirect_to root_path if  (!@auth.nil? && !@auth.is_admin )
  end


end
