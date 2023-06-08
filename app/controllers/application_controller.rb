require 'sinatra'
require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Enable sessions to store the To-Do list items
enable :sessions

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  
# Define the route to fetch the list of To-Do items
get '/todos' do
  # content_type :json
  # session[:todos] ||= []
  # session[:todos].to_json
  Todo.all.to_json
end

# Define a route to create a new To-Do item
post '/todos' do
  content_type :json
  request_body = JSON.parse(request.body.read)
  new_todo = Todo.new(request_body['id'], request_body['task'], false, false)
  session[:todos] ||= []
  session[:todos] << new_todo
  session[:todos].to_json
end

# Define a route to update an existing To-Do item
put '/todos/:id' do
  content_type :json
  request_body = JSON.parse(request.body.read)
  updated_todo = request_body['task']
  todo_id = params[:id].to_i
  session[:todos][todo_id].task = updated_todo
  session[:todos].to_json
end

# Define a route to delete a To-Do item
delete '/todos/:id' do
  content_type :json
  todo_id = params[:id].to_i
  session[:todos].delete_at(todo_id)
  session[:todos].to_json
end


end
