class Comment < ApplicationRecord
  belongs_to :article

  validates :name, presence: {message: "El nombre de la persona debe estar presente"}
  validates :email, presence: {message: "El email debe estar presente"}, 
    format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/, message: "Formato incorrecto email" }
  validates :body, presence: {message: "Debe escribir un comentario"}
end
