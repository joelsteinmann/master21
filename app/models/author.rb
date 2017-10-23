class Author < ApplicationRecord
  has_many :books

#so kann Buch und Author zusammen gespeichert werden.
#reject_if: :all_blank = speichert Author aber keine Bücher ohne Titel, umgekehrt allerdings nicht.
accepts_nested_attributes_for :books, reject_if: :all_blank

def book_titles
  books.pluck(:title).each do |title|
    puts "This author wrote #{title}."
  end
end

  def to_s
    self.name
  end

end
