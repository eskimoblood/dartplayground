interface Storeable {
  
  /**
   * URI is used as idendifier for the store, this could be an REST endpoint URL, or just a key for a localStorage
   */
  String uri;
  
  /**
   * Returns the string representation that will be stored. 
   */
  String toStore();
}
