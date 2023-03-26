package Prepare

object Quiz1_2022_sec1 {
	def partition(l: List[Int], f: Int => Boolean): List[List[Int]] = {
		if (l.isEmpty)
			return List()
		var x = partition(l.tail, f)
		if (x.isEmpty) {
			if (f(l.head))
				return List(List(l.head), List())
			return List(List(), List(l.head))
		}
		if (f(l.head))
			return List(l.head :: x.head, x.tail.head)
		return List(x.head, l.head :: x.tail.head)
	}

	def compliment(f: Int => Int): Int => Int = {
		//		return f(_) * -1
		return (x) => (f(x) * -1)
	}


	def main(args: Array[String]): Unit = {
		val l1 = List(1, 2, 3, 4, 5)
		println(partition(l1, _ % 2 == 1))
		println(partition(l1, (_ > 3)))
		println(partition(l1, (x => x == 0)))
		println(partition(l1, (x => x < 6)))

		println("-------------------------------------------------")

		println(compliment((x => x * x))(-5)) // -25
		println(compliment((x => x * x))(3)) // -9
		println(compliment((x => -1 * x * x))(3)) // 9
		val c = compliment(_ - 1000)
		println(c(3)) // 997
		println(c(3000))
	}

}
