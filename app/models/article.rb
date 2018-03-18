class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: { message: "El titulo del articulo debe estar presente" }, 
            uniqueness: { message: "El titulo del articulo debe ser unico" },
            format: { :with => /\A[a-zA-Z]+\z/, :message => "El titulo solo debe tener letras" }

  validates :body, presence: { message: "El cuerpo del articulo debe estar presente" },
            format: { :with => /\A[a-zA-Z]+\z/, :message => "El cuerpo del articulo solo debe tener letras" }

  validates :published_at, presence: { message: "La fecha del articulo debe estar presente" }
end
