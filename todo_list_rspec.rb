# Story: As a developer, I can create a ToDoItem.

require 'rspec'
require_relative 'todo_list'

describe 'Todo_item' do

  it "creates a new item" do
    list_item = Todo_item.new("x", "y")
    expect{list_item}.to_not raise_error
  end

  # Story: As a developer, I can give a ToDoItem a title and retrieve it.
  it "creates a todo item title and retrieves it" do
    list_item = Todo_item.new("groceries", "y")
    expect{list_item.title}.to_not raise_error
  end

  # Story: As a developer, I can give a ToDoItem a description and retrieve it.
  it "will have a description and show it" do
    list_item = Todo_item.new("groceries", "Go handle several errands")
    expect{list_item.description}.to_not raise_error
  end

  # Story: As a developer, I can print a ToDoItem with field labels and values.
  it "will print field labels and values for title" do
    list_item = Todo_item.new("groceries", "Go handle errands")
    expect{list_item.title}.to_not raise_error
    expect(list_item.title).to eq "Title: groceries"
  end

  it "will print field labels and values for description" do
    list_item = Todo_item.new("groceries", "Go handle errands")
    expect{list_item.description}.to_not raise_error
    expect(list_item.description).to eq "Description: Go handle errands"
  end

  # Story: As a developer, I can mark a ToDoItem done.

  # Story: As a developer, when I print a ToDoItem is done status is shown.
  it "marks a todo item 'DONE'" do
    list_item = Todo_item.new("groceries", "Go handle errands")
    expect{list_item.completed}.to_not raise_error
    expect(list_item.completed).to eq true
  end

  #Story: As a developer, I can create a to do item with a due date, which can be changed.
  # Hint: Use the Date class

  #Story: As a developer, I can print an item with a due date with field labels and values.
  it "creates a todo_item with a due date" do
    list_item = Todo_item.new("groceries", "Go handle several errands")
    expect{list_item.assign_due_date(2016, 2, 28)}.to_not raise_error
    expect(list_item.assign_due_date(2016, 2, 28)).to be_an_instance_of Date
  end

  it "can change the date of a todo_item" do
    list_item = Todo_item.new("groceries", "Go handle several errands")
    list_item.assign_due_date(2016, 2, 28)
    expect{list_item.edit_due_date(2016, 3, 1)}.to_not raise_error
    expect(list_item.edit_due_date(2016, 3, 1).to_s).to include "2016-03-01"
  end


end


describe 'Todo_list' do

  # Story: As a developer, I can add all of my ToDoItems to a ToDoList.
  it "can hold todo items" do
    list_item = Todo_item.new("groceries", "Go handle errands")
    tasks = Todo_list.new
    expect{tasks}.to_not raise_error
    expect(tasks.add_new_item(list_item)).to eq [list_item]
  end

  # Story: As a developer with a ToDoList, I can show all the completed items.

  it "shows completed items" do
    list_item1 = Todo_item.new("groceries", "Go handle errands")
    list_item2 = Todo_item.new("workout", "hit the gym")
    tasks = Todo_list.new

    list_item1.completed
    tasks.add_new_item(list_item1)
    list_item2.completed
    tasks.add_new_item(list_item2)
    expect(tasks.completed_items).to eq [list_item1, list_item2]
  end

  # Story: As a developer with a ToDoList, I can show all the not completed items.

  it "shows non-completed tasks" do
    list_item1 = Todo_item.new("groceries", "Go handle errands")
    list_item2 = Todo_item.new("workout", "hit the gym")
    tasks = Todo_list.new
    tasks.add_new_item(list_item1)
    tasks.add_new_item(list_item2)
    expect{tasks.incomplete}.to_not raise_error
    expect(tasks.incomplete).to eq [list_item1, list_item2]
  end

  #Story: As a developer, I can create a to do item with a due date, which can be changed.
  # Hint: Use the Date class




end
