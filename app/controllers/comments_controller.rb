  class CommentsController < ApplicationController
    #routings
    get "/comments" do
     comments = Comments.all
     comments.to_json
end

end