class LibraryController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def show_template
    @template = Library.find(params[:library_id]).templatesparams[:template_id])
  end

  def search_template
    @query = params[:search]
    @template_groups = Template.search(@query)
  end
end