package Lecture03_List_RecursionSupport

object DeleteItem {

    val myList: List[Int] = List()
    val listNum = List(1, 2, 3, 4, 5)
    val listNum2 = List(10, 20, 30, 40, 50)
    val listStr: List[String] = List("John", "Robin", "Richard")

    def delete(x:Any,l:List[Any]):List[Any] ={
      if(l.isEmpty) List()
      else if (x == l.head) delete(x,l.tail)
      else l.head :: delete(x,l.tail)
    }

    def main(args: Array[String]): Unit = {
      println(delete(3,listNum))

    }


}
