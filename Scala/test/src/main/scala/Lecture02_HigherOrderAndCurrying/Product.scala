package Lecture02_HigherOrderAndCurrying

import Lecture02_HigherOrderAndCurrying.Currying02.{fac, id, square, sum}

object Product {
  def product(f:Int => Int)(a:Int,b:Int):Int ={
    if(a>b) 1
    else f(a) * product(f)(a+1,b)
  }
  def id(a:Int):Int = a
  def square(a:Int):Int = a*a
  def factorial(x: Int, acc: Int): Int ={
    if (x ==0) return acc
    return factorial(x-1,x*acc)
  }
  def fac(a: Int):Int = factorial(a,1)

  def myFac(n: Int):Int ={
    product(id)(1,n)
  }

  def main(args: Array[String]): Unit = {
    println(product(id)(2,4))  //2*3*4
    println(myFac(4))
    println(product(square)(2,4)) //2^2 * 3^2 *4^2
    println(product(fac)(2,4))    //2! * 3! * 4!
  }


}
