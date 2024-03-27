class RecommendationsController < ApplicationController
  def index
    query = params[:query] || 'Ruby'
    cache_key = "recommendations_#{query}"
  
    books = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      OpenLibraryService.search_books(query)
    end
  
    render json: books
  end
  
      
end
