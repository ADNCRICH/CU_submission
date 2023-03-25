package Lecture03_List_RecursionSupport

import Lecture03_List_RecursionSupport.ListIterate.listNum

object Sorted {
  val listNum = List(1, 2, 3, 3, 5)
  val listNum2 = List(4, 2, 3, 4, 5)
  val listNum3 = List(1, 2, 0, 4, 5)
  val listNum4 = List()
  val listNum5 = List(4)

  def sorted(l: List[Int]):Boolean = {
    if(l.isEmpty || l.length ==1) return true
    return ((l.head <= (l.tail).head) && sorted(l.tail))
  }

  def main(args: Array[String]): Unit = {
    println(sorted(listNum))
    println(sorted(listNum2))
    println(sorted(listNum3))
    println(sorted(listNum4))
    println(sorted(listNum5))

    // listNum.foreach()


  }


}
