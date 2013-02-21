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
          redirect_to root_path
        else
          render :new
        end
      end


#Need Login
  def edit
      @user = @auth
       render :new
  end
  def update
    @user = @auth
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
    redirect_to root_path
  end

######### Checks  #######################


end
