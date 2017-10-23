class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new #benötigt um dem Formular etwas zu übergeben.
    @author.books.build #Controller merkt sich, dass Buch zum Author gehört.
  end

  def create
    Author.create(author_params)

    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])

  end

  def update
    @author = Author.update(params[:id])

    redirect_to authors_path
  end

  def destroy
    @author.destroy
  end


private
  def author_params
    params.require(:author).permit(:name, books_attributes: [:id, :title, :_destroy])
  end

end
