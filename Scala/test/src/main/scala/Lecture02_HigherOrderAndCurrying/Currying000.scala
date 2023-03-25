package Lecture02_HigherOrderAndCurrying

object Currying000 {
  def add(x:Int,y:Int) = {
    x+y
  }

  def addCurry(x:Int): Int => Int = {
    (y:Int) => x+y
  }

  def addCurryShort(x:Int)(y:Int):Int = x+y

  def main(args: Array[String]): Unit = {
    println(addCurry(3)(5))

    val sum20 = addCurry(20)  //yes, it's partial execution
    println(sum20(7))

    val sum30 = addCurryShort(30)_
    println(sum30(1))

    //println(addCurryShort(3)(5))

  }
}
