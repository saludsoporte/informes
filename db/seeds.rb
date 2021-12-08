# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rol.all.count==0
    Rol.create([
        {nombre:"admin",descripcion:"Usuario que puede manejar todos los modulos de la herramienta"},
        {nombre:"operador",descripcion:"Este usuario puede usar los modulos basicos y no puede entrar en las configuraciones"},
        {nombre:"general",descripcion:"con este rol se limita a solo leer las entradas de los informes y todos los contenidos"},
        {nombre:"director",descripcion:"con este rol se puede acceder a los informes para poder crearlos y editarlos ademas de tener acceso a modulos especificos"}
    ])
end
User.create([{email:"salud.aplicaciones@gmail.com",username:"salud",password:"admin_"}])
@user=User.last
@rol=Rol.find_by(nombre:"admin")
unless @rol.nil?
    Perfil.create([{rol_id:@rol.id,user_id:@user.id}])
end