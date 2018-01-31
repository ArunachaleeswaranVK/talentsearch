class PostsController < ApplicationController
    
    before_action :set_post , only: [:show,:edit,:update,:destroy,:upvote,:downvote]
    before_action :authenticate_user! , except: [:index,:show,:search]
    
    def index
        @posts = Post.all
        # @view_count = Post.view_count(@posts)
        # @like_count = Post.like_count(@posts)
    end
    
    # def search
    #     @posts = Post.search(params[:search]).order("CREATED_AT DESC")
    # end    
    
    def show
        # @previous = Post.previous_post(params[:id])  
        # @next = Post.next_post(params[:id])
        # @comments = @post.comments
        # impressionist(@post)
    end    
    
    def new
       @post = current_user.posts.build
       @category_id = params[:value]
    end    
    
    def create
       @post = current_user.posts.build(post_params) 
        
        if @post.save
           flash[:success] = "Post Created !"
           redirect_to root_path
        else
            render "new"
        end    
    end
    
    def edit
    
    end
    
    def update
        if @post.update(post_params)
            flash[:success] = "Post has been updated !"
            redirect_to @post
        else
            render "edit"
        end    
    end
    
    def destroy
        @post.destroy
        flash[:success] = "Post has been deleted !"
        redirect_to root_path
    end
    
    def upvote
        
        @post.upvote_by current_user
        redirect_to :back
    end 
    
    def downvote
       
        @post.downvote_by current_user
        redirect_to :back
    end
    
    
    private
    
    def set_post
        @post = Post.find(params[:id])    
    end    
    
    def post_params
        params.require(:post).permit(:title,:body,:category_id)
    end 
end
