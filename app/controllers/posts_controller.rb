class PostController < ApplicationController

    get '/home' do
        if logged_in?
            @post = current_user.post.all
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
        if logged_in?
        @post = Post.find(params[:id])

        if @post && @post.user == current_user
        erb :'post/show'  
        
        else 
            erb :error
        end
    else
        redirect"/users/login"
     end 
    end

    
    get '/post/:id/edit' do
        if logged_in?
        @post = Post.find(params[:id])
        erb :'post/edit'
    else
        redirect"/users/login"
     end
    end

    post '/post/create' do
        if logged_in?
       title = params[:title]
       content = params[:content]
       #@post = Post.create(title:title, content:content)
       @post = current_user.post.build(params[:post])
       @post.save
        erb :'post/show'

    else
        redirect"/users/login"
     end
    end

    
    delete '/post/:id/delete' do 
        @post = Post.find(params[:id])
        @post.delete
        redirect to '/home'
    end

    
end