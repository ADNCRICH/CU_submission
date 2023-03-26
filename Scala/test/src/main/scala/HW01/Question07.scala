package HW01

object Question07 {
	def myFilter(f: Int => Boolean)(list: List[Int]): List[Int] = {
		if (list.isEmpty)
			return List()
		else if (f(list.head))
			return list.head :: myFilter(f)(list.tail)
		return myFilter(f)(list.tail)
	}

	def main(args: Array[String]): Unit = {
		println(myFilter(x => x % 2 == 0)(List(1, 2, 3, 4, 5)))
		println(myFilter(_ < 3)(List(1, 2, 3, 4, 5)))
	}
}
