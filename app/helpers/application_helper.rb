module ApplicationHelper
  def intellinav


    firstrow = ""
    secondrow = ""

    genrebutton = "#{link_to("Genres", genres_path,:class=>"button")}"
    secondrow += genrebutton
    albumbutton = "#{link_to("Albums", albums_path,:class=>"button")}"
    secondrow += albumbutton

    artistbutton = "#{link_to("Artists", artists_path,:class=>"button")}"
    secondrow += artistbutton

    if @auth.present?
        if @auth.is_admin
          secondrow += "<li>#{link_to('Show Users', users_path,:class=>"button")}</li>"

        end

       firstrow += "<li>#{link_to('Edit',edit_users_path, :class=>"button")}</li>"
       firstrow += "<li>#{link_to('Logout ' + @auth.name + " : " + number_to_currency(@auth.balance), login_path, :method => :delete, :confirm => "Are you sure?",:class=>"button")}</li>"
    else
      firstrow += "<li>#{link_to('Create Account', new_user_path,:class=>"button")}</li>"
      firstrow+= "<li>#{link_to('Login', login_path,:class=>"button")}</li>"

    end

    links = "<ul class='button-group right'>"
    links += "<li>#{link_to("Home", root_path,:class=>'button')}"
    links +=firstrow + "<br/>"
    links +=secondrow
    links += "</ul>"
  end
end