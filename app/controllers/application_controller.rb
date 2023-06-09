require 'sinatra'
require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Enable sessions to store the To-Do list items
  enable :sessions

  # Define the route to fetch the list of To-Do items
  get '/todos' do
    Todo.all.to_json
  end

  # Define a route to create a new To-Do item
  post '/todos' do
    request_body = JSON.parse(request.body.read)
    new_todo = Todo.create(
      task: request_body['task'],
      completed: false,
      is_editing: false
    )
    new_todo.to_json
  end

  # Define a route to update an existing To-Do item
  put '/todos/:id' do
    request_body = JSON.parse(request.body.read)
    updated_todo = Todo.find(params[:id])
    updated_todo.update(task: request_body['task'])
    updated_todo.to_json
  end

  # Define a route to delete a To-Do item
  delete '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    { message: 'Todo deleted' }.to_json
  end
end
