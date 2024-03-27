class FetchBookDataJob < ApplicationJob
  queue_as :default

  def perform(query)
    books = OpenLibraryService.search_books(query)
    
    books.each do |book_data|
      # Create or update your Book records based on the fetched data.
      # This assumes your Book model has :title, :author, :isbn, :publish_date, :summary, and :page_count attributes.
      # You need to adjust the mapping based on the actual structure of the data returned by OpenLibraryService.search_books(query) and your Book model.
      
      isbn = book_data['isbn'] ? book_data['isbn'].first : nil
      
      Book.find_or_create_by(isbn: isbn) do |book|
        book.title = book_data['title']
        book.author = book_data['author_name']&.join(', ')
        book.publish_date = book_data['publish_date']&.first
        book.summary = book_data['description']&.value || book_data['first_sentence']&.value
        book.page_count = book_data['number_of_pages_median'] || book_data['number_of_pages']
        
        # Optionally, you can set more attributes here based on what the Open Library returns and what you wish to store.
      end
    end
  rescue => e
    Rails.logger.error "Failed to fetch or save book data: #{e.message}"
    # Depending on your app, you might want to raise the error, retry the job, or handle it in some other way.
  end
end
