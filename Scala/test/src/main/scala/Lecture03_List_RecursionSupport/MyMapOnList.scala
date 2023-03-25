package Lecture03_List_RecursionSupport

object MyMapOnList {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def add(x:Int, y:Int): Int ={
    return x+y
  }

  def addCurry(x:Int): Int => Int = {
    (y:Int) => x+y
  }

  def main(args: Array[String]): Unit = {
    println(listNum.map(_ * 2))
    println(listNum.map(x => x *2))
    println(listNum.map(add(100,_)))
    println(listNum.map(addCurry(100)(_)))

  }
}
