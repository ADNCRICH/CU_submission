package Lecture03_List_RecursionSupport

object ListAccess {
  val myList: List[Int] = List()
  val listNum = List(1, 2, 3, 4, 5)
  val listNum2 = List(1, 2, 3, 4, 5)
  val listStr: List[String] = List("John", "Robin", "Richard")

  def main(args: Array[String]): Unit = {
   val listStr2 = "Will" :: listStr


   println(listStr2)

   val listNum2 = 9 :: 6 :: 17 :: Nil
   println(listNum2)

   println(listNum ++ listNum2)
  }
}
