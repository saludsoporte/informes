# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rol.all.count == 0
  Rol.create([
    { nombre: "admin", descripcion: "Usuario que puede manejar todos los modulos de la herramienta" },
    { nombre: "operador", descripcion: "Este usuario puede usar los modulos basicos y no puede entrar en las configuraciones" },
    { nombre: "general", descripcion: "con este rol se limita a solo leer las entradas de los informes y todos los contenidos" },
    { nombre: "director", descripcion: "con este rol se puede acceder a los informes para poder crearlos y editarlos ademas de tener acceso a modulos especificos" },
  ])
end
if User.find_by(username: "salud").nil?
  User.create([{ email: "salud.aplicaciones@gmail.com", username: "salud", password: "admin_" }])
  @user = User.last
  @rol = Rol.find_by(nombre: "admin")
  unless @rol.nil?
    Perfil.create([{ rol_id: @rol.id, user_id: @user.id }])
  end
end
if ConexionBd.all.count == 0
  ConexionBd.create(
    [
      { nombre_herramienta: "seg_pac", puerto: "57361", host: "10.24.1.3", usuario: "postgres", password: "12345" },
      { nombre_herramienta: "covid", puerto: "57361", host: "10.24.1.3", usuario: "postgres", password: "12345" },
      { nombre_herramienta: "covid_test", puerto: "57361", host: "10.24.1.3", usuario: "postgres", password: "12345" },
      { nombre_herramienta: "seg_pac_sinba", puerto: "57361", host: "10.24.1.3", usuario: "postgres", password: "12345" },
      { nombre_herramienta: "ctrldocum", puerto: "5435", host: "10.24.1.3", usuario: "postgres", password: "12345" },
      { nombre_herramienta: "sisolc_prod", puerto: "5433", host: "10.24.1.3", usuario: "sisolc", password: "sisloco" },
      { nombre_herramienta: "activo_fijo", puerto: "5433", host: "10.24.1.3", usuario: "sisolc", password: "sisloco" },
    ]
  )
end
if Entidad.all.count == 0
  Entidad.create(
    [
      { nombre: "No especifica", abreviatura: "NULL" },
      { nombre: "Aguascalientes", abreviatura: "AS" },
      { nombre: "Baja California", abreviatura: "BC" },
      { nombre: "Baja California Sur", abreviatura: "BS" },
      { nombre: "Campeche", abreviatura: "CC" },
      { nombre: "Coahuila", abreviatura: "CL" },
      { nombre: "Colima", abreviatura: "CM" },
      { nombre: "Chiapas", abreviatura: "CS" },
      { nombre: "Chihuahua", abreviatura: "CH" },
      { nombre: "Distrito Federal", abreviatura: "DF" },
      { nombre: "Durango", abreviatura: "DG" },
      { nombre: "Guanajuato", abreviatura: "GT" },
      { nombre: "Guerrero", abreviatura: "GR" },
      { nombre: "Hidalgo", abreviatura: "HG" },
      { nombre: "Jalisco", abreviatura: "JC" },
      { nombre: "Mexico", abreviatura: "MC" },
      { nombre: "Michoacan", abreviatura: "MN" },
      { nombre: "Morelos", abreviatura: "MS" },
      { nombre: "Nayarit", abreviatura: "NT" },
      { nombre: "Nuevo Leon", abreviatura: "NL" },
      { nombre: "Oaxaca", abreviatura: "OC" },
      { nombre: "Puebla", abreviatura: "PL" },
      { nombre: "Queretaro", abreviatura: "QT" },
      { nombre: "Quintana Roo", abreviatura: "QR" },
      { nombre: "San Luis Potosi", abreviatura: "SP" },
      { nombre: "Sinaloa", abreviatura: "SL" },
      { nombre: "Sonora", abreviatura: "SR" },
      { nombre: "Tabasco", abreviatura: "TC" },
      { nombre: "Tamaulipas", abreviatura: "TS" },
      { nombre: "Tlaxcala", abreviatura: "TL" },
      { nombre: "Veracruz", abreviatura: "VZ" },
      { nombre: "Yucatan", abreviatura: "YN" },
      { nombre: "Zacatecas", abreviatura: "ZS" },
      { nombre: "Extranjero", abreviatura: "NE" },
      { nombre: "Se Ignora", abreviatura: "XX" },
    ]
  )
end
if TipoUnidad.all.count == 0
  TipoUnidad.create([
    { abreviatura: "AS", nombre: "INSTITUCIONES" },
    { abreviatura: "CE", nombre: "CENTRO DE SALUD" },
    { abreviatura: "EA", nombre: "COMISION ESTATAL" },
    { abreviatura: "HO", nombre: "HOSPITAL" },
  ])
end
