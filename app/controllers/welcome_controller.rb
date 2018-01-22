class WelcomeController < ApplicationController
  def index
    @posts = Post.all
    @literatures = Literature.all
  end
end
