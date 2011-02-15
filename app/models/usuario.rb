class Usuario < ActiveRecord::Base
  TIPOS_SANGUINEOS = %w( A B AB O )
  
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  attr_accessible :nome, :email, :password, :password_confirmation, :remember_me
  
  validates_inclusion_of :tipo_sanguineo, in: Usuario::TIPOS_SANGUINEOS, allow_nil: true, allow_blank: true
  validates_inclusion_of :fator_rh, in: %w( + - ), allow_nil: true, allow_blank: true  
  validates_presence_of :nome
end
