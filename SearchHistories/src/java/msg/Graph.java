/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package msg;

import java.util.ArrayList;

/**
 *
 * @author user
 */
public class Graph<E>{
 
    //Because we will need random access to the Edges
    //We will use an ArrayList to hold them
    private ArrayList<Edge<E>> edges; 

    public Graph(){
         edges = new ArrayList<Edge<E>>();
    }

    //add Edge to the List
    public boolean addEdge(Edge<E> vertex){
         if(edges.contains(vertex)) {
            return false;
        }
         edges.add(vertex);
         return true;
    }

    public boolean contains(Edge<E> vertex){
        return edges.contains(vertex);
    }

    public Edge<E> get(int index){
       return edges.get(index);
    }

    //returns number of Edges in Graph
    public int count(){return edges.size();}

    public boolean equals(Graph<E> other){

        if(other.edges.size() != edges.size()) {
            return false;
        }

        //store all of Edges of larger Graph 
        ArrayList<Edge<E>> temp = new ArrayList<Edge<E>>(other.edges);
                
        //if temp changed, then the Graphs are not equal
        return temp.retainAll(edges); 
    }
    
    public static void main(String args[])
    {
        Edge cont1 =  new Edge("apple",0);
        Edge cont2 =  new Edge("mac",0);
        Edge cont3 =  new Edge("pentium",0);
        Edge cont4 =  new Edge("ibm",0);
        
        Connector con = new Connector(cont1,cont2);
        
        
        Graph obj = new Graph();
        obj.addEdge(cont1);
        obj.addEdge(cont2);
        obj.addEdge(cont3);
        obj.addEdge(cont4);
        
        System.out.println("Number of edge : "+obj.count());     
        
        String x = "12.345";
        int y = x.indexOf('.');
        System.out.println(y);   
        System.out.println(x.substring(0,y));   
        System.out.println(x.substring(y+1,y+2));   
    }
}

