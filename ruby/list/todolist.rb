#TodoList Class

class TodoList

  def initialize(items)
    @items = items
  end

  def get_items
     @items
  end

  def add_item(new_item)
    @items << new_item
  end

  def delete_item(item)
    @items.delete(item)
  end

  def get_item(index)
    @items[index]
  end


end