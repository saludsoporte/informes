class InformeGeneralsController < ApplicationController

  before_action :set_informe_general, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  #load_and_authorize_resource
  # GET /informe_generals or /informe_generals.json
  def index    
    @informe_generals = InformeGeneral.paginate(page:params[:page]).all   
   # @info=InformeGeneral.accessible_by(current_ability)
  # authorize! :read, @informe_generals
  end

  # GET /informe_generals/1 or /informe_generals/1.json
  def show
    @herramienta=Herramientum.find(@informe_general.herramientum_id)
    @host=@herramienta.conexion_bd.host
    @port=@herramienta.conexion_bd.puerto
    @user=@herramienta.conexion_bd.usuario
    @password=@herramienta.conexion_bd.password
    @dbname=@herramienta.conexion_bd.nombre_herramienta

    #busca informe segun la herramienta, *agregar un case when para cada una
    @consulta="SELECT * from dblink('host="+@host+
    " port="+@port+" user="+@user+" password="+@password+" dbname="+@dbname+" ',"+
    "'select * from registros.inventarios_informe_caducados_tabla( "+@informe_general.usuario_informe_id.to_s+
    ","+@informe_general.partida.partida.to_s+", now()::date); ') as newTable(cveart character varying, partida character varying, desart text, unimed text, presentacion text, precio numeric, columnas text)" 
    @arreglo=ActiveRecord::Base.connection.execute(@consulta).to_a
    #@arreglo=User.paginate(page:params[:page]).find_by_sql(@consulta)
    @unidades_nombre= @arreglo[0]["columnas"].split(/{|}/)
    
    @unidades_arr=Array.new
    @unidades_nombre.each do |un|
      unless un == "" || un == ","
        @unidades_arr.push(un)
      end
    end
    @arreglo=@arreglo.paginate(:page=>params[:page],:per_page => 10)
    @unidades=Array.new
    #crea la relaciones de los datos 
  
    @plantilla=Plantilla.where(herramientum_id:@herramienta.id)
=begin    @arreglo.each do |i|
      @plantilla.each do |pl|
        logger.debug "/*/*/*/*/*/*/*/*   **** "+i[pl.dato.nombre.to_s].to_s
        logger.debug "/*/*/*/*/*/*/*/*   **** "+i[pl.dato.nombre.to_s].to_s        
        @relacion_datos.push(
          dato_id:pl.dato.id,
          valo:i[pl.dato.nombre.to_s],
          herramientum_id:@herramienta.id,
          informe_general_id:@informe_general.id
        )          
      end 
    end
=end
  end

  # GET /informe_generals/new
  def new
    @informe_general = InformeGeneral.new
  end

  # GET /informe_generals/1/edit
  def edit
  end

  # POST /informe_generals or /informe_generals.json
  def create
    @herr=Herramientum.find(informe_general_params[:herramientum_id])
    informe_general_params[:nombre]=@herr.nombre_sistema
    
    logger.debug "/*/*/*****************"+@herr.nombre_sistema.to_s
    logger.debug "/*/*/*****************"+informe_general_params[:nombre].to_s    
    
    @informe_general = InformeGeneral.new(informe_general_params)
    @informe_general.nombre=@herr.nombre_sistema
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
      params.require(:informe_general).permit(:nombre,:user_id,:herramientum_id,:partida_id,:usuario_informe_id)
    end
end
