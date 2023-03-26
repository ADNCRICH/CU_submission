package HW01

object Question03 {
	def subList(l1: List[Any], l2: List[Any]): Boolean = {
		def check(la: List[Any], lb: List[Any]): Boolean = {
			if (la.isEmpty)
				return true
			return find(la.head, lb) && check(la.tail, lb)
		}

		def find(a: Any, lb: List[Any]): Boolean = {
			if (lb.isEmpty)
				return false
			return (a == lb.head) || find(a, lb.tail)
		}

		return check(l1, l2)
	}

	def main(args: Array[String]): Unit = {
		println(subList(List(1, 5, 6, 4), List(5, 1, 8, 9, 4, 6, 3, 5, 4)))
		println(subList(List(1, 5, 6, 4), List(5, 1, 8, 9, 6, 3, 5)))
	}
}
