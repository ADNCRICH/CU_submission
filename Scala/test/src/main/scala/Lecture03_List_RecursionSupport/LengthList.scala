package Lecture03_List_RecursionSupport

object LengthList {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listNum2 = List(10, 20, 30, 40, 50)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def length(l:List[Any]):Int ={
    if(l.isEmpty) 0
    else 1 + length(l.tail)
  }

  def length2(l:List[Any], acc:Int):Int ={
      if(l.isEmpty) return acc;
      else length2(l.tail,acc+1)
  }

  def main(args: Array[String]): Unit = {
    println(length(listNum))
    println(length2(listNum,0))


  }
}
