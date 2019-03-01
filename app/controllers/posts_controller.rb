class PostController < ApplicationController

    get '/home' do
        if logged_in?
            @post = Post.all
            @user = User.find(session[:user_id])
            erb :'post/index'
          else
            redirect"/users/login"
         end
        
    end

    patch '/update/:id' do
        @post = Post.find(params[:id])
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        redirect to "/post/#{@post.id}"
      
    end

    

    get '/post/new' do
        if logged_in?
        erb :'post/new'
    else
        redirect"/users/login"
     end

    end

    get '/post/:id' do
        @post = Post.find(params[:id])
        erb :'post/show'    
    end

    
    get '/post/:id/edit' do
        @post = Post.find(params[:id])
        erb :'post/edit'
    end

    post '/post/create' do
       title = params[:title]
       content = params[:content]
       @post = Post.create(title:title, content:content)

        erb :'post/show'
    end

    
    delete '/post/:id/delete' do 
        @post = Post.find(params[:id])
        @post.delete
        redirect to '/home'
    end

    
end