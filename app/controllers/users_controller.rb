class UserController < ApplicationController
    
      get 'users/show' do 
        #@user = User.find(params[:id])
        erb :'users/show'
      end

      post '/users/login' do
        # binding.pry
        @user = User.find_by(email: params["email"],pasword: params["password"])
        session[:user_id] = @user.id
        erb :"/post/index"
    
      end

      get 'users/login' do 
        
        erb :'users/login'
      end

      post "/users/signup" do
        # raise params.inspect
        name = params[:name]
        email = params[:email]
        pasword = params[:password]
        @user = User.create(name:name,email:email,pasword:pasword )
        session[:user_id] = @user.id
        erb :"/post/index"
        
      end

      get 'users/signup' do 
        
        erb :'users/signup'
      end

    
      get "/users/:id" do
       # @user = User.find(params[:id])
        erb :"/users/show"
      end


          
    
end