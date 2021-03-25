class LinkedList

    attr_reader :head, :tail
    
    def initialize
        @head = nil
        @tail = nil
    end

    # adds new node with value to the end of the list
    def append(value)
        
        new_node = Node.new(value)

        #list is empty
        if @head == nil
            @head = new_node
            @tail = new_node
        
        #list not empty
        else
            @tail.next_node = new_node
            @tail = new_node
        end
    end

    def prepend(value)

        new_node = Node.new(value)

        #list is empty
        if @head == nil
            @head = new_node
            @tail = new_node

        #list not empty
        else
            new_node.next_node = @head
            @head = new_node
        end 
    end

    def size
        if @head == nil
            return 0
        end

        result = 1
        current_node = @head
        # while next_node exists
        while current_node.next_node != nil
            current_node = current_node.next_node
            result += 1
        end

        result
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        if index < 0
            return "IndexOutOfBounds"
        end

        counter = 0
        current_node = @head

        while counter < index

            if current_node == @tail
                return "IndexOutOfBounds"
            end

            current_node = current_node.next_node
            counter += 1
        end

        current_node
    end

    def pop

        if @head == nil;
            return "List is Empty!"
        elsif @head == @tail
            "here"
            to_be_popped = @head

            @head = nil
            @tail = nil

            return to_be_popped
        end

        current_node = @head

        while current_node.next_node != @tail

            current_node = current_node.next_node
        end

        to_be_popped = @tail
        @tail = current_node
        current_node.next_node = nil

        to_be_popped
    end

    def contains?(value)
        if @head == nil
            return false
        end

        current_node = @head

        while current_node != nil
            if value == current_node.value
                return true
            end

            current_node = current_node.next_node
        end

        return false
    end

    def find(value)
        if @head == nil
            return nil
        end

        current_node = @head
        counter = 0

        while current_node != nil
            if value == current_node.value
                return counter
            end

            current_node = current_node.next_node
            counter += 1
        end

        return nil

    end
end
