class ReactionsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      post = Post.find(params[:post_id])
      reaction = post.reactions.build(reaction_params) #buildを使い、contentとtweet_idの二つを同時に代入
      reaction.user_id = current_user.id
      if reaction.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
  
    private
  
      def reaction_params
        params.require(:reaction).permit(:emoji)
      end
  end
