class CommentsController < ApplicationController




  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    @comment.user = current_user

    redirect_to blog_path(@blog)

  end

  def destroy

    @blog = Blog.find(params[:blog_id])#find the blog by blog id and store it in @blog
    @comment = @blog.comments.find(params[:id]) #find comments with similar blog_id
    @comment.destroy
    redirect_to blog_path(@blog)
  end

  def show

  end



  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
