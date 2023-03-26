package HW01

object Question04 {
	def mergesort(list: List[Int]): List[Int] = {
		def merge(l: List[Int]): List[Int] = {
			if (l.length > 1) {
				var x = divide(list, 0)
				return sort(merge(x._1), merge(x._2))
			}
			return l
		}

		def divide(l: List[Int], i: Int): (List[Int], List[Int]) = {
			if (l.isEmpty) {
				return (Nil, Nil)
			} else {
				var x = divide(l.tail, i)
				if (l.length > i / 2)
					return (l.head :: x._1, x._2)
				return (x._1, l.head :: x._2)
			}
		}

		def sort(l1: List[Int], l2: List[Int]): List[Int] = {
			if (!l1.isEmpty && !l2.isEmpty) {
				if (l1.head <= l2.head)
					return l1.head :: sort(l1.tail, l2)
				return l2.head :: sort(l1, l2.tail)
			}
			else if (!l1.isEmpty)
				return l1.head :: sort(l1.tail, l2)
			return l2.head :: sort(l1, l2.tail)
		}

		return merge(list)
	}

	def main(args: Array[String]): Unit = {
		println(mergesort(List(1, 5, 4, 6, 7, 9, 5, 4, 1, 2)))
	}
}
