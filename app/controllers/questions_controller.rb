class QuestionsController < ApplicationController
    #routings
    get "/questions" do
      questions = Question.all
      questions.to_json(include: [:user, :comments])
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
     patch '/questions/:id' do
  check_question_existence = Question.exists?(id: params[:id]) #true/false
  if check_question_existence
    title = params[:title]
    category = params[:category]
    description = params[:description]
    user = params[:user]
    if (title.present? && category.present? && description.present? && user.present?)
      # updating
      question = Question.find_by(id: params[:id])
      question.update(title: title, category: category, description: description, user_id: user)
      message = { success: "Question updated successfully!" }
      return message.to_json
    else
      message = { error: "All fields should be filled!" }
      return message.to_json
    end
  else
    message = { error: "The question does not exist!" }
    return message.to_json
  end
end

    
end

