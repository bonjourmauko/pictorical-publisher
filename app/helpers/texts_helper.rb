module TextsHelper
  def illustrate_text(text_id)
    @book = Book.create(:text_id => text_id)
    edit_book_path @book[:id]
  end
end
