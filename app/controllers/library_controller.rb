class LibraryController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.new(params[:id])
  end

  def show_template
    @template = Library.new(params[:library_id]).templates.select{ |template| template.name == params[:template_id]}.first
  end

  def search_template
    @query = params[:keyword]
    @template_groups = Template.search(@query)
  end
end