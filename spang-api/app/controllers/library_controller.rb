class LibraryController < ApplicationController
  def index 
    render json: Library.all
  end
end
