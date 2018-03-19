require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @article = Article.create(title: 'UML', body: "In dolore amet nostrud ad cillum officia ad exercitation laboris tempor consectetur id velit est eu deserunt." , published_at: Date.today.to_s)
  end

  test "all_comment_field_must_be_presente" do
    comment =  @article.comments.build( )
    assert_not comment.save, "Los comentarios se pueden con campos vacios #{comment.errors.messages}"
  end

  test "email_have_wring_format" do
    comment = @article.comments.build(name: "foo" , email: "email_without_format", body: "Pariatur labore tempor tempor magna amet eiusmod fugiat ea nulla sed nulla enim dolor amet irure incididunt sed excepteur.")
    assert_not(comment.save, "Se puede guardar comentario con formato email incorrecto #{comment.errors.messages}")
  end
end
