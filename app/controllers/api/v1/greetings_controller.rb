module Api
  module V1
    class GreetingsController < ApplicationController
      
      def index
        render json: { "message": "Hola Mundo" }
    
    end
  end
end
