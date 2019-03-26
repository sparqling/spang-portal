module Api
  class LibraryController < ApplicationController
    def index
      render json: Library.all
    end

    def show
      render json: Library.find(params[:id])
    end
  end
end