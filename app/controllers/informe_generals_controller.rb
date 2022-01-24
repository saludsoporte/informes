class InformeGeneralsController < ApplicationController
  before_action :set_informe_general, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #load_and_authorize_resource
  # GET /informe_generals or /informe_generals.json
  def index

    if params[:herr_id].nil?
      @informe_generals = InformeGeneral.paginate(page: params[:page]).where(user_id:current_user.id)
    else
      @informe_generals = InformeGeneral.paginate(page: params[:page]).where(user_id:current_user.id,herramientum_id:params[:herr_id])
    end
    # @info=InformeGeneral.accessible_by(current_ability)
    # authorize! :read, @informe_generals
  end

  def buscar_informe
    @herramienta=params[:herramientum_id]
    redirect_to informe_generals_path(herr_id:@herramienta)
  end
  

  # GET /informe_generals/1 or /informe_generals/1.json
  def show
    @herramienta = Herramientum.find(@informe_general.herramientum_id)
    @host = @herramienta.conexion_bd.host
    @port = @herramienta.conexion_bd.puerto
    @user = @herramienta.conexion_bd.usuario
    @password = @herramienta.conexion_bd.password
    @dbname = @herramienta.conexion_bd.nombre_herramienta
        
    case @herramienta.nombre_sistema
    when "Covid_test"
      begin
       covid_test(@host, @port, @user, @password, @dbname)
      rescue
        @excepcion="No se ha podido conectar al servidor, revise su conexion"
       logger.debug "****************************** se rescato  "
      end  
    when "Sesalud"
    end
  end

  def covid_test(host, port, user, password, dbname)
    #busca informe segun la herramienta, *agregar un case when para cada una
    @consulta = "SELECT * from dblink('host=" + host +
                " port=" + port + " user=" + user + " password=" + password + " dbname=" + dbname + " '," +
                "'select * from registros.inventarios_informe_caducados_tabla( " + @informe_general.usuario_informe_id.to_s +
                "," + @informe_general.partida.partida.to_s + ", now()::date,"+@informe_general.tipo_informe+")') as newTable(cveart character varying, partida character varying, desart text, unimed text, presentacion text, precio numeric, columnas text,resumen text)"
    @arreglo = ActiveRecord::Base.connection.execute(@consulta).to_a

    
    #@arreglo=User.paginate(page:params[:page]).find_by_sql(@consulta)
    @unidades_nombre = @arreglo[0]["columnas"].split(/{|}/)        
    @unidades_arr = Array.new
    @unidades_nombre.each do |un|
      unless un == "" || un == ","
        @cad_nombre_f = un.split("|")
        if Unidad.find_by(nombre: @cad_nombre_f[0]).nil?
          @unidad_in = Unidad.create([
            nombre: @cad_nombre_f[0],
            fecha: @cad_nombre_f[1],
            entidad_id:Entidad.find(24),
            tipo_unidad_id:TipoUnidad.find(5),
          ])
          @unidad_in.save
          @unidades_arr.push(@unidad_in.id)
        else
          @unidad_in=Unidad.find_by(nombre: @cad_nombre_f[0])
          @unidad_in.update(fecha: @cad_nombre_f[1])
          @unidades_arr.push(@unidad_in.id)
        end
      end
    end
    @arreglo = @arreglo.paginate(:page => params[:page], :per_page =>10)
    @unidades = Array.new
    #crea la relaciones de los datos

    @plantilla = Plantilla.where(herramientum_id: @herramienta.id)
  end

  # GET /informe_generals/new
  def new
    @informe_general = InformeGeneral.new
    
  end

  def cargar_usuarios_h
    @herramienta=Herramientum.find(params[:herramienta_id])
#    @conexion=ConexionBd.find(@herramienta.conexion_bd_id)
    @host = @herramienta.conexion_bd.host
    @port = @herramienta.conexion_bd.puerto
    @user = @herramienta.conexion_bd.usuario
    @password = @herramienta.conexion_bd.password
    @dbname = @herramienta.conexion_bd.nombre_herramienta
    
    case @herramienta.nombre_sistema
    when "Covid_test"
      covid_test_user(@host, @port, @user, @password, @dbname)
    when "Sesalud"
    end
  end

  def covid_test_user(host, port, user, password, dbname)
    @consulta="select * from dblink('host=#{host} port=#{port} user=#{user} "+
    "password=#{password} dbname=#{dbname}',"+
    "'select * from registros.cat_usuarios order by id_usuario asc')as newTable(id_usuario integer,id_unidad integer,"+
    "curp character varying,login character varying,passwd character varying,"+
    "rol character varying,fecha_agr date ,cat_modulo character varying)"
    
    @arreglo = ActiveRecord::Base.connection.execute(@consulta).to_a
    render :partial => "select_usuarios" , :obj => @arreglo 
  end

  # GET /informe_generals/1/edit
  def edit
  end

  # POST /informe_generals or /informe_generals.json
  def create
    @herr = Herramientum.find(informe_general_params[:herramientum_id])
    #informe_general_params[:nombre] = @herr.nombre_sistema

    #logger.debug "/*/*/*****************" + @herr.nombre_sistema.to_s
    #logger.debug "/*/*/*****************" + informe_general_params[:nombre].to_s

    @informe_general = InformeGeneral.new(informe_general_params)
    #@informe_general.nombre = @herr.nombre_sistema
    @informe_general.usuario_informe_id=params[:usuario]
    respond_to do |format|
      if @informe_general.save
        format.html { redirect_to @informe_general, notice: "Informe general was successfully created." }
        format.json { render :show, status: :created, location: @informe_general }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_generals/1 or /informe_generals/1.json
  def update
    
    respond_to do |format|
      if @informe_general.update(informe_general_params)
        format.html { redirect_to @informe_general, notice: "Informe general was successfully updated." }
        format.json { render :show, status: :ok, location: @informe_general }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_generals/1 or /informe_generals/1.json
  def destroy
    @informe_general.destroy
    respond_to do |format|
      format.html { redirect_to informe_generals_url, notice: "Informe general was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_informe_general
    @informe_general = InformeGeneral.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def informe_general_params
    params.require(:informe_general).permit(:nombre, :user_id, :herramientum_id, :partida_id, :usuario_informe_id,:tipo_informe,:tipo_informacion,:referencia,:memorandum,:pdf)
  end
end
