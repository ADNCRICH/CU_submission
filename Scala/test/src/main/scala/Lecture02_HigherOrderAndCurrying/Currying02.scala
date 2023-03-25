package Lecture02_HigherOrderAndCurrying

object Currying02 {
  def sum(f: Int => Int)(a:Int, b:Int): Int ={
      if(a>b) 0
      else f(a) + sum(f)(a+1,b)
  }

  def id(a:Int):Int = a
  def square(a:Int):Int = a*a
  def factorial(x: Int, acc: Int): Int ={
    if (x ==0) return acc
    return factorial(x-1,x*acc)
  }
  def fac(a: Int):Int = factorial(a,1)

  def main(args: Array[String]): Unit = {
    println(sum(id)(2,4))  //2+3+4
    println(sum(square)(2,4)) //2^2 + 3^2 +4^2
    println(sum(fac)(2,4))    //2! + 3! + 4!
  }
}
