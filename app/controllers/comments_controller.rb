class CommentsController < ApplicationController
    before_action :authorized

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @video = Video.find_by_id(session[:video_id])
        @comment.video_id = session[:video_id]
        
        if @comment.save
            redirect_to video_path(@comment.video_id)
        else
            flash.now[:message] = @comment.errors.full_messages[0]
            render :template => 'videos/show'
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :video_id, :clip, :thumbnail)
    end
end
