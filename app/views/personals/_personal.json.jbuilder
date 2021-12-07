json.extract! personal, :id, :nombre, :apellido_p, :apellido_m, :nombre_completo, :telefono, :calle, :numero, :colonia, :cp, :curp, :fecha_nacimiento, :created_at, :updated_at
json.url personal_url(personal, format: :json)
