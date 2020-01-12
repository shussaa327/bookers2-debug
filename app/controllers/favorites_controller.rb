class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    if params[:type] == "index"
      redirect_to books_path
    else
      redirect_to book_path(book)
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    if params[:type] == "index"
      redirect_to books_path
    else
      redirect_to book_path(book)
    end
  end
end
