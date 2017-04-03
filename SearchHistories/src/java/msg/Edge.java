/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package msg;

/**
 *
 * @author user
 */

import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Edge<E>{

    private static int ID = 0; //counts how many Edges exist

    /*
      When working with weighted Graphs,
      having an element becomes important.
      For example, in game programming, the
      weights could represent a lag or a hidden
      bonus that could make winning significantly
      easier.
    */
    private E elem;

    private int id; //the individual Edge identifier

    private int weight;

    //holds Pointer objects, which reference other Edges
    private LinkedList<Connector<E>> pointers;

    //constructors
    public Edge(){
      //invoke constructor to initialize elem to null pointer
       this(null, Integer.MAX_VALUE);
    }

    public Edge(E elem, int distance){
       this.elem = elem;
       id = ID++; //assign indv id and increment static ID counter
       pointers = new LinkedList<Connector<E>>();
       this.weight = distance;
    }

    //accessors and mutators
    public int getId(){return id;}

    public E getElem(){return elem;}
    public void setElem(E elem){this.elem = elem;}

    public int getDistance(){return weight;}
    public void setDistance(int dist){weight = dist;}
    
    //add a connection not taking distances into account
    public void connectTo(Edge<E> other){
        Connector<E> c = new Connector<E>(this, other);

        //prevents adding duplicate connectors
        if(!pointers.contains(c)) pointers.add(c);

        //reference Connector in other Edge as well
        LinkedList<Connector<E>> conn = other.getConnections();
        if(!conn.contains(c)) conn.add(c);
    }

    public void connectTo(Edge<E> other, int distance){
        Connector<E> c = new Connector<E>(this, other, distance);
        if(!pointers.contains(c)) pointers.add(c);
    }

    public LinkedList<Connector<E>> getConnections(){return pointers;}

    public void sortConnections(){ Collections.sort(pointers); }
    
    public Iterator<Connector<E>> iterator(){ return pointers.iterator(); }

    //one Edge is equal to another if the two elems are equal to each other
    //and they have the same Connections
    public boolean equals(Edge<E> other){

        if(other.pointers.size() != pointers.size())
             return false;

        LinkedList<Connector<E>> temp = new LinkedList<Connector<E>>(pointers);

        //if the elems are equal and the Lists are equal, regardless of order
        //then the Edges are equal
        return elem.equals(other.getElem()) &&
               temp.retainAll(other.pointers);
    }

    public String toString()
    {
        try {
            Thread.sleep(10);
        } catch (InterruptedException ex) {
            Logger.getLogger(Edge.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.elem.toString();
    }
}

