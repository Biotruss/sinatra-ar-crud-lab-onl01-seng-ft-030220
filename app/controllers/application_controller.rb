
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @post = Article.create(params)
    redirect to '/articles'
  end

  get '/articles' do

   @posts = Article.all

   erb :index

  end

  get '/articles/:id' do

    @post = Article.find_by_id(params[:id])
    erb :show

  end

  get '/articles/:id/edit' do
    @post = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @post = Article.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/articles/:id/delete' do
    @post = Article.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end
end
