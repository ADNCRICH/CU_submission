package HW01

object Question05 {
	def palindrome(list: List[Any]): Boolean = {
		def rev(l: List[Any]): List[Any] = {
			if (!l.isEmpty)
				return rev(l.tail) ++ List(l.head)
			return List()
		}

		def check(l1: List[Any], l2: List[Any]): Boolean = {
			if (l1.isEmpty)
				return true
			return (l1.head == l2.head) && check(l1.tail, l2.tail)
		}

		return check(list, rev(list))
	}

	def main(args: Array[String]): Unit = {
		println(palindrome(List(1, 3, 5, 3, 1)))
		println(palindrome(List(1, 3, 5, 5, 3, 1)))
		println(palindrome(List(1, 3, 5, 1, 1)))
		println(palindrome(List(1, 3, 5, 5, 3)))
	}

}
