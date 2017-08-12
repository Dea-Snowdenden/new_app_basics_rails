class PostersController < ApplicationController
    before_action :find_poster, only: [:show, :edit, :update, :destroy]
    
    def index
        @poster = Poster.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
        @poster = current_user.posters.build
    end
    
    def create
        @poster = Poster.new(poster-params)
        if @poster.save
            redirect_to @poster, notice: "Posted!!!"
        else
            render 'new'
        end
    end    
    
    def edit
    end 
    
    def update
        if @poster.update(poster_params)
            redirect_to @poster, notice: "Congrats!"
        else
            render 'edit'
        end
    end
    
    def destroy
        @poster.destroy
        redirect_to root_path
    end
    
    private
    def poster_params
        params.require(:poster).permit(:title, :description)
    end
    
    def find_poster
        @poster = Poster.find(params[:id])
    end
    
end
