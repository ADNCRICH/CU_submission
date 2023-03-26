package HW01

object Question10 {
	def alternate(f1: (Int, Int) => Int, f2: (Int, Int) => Int, list: List[Int]): Int = {
		def play(i: Int, now: Int, l: List[Int]): Int = {
			if (l.isEmpty)
				return now
			else if (i % 2 == 0)
				return play(i + 1, f1(now, l.head), l.tail)
			return play(i + 1, f2(now, l.head), l.tail)
		}

		if (list.isEmpty)
			return 0
		return play(0, list.head, list.tail)
	}

	def main(args: Array[String]): Unit = {
		println(alternate(_ + _, _ - _, List()))
		println(alternate(_ + _, _ - _, List(55)))
		println(alternate(_ + _, _ - _, List(1, 2)))
		println(alternate(_ + _, _ - _, List(1, 2, 3)))
		println(alternate(_ + _, _ - _, List(1, 2, 3, 4)))

	}
}
