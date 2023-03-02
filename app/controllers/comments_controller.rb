  class CommentsController < ApplicationController
    #routings
    get "/comments" do
     comments = Comments.all
     comments.to_json
end
#post comments
post "/comments" do
        comment = params[:comment]
        post = params[:question]
        user = params[:user]

        if(comment.present? && post.present? && user.present?)
            comment = Comment.create(comment: comment, question_id: post, user_id: user)
            if comment
                message = {:succcess => "Comment created successfully!!"}
                message.to_json
            else
                message = {:error => "Error saving comment!"}
                message.to_json
            end
        else
            message = {:error => "All fields should be field!"}
            message.to_json
        end
    end



    #delete comment
    delete "/comments/:id" do
        count_comments = Comment.where(id: params[:id]).count() 
        if count_comments>0
            comment = Comment.find(params[:id])
            comment.destroy
            message = {:succcess => "Comment deleted successfully!!"}
            message.to_json

        else
            message = {:error => "Comment does not exist!"}
            message.to_json
        end
    end
    

end