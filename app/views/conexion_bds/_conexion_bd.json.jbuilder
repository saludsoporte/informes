json.extract! conexion_bd, :id, :nombre, :created_at, :updated_at
json.url conexion_bd_url(conexion_bd, format: :json)
