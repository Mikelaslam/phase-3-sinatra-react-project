class UsersController < ApplicationController
    #routings
    get "/users" do
     users = User.all
     users.to_json
    end
     post "/users" do
     name = params[:name]
     username = params[:username]
     email = params[:email]
     phone = params[:phone]

#     if(name_.present? && email_.present? && phone_.present? && user_name.present)
#         check_email_exists = User.where(email: email).count()
#         puts("XXXXXXXXXXXX", check_email_exists)

#         if(check_email_exists < 1)

#      user = User.create(name: name, username: username, email: email, phone: phone)  
#      if user
#         message = {:success => "User created successfully"}
#         message.to_json
#     else 
#         message = {:error => "Error saving user!"}
#         message.to_json
#     end
# else
#     message = {:error => "Email already exists!"}
#     message.to_json
# end
# else
#     message = {:error => "All fields must be entered!"}
#     message.to_json
# end

# end
# end
if(name_.present? && user_name.present? && phone_.present? && email_.present?)
                check_email_exists = User.where(email: email_).count() #Integer 2,3,4,5
                 puts("XXXXXXXXXXXXXXXXX ", check_email_exists)

                 if check_email_exists < 1
                    user = User.create(username: user_name, email: email_, phone: phone_)
                    if user
                        message = {:succcess => "User created successfully!!"}
                        message.to_json
                    else
                        message = {:error => "Error saving user!"}
                        message.to_json
                    end
                else
                    message = {:error => "Email exists!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be field!"}
                message.to_json
            end

        end
    end
