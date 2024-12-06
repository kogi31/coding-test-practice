# 39. Binary Tree Nodes

난이도: Medium
URL: https://www.hackerrank.com/challenges/binary-search-tree-1?isFullScreen=true
사이트: hackerrank
완료여부: Yes

### 문제

You are given a table, *BST*, containing two columns: *N* and *P,* where *N* represents the value of a node in *Binary Tree*, and *P* is the parent of *N*.

![image.png](39%20Binary%20Tree%20Nodes%20150bdab6415180dca1a7c377453be9bb/image.png)

Write a query to find the node type of *Binary Tree* ordered by the value of the node. Output one of the following for each node:

- *Root*: If node is root node.
- *Leaf*: If node is leaf node.
- *Inner*: If node is neither root nor leaf node.

**Sample Input**

![image.png](39%20Binary%20Tree%20Nodes%20150bdab6415180dca1a7c377453be9bb/image%201.png)

**Sample Output**

```
1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf

```

**Explanation**

The *Binary Tree* below illustrates the sample:

![image.png](39%20Binary%20Tree%20Nodes%20150bdab6415180dca1a7c377453be9bb/image%202.png)

### 문제 접근

- Root Node : 5
- Inner Node : 2, 8
- Leaf Node : 1, 3, 6, 9
- case 3
    - p is null ⇒ root
    - n not in (p is not null) ⇒ leaf
    - else inner
- order by n