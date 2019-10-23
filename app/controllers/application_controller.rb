require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch "/posts/:gog" do
    @post = Post.find(params[:gog])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end
end
