class LiteraturesController < ApplicationController
        
    before_action :set_literature , only: [:show,:edit,:update,:destroy,:upvote]
    before_action :authenticate_user! , except: [:index,:show,:upvote,:search]
    
    def index
        @literatures = Literature.all
        # @view_count = literature.view_count(@literatures)
        # @like_count = literature.like_count(@literatures)
    end
    
    # def search
    #     @literatures = literature.search(params[:search]).order("CREATED_AT DESC")
    # end    
    
    def show
        # @previous = literature.previous_literature(params[:id])  
        # @next = literature.next_literature(params[:id])
        # @comments = @literature.comments
        # impressionist(@literature)
    end    
    
    def new
       @literature = current_user.literatures.build
       @category_id = params[:value]
    end    
    
    def create
       @literature = current_user.literatures.build(literature_params) 
        
        if @literature.save
           flash[:success] = "literature Created !"
           redirect_to root_path
        else
            render "new"
        end    
    end
    
    def edit
    
    end
    
    def update
        if @literature.update(literature_params)
            flash[:success] = "literature has been updated !"
            redirect_to @literature
        else
            render "edit"
        end    
    end
    
    def destroy
        @literature.destroy
        flash[:success] = "literature has been deleted !"
        redirect_to root_path
    end
    
    # def upvote
    #     voter = guest_user
    #     @literature.upvote_by voter
        
        
    #     redirect_to :back
    # end    
    
    
    private
    
    def set_literature
        @literature = Literature.find(params[:id])    
    end    
    
    def literature_params
        params.require(:literature).permit(:title,:body,:category_id)
    end 
    
end
