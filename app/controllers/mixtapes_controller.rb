class MixtapesController <ApplicationController



def index
  @mixtapes = @auth.mixtapes
end

def show
  mixtape = Mixtape.find(params[:id])
  if @auth.mixtapes.include?(mixtape)
      @mixtape = mixtape
      render :show
  else
    redirect_to(mixtapes_path)
  end
end

def new
  is_auth ? @mixtape = Mixtape.new() : redirect_to(login_path)
end

def create
  @mixtape = Mixtape.new(params[:mixtape])
  if @mixtape.save
      add_mixtape_to_user(@mixtape)
      redirect_to(@mixtape)
  else
      render :new
  end
end


def update
  mt = Mixtape.find(params[:id])
  if mt.update_attributes(params[:mixtape])
    redirect_to mixtape_path(mt.id)
  else
    render :new
  end

end
def edit
  @mixtape = Mixtape.find(params[:id])
  render :new
end

def destroy
    Mixtape.find(params[:id]).delete
    redirect_to mixtapes_path
end


end