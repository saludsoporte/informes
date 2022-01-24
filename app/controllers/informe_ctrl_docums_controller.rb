class InformeCtrlDocumsController < ApplicationController
  before_action :set_informe_ctrl_docum, only: %i[ show edit update destroy ]

  # GET /informe_ctrl_docums or /informe_ctrl_docums.json
  def index
    @informe_ctrl_docums = InformeCtrlDocum.all
  end

  # GET /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def show
    logger.debug "**************************"
    logger.debug "**************************"+@informe_ctrl_docum.herramientum_id.to_s
    @herramienta = Herramientum.find(@informe_ctrl_docum.herramientum_id)
    @host = @herramienta.conexion_bd.host
    @port = @herramienta.conexion_bd.puerto
    @user = @herramienta.conexion_bd.usuario
    @password = @herramienta.conexion_bd.password
    @dbname = @herramienta.conexion_bd.nombre_herramienta
    
    listar_documentos(@host,@port,@user,@password,@dbname,@informe_ctrl_docum.fecha_doc.to_s)

  end

  def listar_documentos(host,port,user,password,dbname,fecha)
    @consulta="select * from dblink('host="+host+" port="+port+" user="+user+" dbname="+dbname+
    " password="+password+"','select * from documentos.anexos where fecha_doc=''"+fecha+"''') "+
    " as newTable(fecha_doc date,id_uade integer,entrada boolean,nombre_archivo text,"+
    "id_tipo_anexo integer,id_anexo integer,descripcion character varying,"+
    "id_docum_serial integer,id_docum character varying,sellado boolean) order by id_docum "
    logger.debug "*//////////////////////////////**************"+@consulta.to_s
    @arreglo = ActiveRecord::Base.connection.execute(@consulta).to_a
    @arreglo = @arreglo.paginate(:page => params[:page], :per_page =>10)
  end

  def descargar_archivo    
    @fecha=Time.parse(InformeCtrlDocum.find(params[:id]).updated_at.to_s)
    @mes=""
    case @fecha.month 
    when 1  
      @mes="01"
    when 2 
      @mes="febrero"
    when 3  
      @mes="marzo"
    when 4 
      @mes="abril"
    when 5  
      @mes="mayo"
    when 6 
      @mes="junio"
    when 7  
      @mes="julio"
    when 8 
      @mes="agosto"
    when 9  
      @mes="septiembre"
    when 10 
      @mes="octubre"
    when 11  
      @mes="noviembre"
    else
      @mes="diciembre"
    end
    send_file "/mnt/respaldos/Archivos_control_docum_respaldo/"+@fecha.year.to_s+"/"+@mes+"/"+params[:nombre] ,disposition: 'attachment' 
    #redirect_to informe_ctrl_docum_path(params[:id])
  end

  # GET /informe_ctrl_docums/new
  def new
    @informe_ctrl_docum = InformeCtrlDocum.new
  end

  # GET /informe_ctrl_docums/1/edit
  def edit
  end

  # POST /informe_ctrl_docums or /informe_ctrl_docums.json
  def create
    @informe_ctrl_docum = InformeCtrlDocum.new(informe_ctrl_docum_params)

    respond_to do |format|
      if @informe_ctrl_docum.save
        format.html { redirect_to @informe_ctrl_docum, notice: "Informe ctrl docum was successfully created." }
        format.json { render :show, status: :created, location: @informe_ctrl_docum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @informe_ctrl_docum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def update
    respond_to do |format|
      if @informe_ctrl_docum.update(informe_ctrl_docum_params)
        format.html { redirect_to @informe_ctrl_docum, notice: "Informe ctrl docum was successfully updated." }
        format.json { render :show, status: :ok, location: @informe_ctrl_docum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @informe_ctrl_docum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informe_ctrl_docums/1 or /informe_ctrl_docums/1.json
  def destroy
    @informe_ctrl_docum.destroy
    respond_to do |format|
      format.html { redirect_to informe_ctrl_docums_url, notice: "Informe ctrl docum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informe_ctrl_docum
      @informe_ctrl_docum = InformeCtrlDocum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def informe_ctrl_docum_params
      params.require(:informe_ctrl_docum).permit(:fecha_doc, :herramientum_id, :nombre_informe, :user_id)
    end
end
