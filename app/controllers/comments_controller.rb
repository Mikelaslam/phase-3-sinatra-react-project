  class CommentsController < ApplicationController
    #routings
    get "/comments" do
     comment = Comment.all
     comment.to_json
end

#post comments
post "/comments" do
  title = params[:title]
  category = params[:category]
  content = params[:content]
  user_id = params[:user_id]
  question_id = params[:question_id]
  
  if title.present? && category.present? && content.present? && user_id.present? && question_id.present?
    comment = Comment.create(title: title, category: category, content: content, user_id: user_id, question_id: question_id)
    
    if comment
      message = { success: "Comment created successfully!" }
      message.to_json
    else
      message = { error: "Error saving comment!" }
      message.to_json
    end
  else
    message = { error: "All fields should be filled!" }
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

   # update# patch comments
patch "/comments/:id" do
  comment = Comment.find(params[:id])
  if comment.present?
    comment.comment = params[:comment] if params[:comment].present?
    comment.question_id = params[:question] if params[:question].present?
    comment.user_id = params[:user] if params[:user].present?
    if comment.save
      message = { success: "Comment updated successfully!" }
      message.to_json
    else
      message = { error: "Error updating comment!" }
      message.to_json
    end
  else
    message = { error: "Comment not found!" }
    message.to_json
  end
end

patch "/comments/:id" do
  comment = Comment.find(params[:id])
  if comment.present?
    comment.comment = params[:comment] if params[:comment].present?
    comment.question_id = params[:question] if params[:question].present?
    comment.user_id = params[:user] if params[:user].present?
    if comment.save
      message = { success: "Comment updated successfully!" }
      message.to_json
    else
      message = { error: "Error updating comment!" }
      message.to_json
    end
  else
    message = { error: "Comment not found!" }
    message.to_json
  end
end
 

end