package HW01

object Question08 {
	def sumAll(lists: List[List[Int]]): List[Int] = {
		def play(l: List[List[Int]]): (Int, List[List[Int]]) = {
			if (l.isEmpty)
				return (0, List())
			var xx = play(l.tail)
			if (!l.head.isEmpty)
				return (l.head.head + xx._1, l.head.tail :: xx._2)
			return (xx._1, xx._2)
		}

		var x = play(lists)
		if (!x._2.isEmpty)
			return x._1 :: sumAll(x._2)
		return List()
	}

	def main(args: Array[String]): Unit = {
		println(sumAll(List()))
		println(sumAll(List(List())))
		println(sumAll(List(List(1, 2, 3, 4), List(), List(4, 5), List(1, 2, 3, 4, 5, 6))))
		println(sumAll(List(List(3, 4), List(1, 2, 3, 4, 5, 6), List(1, 2, 3, 4))))
		println(sumAll(List(List(1, 2, 3, 4, 5, 6), List(1, 2, 3, 4), List(1, 2), List(0, 0, 0, 0, 0, 0, 0, 0, 9))))

	}
}
