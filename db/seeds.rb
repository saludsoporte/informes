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
      { id:1,nombre: "Aguascalientes", abreviatura: "AS" },
      { id:2,nombre: "Baja California", abreviatura: "BC" },
      { id:3,nombre: "Baja California Sur", abreviatura: "BS" },
      { id:4,nombre: "Campeche", abreviatura: "CC" },
      { id:5,nombre: "Coahuila", abreviatura: "CL" },
      { id:6,nombre: "Colima", abreviatura: "CM" },
      { id:7,nombre: "Chiapas", abreviatura: "CS" },
      { id:8,nombre: "Chihuahua", abreviatura: "CH" },
      { id:9,nombre: "Distrito Federal", abreviatura: "DF" },
      { id:10,nombre: "Durango", abreviatura: "DG" },
      { id:11,nombre: "Guanajuato", abreviatura: "GT" },
      { id:12,nombre: "Guerrero", abreviatura: "GR" },
      { id:13,nombre: "Hidalgo", abreviatura: "HG" },
      { id:14,nombre: "Jalisco", abreviatura: "JC" },
      { id:15,nombre: "Mexico", abreviatura: "MC" },
      { id:16,nombre: "Michoacan", abreviatura: "MN" },
      { id:17,nombre: "Morelos", abreviatura: "MS" },
      { id:18,nombre: "Nayarit", abreviatura: "NT" },
      { id:19,nombre: "Nuevo Leon", abreviatura: "NL" },
      { id:20,nombre: "Oaxaca", abreviatura: "OC" },
      { id:21,nombre: "Puebla", abreviatura: "PL" },
      { id:22,nombre: "Queretaro", abreviatura: "QT" },
      { id:23,nombre: "Quintana Roo", abreviatura: "QR" },
      { id:24,nombre: "San Luis Potosi", abreviatura: "SP" },
      { id:25,nombre: "Sinaloa", abreviatura: "SL" },
      { id:26,nombre: "Sonora", abreviatura: "SR" },
      { id:27,nombre: "Tabasco", abreviatura: "TC" },
      { id:28,nombre: "Tamaulipas", abreviatura: "TS" },
      { id:29,nombre: "Tlaxcala", abreviatura: "TL" },
      { id:30,nombre: "Veracruz", abreviatura: "VZ" },
      { id:31,nombre: "Yucatan", abreviatura: "YN" },
      { id:32,nombre: "Zacatecas", abreviatura: "ZS" },
      { id:33,nombre: "Extranjero", abreviatura: "NE" },
      { id:34,nombre: "Se Ignora", abreviatura: "XX" },
      { id:35,nombre: "No especifica", abreviatura: "NULL" }
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
