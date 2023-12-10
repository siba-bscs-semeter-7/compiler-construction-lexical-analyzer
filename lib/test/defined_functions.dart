class DefinedFunctions {
  // It compares the lists irrespective of the order of their element placed.
  // means ["hello", "world"] is equal to the list ["world", "hello"]
  bool compareLists(List list1, List list2) {
    if (list1.length != list2.length) {
      return false;
    }

    for (int i = 0; i < list1.length; i++) {
      bool found = false;
      for (int j = 0; j < list2.length; j++) {
        if (list1[i] == list2[j]) {
          found = true;
        }
      }
      if (!found) {
        print("Element ${list1[i]} is not found!");
        return false;
      }
    }
    return true;
  }
}
