package HW01

object Question09 {
	def turingStep(f: Char => Char, tape: List[Char], n: Int): List[Char] = {
		def play(i: Int, l: List[Char]): List[Char] = {
			if (l.isEmpty)
				return List()
			else if (i < n)
				return f(l.head) :: play(i + 1, l.tail)
			return l.head :: play(i + 1, l.tail)
		}

		return play(0, tape)
	}

	def main(args: Array[String]): Unit = {
		var f1 = (_: Char).toLower
		var tape = List('C', 'H', 'A', 'R')
		println(turingStep(f1, tape, 2))
		println(turingStep(f1, tape, 3))
		println(turingStep(f1, tape, 0))
		println(turingStep(f1, tape, 5))
	}
}
