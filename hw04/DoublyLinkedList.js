
class DoublyLinkedListNode {
    constructor(value, next = null, previous = null) {
      this.value = value;
      this.next = next;
      this.previous = previous;
    }
}

class DoublyLinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
    }

    find(value) {
        if (!this.head) {
          return null;
        }
      
        let currentNode = this.head;
      
        while (currentNode) {
          if (value !== undefined && currentNode.value === value) {
            return currentNode;
          }

          currentNode = currentNode.next;
        }
      
        return null;
    }

    insert(value) {
        let newNode = new DoublyLinkedListNode(value);
      
        if (this.tail) {
          this.tail.next = newNode;
        }
      
        newNode.previous = this.tail;
    
        this.tail = newNode;
      
        if (!this.head) {
          this.head = newNode;
        }
      
        return this;
    }

    delete(value) {
        if (!this.head) {
          return null;
        }
      
        let deletedNode = null;
        let currentNode = this.head;
      
        while (currentNode) {
          if (currentNode.value === value) {
            deletedNode = currentNode;

            if (deletedNode === this.head) {
              this.head = deletedNode.next;
 
              if (this.head) {
                this.head.previous = null;
              }
      
              if (deletedNode === this.tail) {
                this.tail = null;
              }
            } else if (deletedNode === this.tail) {
                this.tail = deletedNode.previous;
                this.tail.next = null;
            } else {
              const previousNode = deletedNode.previous;
              const nextNode = deletedNode.next;
              previousNode.next = nextNode;
              nextNode.previous = previousNode;
            }
          }
      
          currentNode = currentNode.next;
        }
      
        return deletedNode;
    }

    change(currentValue, newValue) {
        if (!this.head) {
            return null;
        }

        let currentNode = this.head;
      
        while (currentNode) {
          if (currentNode.value === currentValue) {
            currentNode.value = newValue;
          }
      
          currentNode = currentNode.next;
        }
      
    }

    length() {
        if (!this.head) {
            return 0;
        }

        let length = 0;
        let currentNode = this.head;
      
        while (currentNode) {
            length++;
            currentNode = currentNode.next;
        }
      
        return length;
    }
}

 
