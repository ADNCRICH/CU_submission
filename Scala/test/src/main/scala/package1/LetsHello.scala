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

        object Math{
            //def addM(array: Array[Int] = new Array[Int](3),array2: Array[Int] = new Array[Int](3)): Int = array[0]*array2[0]
        }
        var func1 = (a:Int,b:Int)=> (a+1)*b
        print(func1(6,6))
    }


    def area(w: Int, h: Int): Int = w * h
    def biggerVolumn(width:Double,depth:Double,hight:Double):Double={
        return width
    }
}
