  class CommentsController < ApplicationController
    #routings
    get "/comments" do
     comments = Comments.all
     comments.to_json
end
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

end