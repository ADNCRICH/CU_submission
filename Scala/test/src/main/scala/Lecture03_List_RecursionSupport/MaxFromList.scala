package Lecture03_List_RecursionSupport

import Lecture03_List_RecursionSupport.DotProduct.{dot, listNum, listNum2}

object MaxFromList {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listNum2 = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def maxN(l:List[Int]):Int ={
   // if(l.isEmpty) throw Exception
    if(l.length ==1) return l.head

    var m = maxN(l.tail)
    if(l.head > m) l.head
    else m
  }

  def maxx(l:List[Int],acc:Int) : Int ={
    if(l.isEmpty) acc
    else if(l.head > acc){
      maxx(l.tail,l.head)
    }else {
      maxx(l.tail,acc)
    }
  }

  def max(l:List[Int]):Int = {
    maxx(l,l.head)
  }

  def main(args: Array[String]): Unit = {
    println(max(listNum))
    println(max(List()))
  }
}
