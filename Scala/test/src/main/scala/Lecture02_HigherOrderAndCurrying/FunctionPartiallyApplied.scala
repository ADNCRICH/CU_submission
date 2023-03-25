package Lecture02_HigherOrderAndCurrying

object FunctionPartiallyApplied {
  def mul(x:Double, y:Double): Double ={
    x*y
  }
  def partialMul(y:Double):Double = {
    mul(3, y)
  }

  def main(args: Array[String]): Unit = {
    val sum = (x: Double, y: Double, z: Double) => x + y + z //fully applied function
    val f = sum(3, 5, _: Double)

    println(f(2))
    println(partialMul(3))
  }
}
