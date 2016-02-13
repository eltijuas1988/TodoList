require 'date'
# Story: As a developer, I can create a ToDoItem.

class Todo_item # Tasks

  # Story: As a developer, I can give a ToDoItem a title and retrieve it.
  def initialize(title, description)
    @title = title
    @description = description
    @done = false
  end

  # Story: As a developer, I can print a ToDoItem with field labels and values.
  def title
    "Title: " + @title
  end

  # Story: As a developer, I can give a ToDoItem a description and retrieve it.
  def description
    "Description: " + @description
  end

  # Story: As a developer, I can mark a ToDoItem done.

  # Story: As a developer, when I print a ToDoItem is done status is shown.
  def completed
    @done = true
  end

  def is_complete?
    @done
  end



end

class Due_Item < Todo_item

  #Story: As a developer, I can create a to do item with a due date, which can be changed.
  # Hint: Use the Date class
  def due_date(year, month, day)
    @due_date = Date.new(year, month, day)
  end

  def edit_due_date(year, month, day)
    @due_date = Date.new(year, month, day)
  end

  #Story: As a developer, I can print an item with a due date with field labels and values.
  def get_due_date
    "Date: " + @due_date.to_s
  end

  def get_due_date_int
    @due_date
  end



end



class Todo_list
  # Story: As a developer, I can add all of my ToDoItems to a ToDoList.
  def initialize
    @list_items = []
    @due_items = []
    @items_due_today = []
  end

  def add_new_item(door)
    @list_items << door
    @list_items
  end

  def see_all_items
    @list_items
  end


  # Story: As a developer with a ToDoList, I can show all the completed items.
  def completed_items
    # Iterate over to do list to collect items that have been completed
    return @list_items.map{|list_item|
      if list_item.is_complete? == true
        list_item
      end
    }
  end

  # Story: As a developer with a ToDoList, I can show all the not completed items.
  def incomplete
    @list_items.select do |list_item|
      !list_item.is_complete?
    end
  end

  # Story: As a developer, I can add items with due dates to my ToDoList.
  # Hint: Consider keeping items with due dates separate from the other items.
  def items_with_due_dates
    @due_items = @list_items.select do |list_item|
      list_item.is_a?(Due_Item)
    end
  end

  # Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
  def items_due_today
    items_with_due_dates
    @items_due_today = @due_items.select do |list_item|
      if list_item.get_due_date_int == Date.today && list_item.is_complete? == false
        list_item
      end
    end
  end



end
