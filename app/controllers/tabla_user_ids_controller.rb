class TablaUserIdsController < ApplicationController
  before_action :set_tabla_user_id, only: %i[ show edit update destroy ]

  # GET /tabla_user_ids or /tabla_user_ids.json
  def index
    @tabla_user_ids = TablaUserId.all
  end

  # GET /tabla_user_ids/1 or /tabla_user_ids/1.json
  def show
  end

  # GET /tabla_user_ids/new
  def new
    @tabla_user_id = TablaUserId.new
    @herramienta=Herramientum.find(params[:herramienta])
    @host = @herramienta.conexion_bd.host
    @port = @herramienta.conexion_bd.puerto
    @user = @herramienta.conexion_bd.usuario
    @password = @herramienta.conexion_bd.password
    @dbname = @herramienta.conexion_bd.nombre_herramienta
    @consulta="SELECT * from dblink('host="+@host+" port="+@port+
    " user="+@user+" password="+@password+" dbname="+@dbname+" ', "+
    "'select id_persona, nombre,puesto,titulo ,direccion,contrasena, usuario  "+
    " from "+@herramienta.conexion_bd.tabla_user.to_s+" ORDER BY id_persona ASC LIMIT 100 ')  "+
    " as newTable("+ctrldocum_tabla+")"
    logger.debug "*****************************************  "+@consulta
    @arreglo=ActiveRecord::Base.connection.execute(@consulta).to_a
  end

  def ctrldocum_tabla
    @columnas=" id_persona integer, nombre character varying,puesto character varying,titulo character varying,direccion character varying,contrasena character varying,"+
    " usuario character varying "
  end
  # GET /tabla_user_ids/1/edit
  def edit
  end

  # POST /tabla_user_ids or /tabla_user_ids.json
  def create
    @tabla_user_id = TablaUserId.new(tabla_user_id_params)
    @tabla_user_id.id_user=params[:select_user]
    respond_to do |format|
      if @tabla_user_id.save
        format.html { redirect_to @tabla_user_id, notice: "Tabla user was successfully created." }
        format.json { render :show, status: :created, location: @tabla_user_id }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tabla_user_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tabla_user_ids/1 or /tabla_user_ids/1.json
  def update
    respond_to do |format|
      if @tabla_user_id.update(tabla_user_id_params)
        format.html { redirect_to @tabla_user_id, notice: "Tabla user was successfully updated." }
        format.json { render :show, status: :ok, location: @tabla_user_id }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tabla_user_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabla_user_ids/1 or /tabla_user_ids/1.json
  def destroy
    @tabla_user_id.destroy
    respond_to do |format|
      format.html { redirect_to tabla_user_ids_url, notice: "Tabla user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tabla_user_id
      @tabla_user_id = TablaUserId.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tabla_user_id_params
      params.require(:tabla_user_id).permit(:user_id, :herramientum_id, :id_user, :nombre_herramienta)
    end
end