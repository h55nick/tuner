module ApplicationHelper
    def is_admin
      !@auth.nil? && @auth.is_admin
    end
    def is_auth
      !@auth.nil?
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
          song_list = "Please log in."
      end
      song_list
  end

    def sbutton(song)
      if is_auth
        usersongs.include?(song) ?  song.player : link_to("Buy me!",song, :class=>"button radius")
      else
        link_to("Login",login_path,:class=>'button radius success')
      end
    end

  def intellinav
    firstrow = ""

    if @auth.present?
        if @auth.is_admin

        end

       firstrow += "<li>#{link_to('Edit',edit_user_path(@auth.id), :class=>"button")}</li>"
       firstrow += "<li>#{link_to('Logout ' + @auth.name + " : " + number_to_currency(@auth.balance), login_path, :method => :delete, :confirm => "Are you sure?",:class=>"button")}</li>"
    else
      firstrow += "<li>#{link_to('Create Account', new_user_path,:class=>"button")}</li>"
      firstrow+= "<li>#{link_to('Login', login_path,:class=>"button")}</li>"

    end

    links =   "<ul class='button-group right'>"
    links += "<li>#{link_to("Home", root_path,:class=>'button')}"
    links += firstrow
    links += "</ul>"
  end


end

