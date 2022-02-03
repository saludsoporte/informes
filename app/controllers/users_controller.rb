class UsersController < ApplicationController
  load_and_authorize_resource
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

  def cargar_herramienta    
    redirect_to new_tabla_user_id_path(user_id:params[:user_id],herramienta:params[:herramientum_id])
  end
  
private
  def set_user
    @user = User.find(params[:id])
  end

end
