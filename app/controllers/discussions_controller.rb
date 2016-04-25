class DiscussionsController < ApplicationController
	def index
		@discussions = Discussion.all.reverse_order
	end

	def new
		@discussion = Discussion.new
	end

	def show
		@discussion = Discussion.find(params[:id])
	end

	def create
		@discussion = Discussion.new(discussion_params)
		if @discussion.save
			flash[:success] = 'Discussion successfully started'
			redirect_to @discussion
		else
			flash[:failure] = 'Failed to create discussion, please try again'
			render 'new'
		end
	end

	def destroy
		@discussion = Discussion.find(params[:id])
		if @discussion.destroy!
			flash[:success] = 'Discussion successfully deleted'
			render 'new', notice: 'Discussion deleted'
		else
			flash[:failure] = 'Error deleting discussion'
			render 'new'
		end
	end

	protected

	def discussion_params
		params.require(:discussion).permit(:subject, :content).merge(user_id: current_user.id)
	end
end
