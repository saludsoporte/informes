class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users=User.paginate(page:params[:page]).all
  end
  def new
  end

  def show
    @consulta=""
    @lista_user = TablaUserId.where(user_id:params[:id])
    @lista_user.each_with_index do |l,i|
      if i==@lista_user.count-1
        @consulta=@consulta.to_s+l.herramientum_id.to_s
      else
        @consulta=@consulta.to_s+l.herramientum_id.to_s+","
      end
    end
    logger.debug "******************* //////"+@consulta.to_s
    @herramientas=Herramientum.where("id not in (#{@consulta}) ")
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
