class CommentsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => :destroy
  
  def create
    @micropost = Micropost.find(params[:comment][:micropost_id])
    @comment = @micropost.comments.build(params[:comment])
    if @comment.save
      redirect_to @micropost, :flash => { :success => "Comment created!" }
    else
      @feed_items = []
      render @micropost
    end
  end

  def destroy
    @comments.destroy
    redirect_to root_path, :flash => { :success => "Comment deleted!" }
  end
  
  private
  
    def admin_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      @user = User.find(@micropost.user_id)
      redirect_to @micropost if !current_user.admin? || current_user?(@user)
    end
end