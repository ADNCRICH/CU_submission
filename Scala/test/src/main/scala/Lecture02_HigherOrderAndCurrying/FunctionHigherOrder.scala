package Lecture02_HigherOrderAndCurrying

object FunctionHigherOrder {
  def calculate(x: Double, y: Double, myF: (Double, Double) => Double): Double = {
    myF(x, y)
  }

  def mul(x: Double, y: Double): Double = x * y

  def main(args: Array[String]): Unit = {
    println(calculate(3, 5, (a, b) => a + b))
    println(calculate(3, 5, mul))
  }
}
