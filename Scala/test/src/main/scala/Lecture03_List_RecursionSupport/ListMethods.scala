package Lecture03_List_RecursionSupport

object ListMethods {
	var myList: List[Int] = List()
	var listNum = List(1, 2, 3, 4, 5)

	var listStr: List[String] = List("John", "Robin", "Richard")


	def main(args: Array[String]): Unit = {
		println(listStr.head)
		println(listNum.tail)
		println(myList.isEmpty)
		println(listNum.reverse)
		println(List.fill(10)(1))
		println(listStr.max)

		listStr = listStr.sorted
		println(listStr)
	}
}
