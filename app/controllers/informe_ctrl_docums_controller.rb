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
    
    listar_documentos(@host,@port,@user,@password,@dbname,@informe_ctrl_docum.fecha_doc.to_s,@informe_ctrl_docum.fecha_ini.to_s,@informe_ctrl_docum.fecha_fin.to_s)

  end

  def listar_documentos(host,port,user,password,dbname,fecha,f_ini,f_fin)
    if @informe_ctrl_docum.rango
      @fecha="ane.fecha_doc >=''"+f_ini+"'' and ane.fecha_doc<=''"+f_fin+"''"
    else
      @fecha="ane.fecha_doc=''"+fecha+"''"
    end
    @consulta="select * from dblink('host="+host+" port="+port+" user="+user+" dbname="+dbname+
    " password="+password+"','select ane.fecha_doc,ane.nombre_archivo,ane.descripcion,ane.id_docum_serial,doc.asunto,doc.id_docum,doc.folio_entrada"+
    " from documentos.anexos as ane,documentos.documento as doc  "+
    " where "+@fecha+" and ane.id_docum_serial=doc.id_docum_serial')  "+
    #" order by an.id_docum,an.id_docum_serial,an.descripcion ') "+
    "as newTable(fecha_doc date,nombre_archivo character varying,descripcion character varying,id_docum_serial integer,"+
    "asunto character varying, id_docum character varying,folio_entrada character varying)"+
    "order by id_docum_serial asc"
    #@consulta="select * from dblink(')"

    logger.debug "-**/************************************/------- "+@consulta.to_s

    @arreglo = ActiveRecord::Base.connection.execute(@consulta).to_a
    if @arreglo.count > 10     
      @arreglo = @arreglo.paginate(:page => params[:page], :per_page =>10)
      @sin_pagina=false
    else 
      @sin_pagina=true
    end
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
    #send_file "/home/tomcat/ArchivosControlDocumental/"+@fecha.year.to_s+"/"+@mes+"/"+params[:nombre] ,disposition: 'attachment' 
    
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
      params.require(:informe_ctrl_docum).permit(:rango,:fecha_ini,:fecha_fin,:fecha_doc, :herramientum_id, :nombre_informe, :user_id)
    end
end
