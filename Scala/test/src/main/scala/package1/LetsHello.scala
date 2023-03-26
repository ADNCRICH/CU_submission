package package1

object LetsHello {
	def main(args: Array[String]): Unit = {
		//    var x = 10
		//    var y = 5
		//    println(s"x is $x $y")

		//    for(x <- 0 to 9;i <- 1 to 10)
		//        println(x,i)
		//        var L = List(2, 4, 6, 8)
		//        //    var A : Array[Int]= Array(1,3,5,7,9)
		//        var A = Array(1, 3, 5, 7, 9)
		//        for (i <- L; j <- A)
		//            println(s"$i $j")

		//        var a = for{x <- 0 until 20;if x%2 == 0 && x%3 == 0} yield 2*x
		//        println(a)
		//        var list = List(1,3,5,7,9)
		//        var b = for{x<-list; if x<=5} yield x*x
		//        println(b)

		//        println(area(5,10))
		//        println(biggerVolumn(5,6,7))
		//
		//        object Math{
		//            def addM(array: Array[Int],array2: Array[Int]): Int = array[0]*array2[0]
		//        }
		//        println(Math.addM((1,2,3),(3,5,8)))

		//        var func1 = (a:Int,b:Int)=> (a+1)*b
		//        print(func1(6,6))

		//        def func(a:Int = 2,b:Int = 3):Int = a*b
		//        println(func(5))
		//        var x = func(_:Int,8)
		//        println(x(7))

		//        println("abcdef".tail)

		//        println(sum(1, 5, _ * 3))
		//        println(sum(1, 5, (x) => x * x))
		//        println(sumOpp(1,5,x=>x*x))

		//        println(general(x=>x,_+_,0)(1,5))
		//        println(general(x=>x*x,(x,y)=>x*y,1)(1,5))
		//		println(1 :: 3 :: List(5, 7, 9))
		//		var x = List(5, 8, 10, 12, 13, 4, 6, 6, 8, 10)
		//		var y = divide(x, x.length)
		//		println(y)
		//		println(sort(y._1, y._2))
	}

	def general(f1: Int => Int, f2: (Int, Int) => Int, startVal: Int)(l: Int, r: Int): Int = {
		if (l > r) return startVal
		return f2(f1(l), general(f1, f2, startVal)(l + 1, r))
	}

	def sum(l: Int, r: Int, f: (Int) => Int): Int = {
		if (l > r) return 0
		return f(l) + sum(l + 1, r, f)
	}

	def sumOpp(l: Int, r: Int, f: (Int) => Int): Int = {
		def summ(i: Int, re: Int): Int = {
			if (i > r) return re
			return summ(i + 1, re + f(i))
		}

		return summ(l, 0)
	}

	def area(w: Int, h: Int): Int = w * h

	def biggerVolumn(width: Double, depth: Double, hight: Double): Double = {
		return width
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
		else if (!l2.isEmpty)
			return l2.head :: sort(l1, l2.tail)
		return Nil
	}
}
