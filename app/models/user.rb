class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }
  validates :username, presence: true, uniqueness: true,
  length: { in: 3..15 },
  format: {
    with: /\A[a-z0-9A-Z]+\z/,   #  indica que se permiten letras de la a-7, numeros del 0-9 y mayusculas de la A-Z
    message: :invalid
  }
  validates :password, length: { minimum: 6  }

  has_many :products, dependent: :destroy   # Dependent :destroy indica que se borre todo lo que le correponde al usuario si se borra

  before_save :downcase_attributes

  private

  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase
  end

end
