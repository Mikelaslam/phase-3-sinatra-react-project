class QuestionsController < ApplicationController
    #routings
    get "/questions" do
      questions = Question.all
      questions.to_json
    end

    post "/questions" do

    title = params[:title]
    category = params[:category]
    description = params[:description]
    user_id = params[:user]

    if title.present? && category.present? && description.present? && user_id.present?
        question = Question.create(title: title, category: category, description: description, user_id: user_id)
        if question
            message = { success: "Question created successfully!" }
        else
            message = { error: "Error saving Question!" }
        end
        else
        message = { error: "All fields should be filled!" }
    end

    message.to_json
end

#edit question
     
    
end

