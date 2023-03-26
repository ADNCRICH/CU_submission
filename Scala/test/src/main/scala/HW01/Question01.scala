package HW01

object Question01 {
	def insertLast(x: Any, l: List[Any]): List[Any] = {
		return l ++ List(x)
	}

	def main(args: Array[String]): Unit = {
		println(insertLast(5, List(1, 2, 3, 4)))
	}
}
