package Lecture03_List_RecursionSupport

object Flatten {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listNum2 = List(10, 20, 30, 40, 50)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def addCurry(x:Int): Int => Int = {
    (y:Int) => x+y
  }

  def main(args: Array[String]): Unit = {
    //println(List(listNum,listNum2))

    println(List(List(listNum,listNum2),List(listNum,listNum2)))
    //[[ [1,2,..],[10,20,...]  ],[[1,2,...], [10,20,...] ]]

    println(List(List(listNum,listNum2),List(listNum,listNum2)).flatten)


    //println(List(listNum,listNum2).flatten)
    println(List(listNum,List(listNum2)).flatten)
    println(List(List()).flatten)

  }
}
