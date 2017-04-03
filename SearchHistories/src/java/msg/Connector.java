/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package msg;

/**
 *
 * @author user
 */
public class Connector<E> implements Comparable<Connector<E>>{
   private Edge<E> one, two;
   private int distance;

   /*this two-args constructor creates
     a Connector object to Connect two Nodes
     together with a standard distance of 0
     By using this constructor, it is assumed
     That distance is either weighted through the
     Edges or otherwise is irrelevant 
   */  
   public Connector(Edge<E> one, Edge<E> two){
      this(one, two, 0); 
   }

   public Connector(Edge<E> one, Edge<E> two, int distance){ 
        this.one = one;
        this.two = two;
        this.distance = distance;
   }

   //accessors and mutators
   public Edge<E> getOne(){return one;}
   public Edge<E> getTwo(){return two;}
   public int getDistance(){return distance;}
   public void setDistance(int distance){this.distance = distance;}

   //Two connectors are equal if the two Edges
   //are equal and the distance is equal
   public boolean equals(Connector<E> other){
      return one.equals(other.getOne()) && 
             two.equals(other.getTwo()) &&
             distance == other.getDistance();
   }

   public String toString(){ return "(" + one.getElem() + ", " + two.getElem() + "): " + distance; }

   public int compareTo(Connector<E> other){
       return this.distance - other.distance;
   }
}


