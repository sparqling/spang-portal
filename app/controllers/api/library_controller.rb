module Api
  class LibraryController < ApplicationController
    def index
      render json: Library.all.map(&:to_h)
    end

    def show
      render json: Library.new(params[:id]).to_h(true)
    end
  end
end