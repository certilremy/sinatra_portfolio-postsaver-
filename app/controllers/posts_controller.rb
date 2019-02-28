class PostController < ApplicationController

    get '/home' do
        @post = Post.all
        erb :'post/index'
    end

    patch '/update/:id' do
        @post = Post.find(params[:id])
        @post.title = params[:title]
        @post.content = params[:content]
        @post.save
        redirect to "/post/#{@post.id}"
      
    end

    get '/post/:id' do
        @post = Post.find(params[:id])
        erb :'post/show'    
    end

    get '/post/new' do
       
        erb :'post/new'
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

   


    #patch ':id' do
       # @post = Post.find(params[:id])
       # @post.title = params[:title]
       # @post.content = params[:content]
       # @post.save
        #redirect to "/post/#{@post.id}"
        
    #end
    
end