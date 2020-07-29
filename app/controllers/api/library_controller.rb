module Api
  class LibraryController < ApplicationController
    def index
      render json: Library.all.map(&:to_h)
    end

    def show
      render json: Library.new(params[:id]).to_h(true)
    end
    
    def incremental_search
      @query = params[:keyword]
      @template_groups = Template.search(@query)
      render json: @template_groups.map{ |_, t| t.map(&:name) }.flatten
    end

    def search_template
      @query = params[:keyword]
      @template_groups = Template.search(@query)
      render json: @template_groups.map{ |l, t| [l.name, t.map(&:to_h)] }.to_h
    end
    
    def query_template
      @template = Template.new(Library.new(params[:library_id]), params[:template_id])
      render plain: @template.query_to_endpoint(params.reject{|k, _| k == :template_id || k == :library_id}.permit!)
    end
  end
end