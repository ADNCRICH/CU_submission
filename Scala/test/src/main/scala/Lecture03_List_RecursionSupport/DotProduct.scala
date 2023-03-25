package Lecture03_List_RecursionSupport

object DotProduct {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listNum2 = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def dot(l1:List[Int],l2:List[Int]):Int ={
    if(l1.isEmpty || l2.isEmpty) 0
    else l1.head * l2.head + dot(l1.tail,l2.tail)
  }

  def dotAcc(l1:List[Int],l2:List[Int],acc:Int):Int ={
    if(l1.isEmpty || l2.isEmpty) acc
    else dotAcc(l1.tail,l2.tail, acc + (l1.head * l2.head))
  }


  def main(args: Array[String]): Unit = {
    println(dot(listNum,listNum2))
    println(dotAcc(listNum,listNum2,0))
  }
}
