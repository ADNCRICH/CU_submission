package HW01

object Question02 {
	def insertInOrder(x: Int, list: List[Int]): List[Int] = {
		def play(l: List[Int], st: Int): List[Int] = {
			if (l.isEmpty)
				return Nil
			else if (x > l.head)
				return l.head :: play(l.tail, st)
			else if (st == 0)
				return x :: l.head :: play(l.tail, 1)
			return l.head :: play(l.tail, st)
		}

		return play(list, 0)
	}

	def main(args: Array[String]): Unit = {
		println(insertInOrder(5, List(1, 3, 5, 6, 7, 9)))
	}
}
