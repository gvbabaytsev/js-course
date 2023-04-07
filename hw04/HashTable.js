class HashTable {
  constructor() {
    this.table = new Array(100);
    this.size = 0;
  }
  
  hash(key) {
    let hash = 0;
    
    for (let i = 0; i < key.length; i++) {
    hash += key.charCodeAt(i);
    }
    return hash;
  }
  
  set(key, value) {
    let index = this.hash(key);
    this.table[index] = [key, value];
    this.size++;
  }

  get(key) {
    let index = this.hash(key);
    return this.table[index];
  }
  
  remove(key) {
    let index = this.hash(key);
  
    if (this.table[index] && this.table[index].length) {
      this.table[index] = undefined;
      this.size--;
      return true;
    } else {
      return false;
    }
  }

  length() {
    return this.size;
  }
}
 