class BlogController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @posts = Post.find_all_by_state('Published')
  end
end
