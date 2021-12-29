class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #belongs_to :unidad
  has_many :perfils
  #belongs_to :personal
  #belongs_to :perfil
  
  validate :validate_username
 # validate :roles
  validate :username
  attr_writer :login  
  attr_accessor :roles
  
  self.per_page = 10
  scope :ultimos, ->{order("id asc")}
  def login
    @login || self.username || self.email
  end

  def perfiles?
    if Perfil.where(user_id:self.id).count > 0
      true
    else
      false
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value",{:value => login.downcase}]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: username).exists?     
      errors.add(:username, :invalid)
    end
  end

  def unidad
    !self.unidad_id.nil? ? nombre_oracion(Unidad.find(self.unidad_id).nombre) : "Sin unidad asociada"
  end
  def area
    !self.area_id.nil? ? nombre_oracion(Area.find(self.area_id).nombre) : "Sin area asociada"
  end
  def departamento
    !self.departamento_id.nil? ? nombre_oracion(Departamento.find(self.departamento_id).nombre) : "Sin departamento asociado"
  end
  def subdireccion
    !self.subdireccion_id.nil? ? nombre_oracion(Subdireccion.find(self.subdireccion_id).nombre) : "Sin subdireccion asociada"
  end
  def direccion
    !self.direccion_id.nil? ? nombre_oracion(Direccion.find(self.direccion_id).nombre) : "Sin direccion asociada"
  end  

  def nombre_oracion(nombre)
    nombre.titleize
  end
end
