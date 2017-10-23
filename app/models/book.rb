class Book < ApplicationRecord
  belongs_to :author
  def index
    @books = Book.all
  end

  def to_s
    self.name
  end


end
