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
    
    if params[:serial].nil?
      serial=""
    else
      serial=" an.id_docum_serial ="+params[:serial]+" and "
    end       
    if params[:carga]
      logger.debug "434343434343434343434"
      listar_documentos
    end
    buscar_propietarios(@host,@port,@user,@password,@dbname)
  end

  def buscar_propietarios(host,port,user,password,dbname)
    @proper=TablaUserId.find_by(user_id:@informe_ctrl_docum.user_id)
    @consulta="select * from dblink('host="+host+" port="+port+" user="+user+" dbname="+dbname+
    " password="+password+"','SELECT b.acceso_a,u.id_persona,u.nombre FROM carpetas.acceso_buzones as b,"+
    "catalogos.personas_usuarios as u where b.usuario=''"+@proper.usuario+"'' and b.acceso_a=u.usuario') "+
    "as newTable(acceso_a character varying,id_persona integer,nombre character varying)"
    @arreglo_propietario=ActiveRecord::Base.connection.execute(@consulta).to_a
  end

  def buscar_serial
    @informe=InformeCtrlDocum.find(params[:id])
     
    if params[:carga]=true 
      logger.debug "222222222222222222222222222222" 
      redirect_to informe_ctrl_docum_path(@informe.id,serial:params[:serial],carga:true,id_persona:params[:id_persona])
    end

    
  end
  
  def listar_documentos
    @informe_ctrl_docum=InformeCtrlDocum.find(params[:id])
    @herramienta = @informe_ctrl_docum.herramientum
    host = @herramienta.conexion_bd.host
    port = @herramienta.conexion_bd.puerto
    user = @herramienta.conexion_bd.usuario
    password = @herramienta.conexion_bd.password
    dbname = @herramienta.conexion_bd.nombre_herramienta
    fecha=@informe_ctrl_docum.fecha_doc
    f_ini=@informe_ctrl_docum.fecha_ini
    f_fin=@informe_ctrl_docum.fecha_fin
    

    if @informe_ctrl_docum.rango
      @fecha="an.fecha_doc >=''"+f_ini.to_s+"'' and an.fecha_doc<=''"+f_fin.to_s+"''"
    else
      @fecha="an.fecha_doc=''"+fecha.to_s+"''"
    end

    if params[:serial]!=''
      serial=" an.id_docum_serial="+params[:serial]+" and "
    else
      serial=""
    end

    @consulta="select * from dblink('host="+host+" port="+port+" user="+user+" dbname="+dbname+
    " password="+password+"','select distinct an.fecha_doc,an.nombre_archivo,an.descripcion,an.id_docum_serial,"+
    " doc.asunto,doc.id_docum,doc.folio_entrada "+
    " FROM documentos.destinatarios as de inner join documentos.documento as doc on de.id_docum_serial=doc.id_docum_serial "+
    " inner join documentos.anexos as an on doc.id_docum_serial=an.id_docum_serial	"+
    " where "+@fecha.to_s+" and de.id_personal="+params[:id_persona]+" and "+serial.to_s+" an.id_docum_serial=doc.id_docum_serial')  "+
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
      logger.debug "///////////////////////////"
    else 
      @sin_pagina=true
    end

    #render :partial => "partials/documentos_por_user" , :obj => @arreglo    
  end

  def cargarArchivos
    
    redirect_to informe_ctrl_docum_path(params[:informe_id],carga:true,id_persona:params[:id_persona],serial:params[:serial])
  end

  def descargar_archivo    
    @fecha=Time.parse(params[:fecha_doc].to_s)
    @mes=""
    case @fecha.month 
    when 1  
      @mes="01"
    when 2 
      @mes="02"
    when 3  
      @mes="03"
    when 4 
      @mes="04"
    when 5  
      @mes="05"
    when 6 
      @mes="06"
    when 7  
      @mes="07"
    when 8 
      @mes="08"
    when 9  
      @mes="09"
    when 10 
      @mes="10"
    when 11  
      @mes="11"
    else
      @mes="12"
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
