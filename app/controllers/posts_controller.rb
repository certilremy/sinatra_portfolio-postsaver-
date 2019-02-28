class PostController < ApplicationController

    get '/home' do
        @post = Post.all
        erb :'post/index'
    end

    get '/post/new' do
       
        erb :'post/new'
    end

    get '/post/id/edit' do
        @post = Post.find_by(params[:id])
        erb :'post/edit'
    end

    post '/post/create' do
       title = params[:title]
       content = params[:content]
       @post = Post.create(title:title, content:content)

        erb :'post/show'
    end




    
end