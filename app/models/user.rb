class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #belongs_to :rol
  has_many :perfils
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

 
  
end
