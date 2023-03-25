package Lecture03_List_RecursionSupport

object ListIterate {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def add(s:List[Int], a:Int): List[Int] = {
    if(s.isEmpty) {
      return List()
    }

    (s.head+a) :: add(s.tail,a)
  }


  def main(args: Array[String]): Unit = {
    println(listNum.foreach(println))

    for(name <- listStr){
      println(name)
    }

    var sum =0
    listNum.foreach(sum += _)
    println(sum)

    var sum2 = ""
    listStr.foreach(sum2 += _)
    println(sum2)
    //listStr


    println(listNum(4))
    //println(listNum(5)) //IndexOutOfBoundException

    println(add(listNum,10))

  }


}
