class DiscussionsController < ApplicationController
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
			redirect_to root_path, notice: 'Discussion deleted'
		else
			flash[:failure] = 'Error deleting discussion'
			render 'new'
		end
	end

	def update
		@discussion = Discussion.find(params[:id])
		if @discussion.update_attributes(discussion_params)
			flash[:success] = 'Discussion successfully updated'
			redirect_to @discussion
		else
			flash[:failure] = 'Failed to update discussion, please try again'
			render 'new'
		end
	end

	def edit
		@discussion = Discussion.find(params[:id])
	end

	protected

	def discussion_params
		params.require(:discussion).permit(:subject, :content).merge(user_id: current_user.id)
	end
end
