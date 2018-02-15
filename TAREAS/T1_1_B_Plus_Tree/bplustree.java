import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class BPlusTree<K, V>{
  private int branches;

  Node root;

  BPlusTree(int branches){
    this.branches = branches;
    root = new LeafNode();
  }

  private abstract class Node{
    List<K> keys;

    public String toString(){
      return keys.toString();
    }

    abstract boolean isOverflow();
  }

  private class InternalNode extends Node{
    List<Node> children;

    InternalNode(){
      this.keys = new ArrayList<K>();
  		this.children = new ArrayList<Node>();
    }

    boolean isOverflow() {
      return (children.size() > branches);
    }
  }

  private class LeafNode extends Node{
    List<V> values;

    LeafNode(){
      keys = new ArrayList<K>();
      values = new ArrayList<V>();
    }

    boolean isOverflow(){
      return (values.size() > branches-1);
    }
  }
}
