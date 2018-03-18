require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "article_fields_are_not_present" do
    article = Article.new()
    assert_not(article.save, "La entidad se guarda sin campos #{article.errors.messages}")
  end

  test "article_fields_are_not_correct_type" do
    article = Article.new(title: 123, body: 1223, published_at: Date.today.to_s)
    assert_not(article.save, "La entidad guarda con los tipos de los campos incorrectos #{article.errors.messages}")
  end

  test "article_title_should_be_unique" do
    article = Article.new(title: "UML", body: "Lorem", published_at: Date.today.to_s)
    article.save
    article = Article.new(title: "UML", body: "Lorem", published_at: Date.today.to_s)
    assert_not(article.save, "La entidad guarda repitiendo nombre del articulo #{article.errors.messages}")
  end
end
