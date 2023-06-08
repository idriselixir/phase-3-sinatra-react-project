puts "🌱 Seeding spices..."


# Seed your database here
require 'faker'

# Define a method to create a fake task
def create_fake_task
  task = Faker::Lorem.sentence
  completed = [true, false].sample
  is_editing = false

  Todo.create(task: task, completed: completed, is_editing: is_editing)
end

# Define the number of fake tasks you want to create
num_fake_tasks = 10

# Seed the todos table with fake tasks
num_fake_tasks.times do
  create_fake_task
end


puts "✅ Done seeding!"
