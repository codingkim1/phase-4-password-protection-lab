class UsersController < ApplicationController

    # def create 
    #     user = User.create!(user_params) 
    #     if user 
    #         session[:user_id] = user.id 
    #     render json: user
    #     else
    #         render json: { errors: user.errors.full_messages}, status: :unprocessable_entity
    #     end
    # end

        def create
            user = User.new(user_params)
            if user.save
              session[:user_id] = user.id
              render json: user
            else
              render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
            end 
          end
    
        def show 
            user = User.find_by(id: session[:user_id]) 
            if user 
                render json: user 
            else
                render json: { error: "Not Authorized"}, status: :unauthorized 
            end
        end
    

    private 
    def user_params 
        params.permit(:username, :password_confirmation, :password) 
    end

end
