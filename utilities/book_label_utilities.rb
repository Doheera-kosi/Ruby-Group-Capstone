require_relative '../classes/book'
require_relative '../classes/label'
require 'json'
# BookLabelUtilities module
module BookLabelUtilities
  def create_label
    p "Enter the label's title: "
    title = gets.chomp
    p 'Enter the color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def create_book
    p 'When was this book published? (dd-mm-yyyy)'
    publish_date = gets.chomp
    p 'Who published this book? '
    publisher = gets.chomp
    p 'What is the state of its cover? '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = create_label
    label.add_item(book)
    @books.push(book)
    @labels.push(label)
    puts "Book has been created successfully!\n"
  end

  def list_books
    if @books.empty?
      puts 'Books list is empty!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) ID: #{book.id}
        Publication date: #{book.publish_date}
        Cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'Labels list is empty!'
    else
      @labels.each_with_index do |label, index|
        puts "#{index}) ID: #{label.id}, Label: #{label.title}, Color: #{label.color}
        \n"
      end
    end
  end

  def save_books
    return unless @books.any?

    books_data = JSON.generate(@books, { max_nesting: false })
    if File.exist?('./storage_files/books.json')
      File.write('./storage_files/books.json', books_data)
    else
      File.write('./storage_files/books.json', books_data, mode: 'w+')
    end
  end

  def save_labels
    return unless @labels.any?

    labels_data = JSON.generate(@labels, { max_nesting: false })
    if File.exist?('./storage_files/labels.json')
      File.write('./storage_files/labels.json', labels_data)
    else
      File.write('./storage_files/labels.json', labels_data, mode: 'w+')
    end
  end

  def load_books
    books = []
    if File.exist?('./storage_files/books.json')
      data = File.read('./storage_files/books.json')
      if data != ''
        JSON.parse(data).map do |book|
          new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id'])
          label = book['label']
          new_label = Label.new(label['title'], label['color'], label['id'])
          new_book.label = new_label
          books.push(new_book)
        end
      end
    end
    books
  end

  def load_labels
    labels = []
    if File.exist?('./storage_files/labels.json')
      data = File.read('./storage_files/labels.json')
      if data != ''
        JSON.parse(data).map do |label|
          new_label = Label.new(label['title'], label['color'], label['id'])
          labels.push(new_label)
        end
      end
    end
    labels
  end
end
