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





class Todo_list
  # Story: As a developer, I can add all of my ToDoItems to a ToDoList.
  def initialize
    @list_items = []
  end

  def add_new_item(door)
    @list_items << door
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
    return @list_items.map{|list_item|
      if list_item.is_complete? == false
        list_item
      end
    }
  end






end
