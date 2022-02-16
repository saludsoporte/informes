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

    @busca_h=TablaUserId.find_by(user_id:params[:user_id])

    if @busca_h.nil?
      @tabla_user_id = TablaUserId.new
      generarArreglo
    else
      redirect_to user_path(params[:user_id])
    end
  end

  def generarArreglo
    @herramienta=Herramientum.find(params[:herramienta])
    logger.debug "*/*/*-/*-/-*/-/-/-/--/- "+@herramienta.nombre_sistema.to_s
    @host = @herramienta.conexion_bd.host
    @port = @herramienta.conexion_bd.puerto
    @user = @herramienta.conexion_bd.usuario
    @password = @herramienta.conexion_bd.password
    @dbname = @herramienta.conexion_bd.nombre_herramienta

    @select=""
    @tabla=""
    case @herramienta.nombre_sistema
    when "Covid","Covid_test"
      @select =covid_meta
    when "Control Documental"
      @select=ctrldocum_meta
    when "Sesalud"
      @select=sesalud_meta
    end

    case @herramienta.nombre_sistema
    when "Control Documental"
      @tabla=ctrldocum_tabla
    when "Covid_test","Covid"
      @tabla=covid_tabla
    when "Sesalud" 
      @tabla=sesalud_tabla  
    end    

    case @herramienta.nombre_sistema
    when "Control Documental"
      @where=ctrldocum_where
    when "Covid_test","Covid"
      @where=covid_where
    when "Sesalud"   
      @where=sesalud_where
    end    
    
    if @tabla!=""
      @consulta="SELECT * from dblink('host="+@host+" port="+@port+
      " user="+@user+" password="+@password+" dbname="+@dbname+" ', "+
      "'select "+@select+" from "+@herramienta.conexion_bd.tabla_user.to_s+" "+@where+"')  "+
      " as newTable("+@tabla+")"       
      logger.debug "*****************************************  "+@consulta
      @arreglo=ActiveRecord::Base.connection.execute(@consulta).to_a
    end
  end
  def ctrldocum_meta
    @columnas="id_persona,nombre,puesto,titulo,direccion,contrasena,usuario"
  end
  def ctrldocum_where
    @condicion="where usuario is not  null and contrasena is not  null and usuario != '''' "
  end
  def ctrldocum_tabla
    @columnas=" id_persona integer, nombre character varying,puesto character varying,titulo character varying,direccion character varying,contrasena character varying,"+
    " usuario character varying "
  end

  def sesalud_meta
    @columnas="id_personal,login,serial_atencion,fecha_agr"
  end
  def sesalud_where
    @condicion="where login is not null "
  end
  def sesalud_tabla
    @columnas="id_personal integer,login character varying,serial_atencion integer,fecha_agr date"
  end
    
  def covid_meta
    @columnas="id_usuario,id_unidad,curp,login,rol,fecha_agr"
  end
  def covid_where
    @condicion="where login is not null"
  end
  def covid_tabla
    @columnas=" id_usuario integer,id_unidad integer,curp character varying,login character varying,rol character varying,fecha_agr date"
  end
  # GET /tabla_user_ids/1/edit
  def edit
    generarArreglo
  end

  # POST /tabla_user_ids or /tabla_user_ids.json
  def create    
    @nombre_h=Herramientum.find(params[:tabla_user_id][:herramientum_id]).nombre_sistema
    @tabla_user_id = TablaUserId.new(tabla_user_id_params)
    @split=params[:select_user].split("|")
    @id_user=@split[0]
    @nombre_user=@split[1]
    @tabla_user_id.id_user=@id_user
    @tabla_user_id.nombre_user=@nombre_user    

    logger.debug "23eq12321q3213 -*/*/*//* "+@split[2].to_s

    
    case @nombre_h
      when "Control Documental"       
        @usuario=@split[2]
      when "Covid","Covid_test,Sesalud"
        @usuario=@split[1]
    end

    logger.debug "!???????????????????"+@usuario.to_s
    @tabla_user_id.usuario=@usuario
    logger.debug "!???????????????????"+@tabla_user_id.to_s

    @tabla_user_id.nombre_herramienta=@tabla_user_id.herramientum.nombre_sistema
    respond_to do |format|
      if @tabla_user_id.save
        format.html { redirect_to user_path(@tabla_user_id.user_id), notice: "Tabla user was successfully created." }
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
      params.require(:tabla_user_id).permit(:user_id, :herramientum_id, :id_user, :nombre_herramienta,:usuario)
    end
end
