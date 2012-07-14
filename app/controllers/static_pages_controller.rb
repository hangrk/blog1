class StaticPagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 3)
  end

  def help
  end

  def about
  end

  def contact
  end
end
