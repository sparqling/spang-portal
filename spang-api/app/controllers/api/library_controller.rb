class LibraryController < ApplicationController
  def index 
    render json: [
                   {
                     uri: 'https://hoge/uniprot'
                   }
                 ]
  end
end
