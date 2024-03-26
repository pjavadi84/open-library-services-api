class RecommendationsController < ApplicationController
    def index
        query = params[:query] || 'Ruby'
        books = OpenLibraryService.search_books(query)
        render json: books
      end
      
end
