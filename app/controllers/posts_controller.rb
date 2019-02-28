class PostController < ApplicationController

    get '/home' do
        erb :'post/index'
    end

    get '/post/new' do

        erb :'post/new'
    end

    get '/post/id/edit' do
        erb :'post/edit'
    end

    post '/post/create' do
        erb :'post/show'
    end




    
end