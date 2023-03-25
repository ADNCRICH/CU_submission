package Lecture03_List_RecursionSupport

object Filter {
    val myList: List[Int] = List()
    val listNum = List(1, 2, 3, 4, 5)
    val listNum2 = List(10, 20, 30, 40, 50)
    val listStr: List[String] = List("John", "Robin", "Richard")

    def main(args: Array[String]): Unit = {
      println(listNum.filter(x => x%2 ==0))

    }

}
