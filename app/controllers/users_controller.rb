class UserController < ApplicationController
    
      get 'users/show' do 
        #@user = User.find(params[:id])
        erb :'users/show'
      end

      get 'users/login' do 
        
        erb :'users/login'
      end

      get 'users/signup' do 
        
        erb :'users/signup'
      end

    
      get "/users/:id" do
       # @user = User.find(params[:id])
        erb :"/users/show"
      end
          
    
end