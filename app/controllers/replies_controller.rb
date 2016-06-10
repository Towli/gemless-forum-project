class RepliesController < ApplicationController

def create
	load_post
	@reply = @post.replies.new(reply_params_with_discussion_id)

	if @reply.save
		flash[:success] = "Reply successfully created"
	else
		flash[:failure] = "Failed to reply, please try again"
	end
	redirect_to @reply.discussion
end

def destroy
	load_reply_post
	@discussion	= @reply_post.discussion
	if @reply_post.destroy
		flash[:success] = 'Post successfully deleted.'
	else
		flash[:failure] = 'Failed to delete post, please try again.'
	end
	redirect_to @discussion
end

private

def reply_params
	params.require(:reply).permit(:content)
end

def reply_params_with_current_user
	reply_params.merge(user_id: current_user.id)
end

def reply_params_with_discussion_id
	reply_params_with_current_user.merge(discussion_id: params[:discussion_id])
end

def load_post
	@post = Post.find(params[:post_id])
end

def load_reply_post
	@reply_post = Post.find(params[:reply_id])
end

end
