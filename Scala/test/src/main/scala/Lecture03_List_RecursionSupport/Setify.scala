package Lecture03_List_RecursionSupport

object Setify {
  val myList: List[Int] = List()
  val listNum = List(1, 5, 2, 3, 4, 5,1,2,3,4,5)
  val listStr: List[String] = List("John", "Robin", "John", "Richard", "Robin")

  def member(x:Any , l :List[Any]): Boolean ={
    if(l.isEmpty) return false
    if(l.head == x) return true
    member(x,l.tail)
  }

  def setify(l:List[Any]):List[Any] ={
    if(l.isEmpty) return List()
    if (member(l.head,l.tail)){
      return setify(l.tail)
    }else{
      return l.head :: setify(l.tail)
    }
  }

  def main(args: Array[String]): Unit = {
    println(setify(listNum))

  }
}
