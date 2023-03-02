class QuestionsController < ApplicationController
    #routings
    get "/questions" do
      @questions = Question.all
      posts.to_json
    end
    post "questions" do
    tittle = params[:tittle]
    category = params[:category]
    description = params[:category]
    user = params [:user]

    if(tittle.present? && category.present? && description.present? && user.present?)
        post = Post.create(tittle: tittle, category: category, description: description, user: user)
        if post
            message = {:succcess => "Post created successfully!"}
                        message.to_json
                    else
                        message = {:error => "Error saving user!"}
                        message.to_json
                    end
                else
                endmessage = {:error => "All fields should be filled!"}
                    message.to_json
                end
            end
    
end