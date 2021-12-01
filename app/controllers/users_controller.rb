class UsersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
    @user=User.find(params[:id])
  end
end
