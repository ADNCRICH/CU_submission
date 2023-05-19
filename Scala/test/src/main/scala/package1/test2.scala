package package1

object test2 {

	def partialMap(l: List[String])(f1: String => String)(f2: String => Boolean): List[String] = {
		if (l.length == 0)
			return List()
		if (f2(l.head))
			return f1(l.head) :: partialMap(l.tail)(f1)(f2)
		return l.head :: partialMap(l.tail)(f1)(f2)
	}


	def main(args: Array[String]): Unit = {
		val list1 = List()
		val list2 = List("2a")
		val list3 = List("1", "baby", "2", "3", "shark")
		val list4 = List("anya", "yor", "loid", "franky")

		def fChange1(x: String): String = {
			return x + "yy"
		}

		def fChange2(x: String): String = {
			return x + "punch"
		}

		def cond1(s: String): Boolean = {
			return s.length == 1
		}

		def cond2(s: String): Boolean = {
			return s.length >= 4
		}

		def cond3(s: String): Boolean = {
			return s.contains("a")
		}

		def cond4(s: String): Boolean = {
			return !s.contains("a")
		}

		val p1 = partialMap(list1)(fChange1)(_) //empty list and "yy"
		val p2 = partialMap(list2)(fChange1)(_) // one data and "yy"
		val p3 = partialMap(list3)(fChange2)(_)
		val p4 = partialMap(list4)(fChange2)(_)
		println(p1(cond1) == List())
		println(p2(cond1) == List("2a"))
		println(p2(cond3) == List("2ayy"))
		println(p3(cond1) == List("1punch", "baby", "2punch", "3punch", "shark"))
		println(p3(cond3) == List("1", "babypunch", "2", "3", "sharkpunch"))
		println(p4(cond2) == List("anyapunch", "yor", "loidpunch", "frankypunch"))
		println(p4(cond4) == List("anya", "yorpunch", "loidpunch", "franky"))
	}
}
