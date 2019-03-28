class LibraryController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def show_template
    @template = Library.find_template(params[:library_id], params[:template_id])
  end

  def search_template
    @query = params[:search]
    @template_groups = Library.search_template(@query)
  end
end