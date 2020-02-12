class VideosController < ApplicationController
    before_action :authorized

    def home
    end

    def index 
        @videos = Video.all
    end

    def new
        @video = Video.new
    end

    def create
        @video = Video.new(video_params)
        @video.user_id = session[:user_id]

        @video.clip.attach(params[:video][:clip])
        
        if @video.save 
            flash[:message] = 'You have successfully uploaded the video'
            session[:user_id] = @video.user_id
            redirect_to video_path(@video)
        else
            flash.now[:message] = @video.errors.full_messages
            render :new
        end
    end

    def show
        @video = Video.find_by_id(params[:id])
    end

    private 

    def video_params
        params.require(:video).permit(:title, :description, :user_id, :clip, :thumbnail)
    end

end
