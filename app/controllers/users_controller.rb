class UsersController < ApplicationController
  #load_and_authorize_resource
  def index
    @users=User.paginate(page:params[:page]).all
  end

  def new
  end

  def show
  end

  def edit
    @user=User.find(params[:id])
  end
end
