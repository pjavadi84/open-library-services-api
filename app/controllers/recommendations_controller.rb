class RecommendationsController < ApplicationController
    def index
        # Trigger the background job with a default query or based on user input
      FetchBookDataJob.perform_later('Ruby')
        # Immediately respond to the user, don't wait for the job to finish
      render json: { message: 'Fetching book data, please check back soon!' }
    end
end
