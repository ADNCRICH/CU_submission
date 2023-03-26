package Prepare

object Quiz1_2022_sec2 {
	def applySeq(x: Int)(fList: List[Int => Int]): Int = {
		def play(now: Int, l: List[Int => Int]): Int = {
			if (l.isEmpty)
				return now
			return play(l.head(now), l.tail)
		}

		return play(x, fList)
	}

	def moreThanHalf(l1: List[Any], l2: List[Any]): Boolean = {
		def play(l: List[Any], cou: Int): Int = {
			if (l.isEmpty)
				return cou
			else if (find(l.head, l2))
				return play(l.tail, cou + 1)
			return play(l.tail, cou)
		}

		def find(x: Any, l: List[Any]): Boolean = {
			if (l.isEmpty)
				return false
			return (x == l.head) || find(x, l.tail)
		}

		return play(l1, 0) * 2 >= l1.length && l1.length > 0
	}

	def main(args: Array[String]): Unit = {
		println(applySeq(1)(List((x => x + 1), (x => x * x), (x => x + 5))))
		println(applySeq(100)(List()))
		println("---------------------------------------")
		val l00 = List()
		val l01 = List()
		val l1 = List(1, 4, 3, 2, 7, 8)
		val l2 = List(2, 9, 7, 1, 6, 10)
		val l3 = List(12, 11, 6, 5, 3, 2)
		val l4 = List("1", "2", "3", "4", "5")
		val l5 = List("9", "7", "5", "3", "1")
		val l6 = List("2", "4", "6", "8", "10")
		println(moreThanHalf(l00, l01)) //false
		println(moreThanHalf(l1, l01)) //false
		println(moreThanHalf(l1, l2)) //true เพรำะจำก l1 มี 1,2,7 อยู่ใน l2 ด้วย (ครึ่งหนึ่ง สำมตัว พอดี)
		println(moreThanHalf(l1, l3)) //false จำก l1 มีแค่ 3 กับ 2 ที่อยู่ใน l3 ด้วย (แค่สองตัว)
		println(moreThanHalf(l4, l5)) //true จำก l4 มี “1”,”3”,”5” อยู่ใน l5 ซึ่งเกินครึ่ง (2.5 ตัว)
		println(moreThanHalf(l4, l6))
	}
}
