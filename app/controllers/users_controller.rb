class UsersController < ApplicationController

  # Get all users
  get "/users" do
    users = User.all
    users.to_json
  end

  # Create new user
  post "/users" do
    name = params[:name]
    username = params[:username]
    phone = params[:phone]
    email = params[:email]

    if name.present? && username.present? && phone.present?
     
      check_email_exists = User.where(email: email).count()

      if check_email_exists < 1
        user = User.create(name: name, username: username, email: email, phone: phone)

        if user
          message = { success: "User created successfully!!" }
          message.to_json
        else
          message = { error: "Error saving user!" }
          message.to_json
        end
      else
        message = { error: "Email exists!" }
        message.to_json
      end
    else
      message = { error: "All fields should be filled!" }
      message.to_json
    end
  end

  # Delete user
  delete "/users/:id" do
    count_users = User.where(id: params[:id]).count() 
    if count_users > 0
      user = User.find(params[:id])
      user.destroy
      message = { success: "User deleted successfully!!" }
      message.to_json
    else
      message = { error: "User does not exist!" }
      message.to_json
    end
  end

end

