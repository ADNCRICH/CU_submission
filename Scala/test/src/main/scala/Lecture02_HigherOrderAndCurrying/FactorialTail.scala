package Lecture02_HigherOrderAndCurrying

object FactorialTail {
  def factorial(x: Int, acc: Int): Int ={
    if (x ==0) return acc
    return factorial(x-1,x*acc)
  }

  def main(args: Array[String]): Unit = {
    println(factorial(3,1))
  }
}
