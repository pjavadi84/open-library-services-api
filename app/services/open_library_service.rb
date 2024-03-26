require 'net/http'
require 'json'

class OpenLibraryService
    BASE_URL = "https://openlibrary.org/search.json"
  
    def self.search_books(query)
      url = "#{BASE_URL}?q=#{URI.encode_www_form_component(query)}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)['docs']
    end

    
  end