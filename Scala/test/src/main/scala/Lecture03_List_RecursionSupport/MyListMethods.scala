package Lecture03_List_RecursionSupport

object MyListMethods {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def member(x:Any , l :List[Any]): Boolean ={
    if(l.isEmpty) return false
    if(l.head == x) return true
    member(x,l.tail)
  }

  def append(l1: List[Any], l2:List[Any]): List[Any] = {
    if(l1.isEmpty) return l2
    if(l2.isEmpty) return l1
    val t2 = append(l1.tail,l2)
    return l1.head :: t2
  }

  def myReverse(l: List[Any]): List[Any] ={
    if(l.isEmpty) return List()
    //append(myReverse(l.tail), List(l.head))
    myReverse(l.tail) ++ List(l.head)
  }

  def main(args: Array[String]): Unit = {
    println(member(2,myList))
    println(member(4,listNum))
    println(member(7,listNum))
    println(member("Robin",listStr))

    println(myReverse(myList))
    println(myReverse(listNum))
    println(myReverse(listStr))



  }


}
