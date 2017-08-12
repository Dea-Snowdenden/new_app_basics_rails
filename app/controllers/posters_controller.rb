class PostersController < ApplicationController
    before_action :find_poster, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def show
    end
    
    def new
        @poster = Poster.new
    end
    
    def create
        @poster = Poster.new(poster-params)
        if @poster.save
            redirect_to @poster, notice: "Posted!!!"
        else
            render 'new'
        end
    end    
    
    private
    def poster_params
        params.require(:poster).permit(:title, :description)
    end
    
    def find_poster
        @poster = Poster.new(params[:id])
    end
    
end
