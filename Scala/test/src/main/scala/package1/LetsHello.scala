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


    }
    def general()
    def sum(l: Int, r: Int, f: (Int) => Int): Int = {
        if (l > r) return 0
        return f(l) + sum(l + 1, r, f)
    }
    def sumOpp(l: Int, r: Int, f: (Int) => Int): Int = {
        def summ(i:Int,re:Int):Int={
            if(i>r) return re
            return summ(i+1,re+f(i))
        }
        return summ(l,0)
    }

    def area(w: Int, h: Int): Int = w * h

    def biggerVolumn(width: Double, depth: Double, hight: Double): Double = {
        return width
    }
}
