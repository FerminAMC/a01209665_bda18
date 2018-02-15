import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BPlusTree{
  private int branches;
  public BPlusTree(int branches){

  }

  /**
  * Node abstract class
  */
  private abstract class Node{
    List<Integer> keys;
  }

  /**
  * Internal Node class
  */
  private class InternalNode extends Node{
    List<Node> children;

    InternalNode(){
      this.keys = new ArrayList<Integer>();
      this.children = new ArrayList<Node>();
    }

  }

  /**
  * Leaf Node class
  */
  private class LeafNode extends Node{
    List<String> values;
    LeafNode next;
    
    LeafNode(){
      this.keys = new ArrayList<Integer>();
      this.values = new Arraylist<String>();
    }

  }

}
