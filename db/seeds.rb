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
if User.find_by(username:"salud").nil?
    User.create([{email:"salud.aplicaciones@gmail.com",username:"salud",password:"admin_"}])
    @user=User.last
    @rol=Rol.find_by(nombre:"admin")
    unless @rol.nil?
        Perfil.create([{rol_id:@rol.id,user_id:@user.id}])
    end
end
if ConexionBd.all.count==0
    ConexionBd.create(
        [
            {nombre_herramienta:"seg_pac",puerto:"57361",host:"10.24.1.3",usuario:"postgres",password:"12345"},
            {nombre_herramienta:"covid",puerto:"57361",host:"10.24.1.3",usuario:"postgres",password:"12345"},
            {nombre_herramienta:"covid_test",puerto:"57361",host:"10.24.1.3",usuario:"postgres",password:"12345"},
            {nombre_herramienta:"seg_pac_sinba",puerto:"57361",host:"10.24.1.3",usuario:"postgres",password:"12345"},
            {nombre_herramienta:"ctrldocum",puerto:"5435",host:"10.24.1.3",usuario:"postgres",password:"12345"},
            {nombre_herramienta:"sisolc_prod",puerto:"5433",host:"10.24.1.3",usuario:"sisolc",password:"sisloco"},
            {nombre_herramienta:"activo_fijo",puerto:"5433",host:"10.24.1.3",usuario:"sisolc",password:"sisloco"}            
        ]
    )
end
