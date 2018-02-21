class BPlusTree(object):
    def __init__(self, t):
        self._t = t
        if (self._t <= 1):
            raise ValueError("Tree must have a degree of 2 or more.")
        self.root = self.Node(t)

    # Inserts a key into the tree
    def insert(self, key):
        node = self.root
        if(node.is_full):
            new_root = self.Node(self._t)
            new_root.children.append(self.root)
            new_root.leaf = False
            node = node.split(new_root, key)
            self.root = new_root
        while(not node.leaf):
            i = node.size - 1
            while(i > 0 and key < node.keys[i]):
                i -= 1
            if(key > node.keys[i]):
                i += 1
            next = node.children[i]
            if(next.is_full):
                node = next.split(node, key)
            else:
                node = next
        node.add_key(key)

    class Node(object):
        def __init__(self, t):
            self.leaf = True
            self.keys = []
            self.children = []
            self._t = t # t is the order of the tree

        def split(self, parent, key):
            new_node = self.__class__(self._t)
            mid = self.size//2
            split_value = self.keys[mid]
            parent.add_key(split_value)

            # Add keys and children to appropriate nodes
            new_node.children = self.children[mid + 1:]
            self.children = self.children[:mid + 1]
            new_node.keys = self.keys[mid+1:]
            self.keys = self.keys[:mid]

            # If the new_node has children, set it as internal node
            if len(new_node.children) > 0:
                new_node.leaf = False

            parent.children = parent.add_child(new_node)
            if key < split_value:
                return(self)
            else:
                return(new_node)

        @property
        def is_full(self):
            return(self.size == 2 * self._t - 1)

        @property
        def size(self):
            return(len(self.keys))

        # Adds a key to the node
        def add_key(self, value):
            self.keys.append(value)
            self.keys.sort()

        # Adds a child to a node
        def add_child(self, new_node):
            i = len(self.children) - 1
            while(i >= 0 and self.children[i].keys[0] > new_node.keys[0]):
                i -= 1
            return(self.children[:i + 1]+ [new_node] + self.children[i + 1:])
