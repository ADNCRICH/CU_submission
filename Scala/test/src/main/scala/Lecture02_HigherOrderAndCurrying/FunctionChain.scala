package Lecture02_HigherOrderAndCurrying

object FunctionChain {
  def calculate(x: Double, y: Double, z: Double, myF: (Double, Double) => Double): Double = {
    myF( myF(x,y), z)
  }

  def mul(x: Double, y: Double): Double = x * y

  def main(args: Array[String]): Unit = {
    println(calculate(3, 5, 7, (a, b) => a + b))
    println(calculate(3, 5, 7, _ + _))
    println(calculate(3, 5, 7, mul))
    println(calculate(3, 5, 7, (a, b) => a min b))
    println(calculate(3, 5, 7, _ min _))
  }
}
