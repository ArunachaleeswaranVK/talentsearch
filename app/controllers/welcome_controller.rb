class WelcomeController < ApplicationController
  def index
    
    # wrtie code to order based on votes
    
    @posts = Post.all
    @literatures = Literature.all
  end
end
