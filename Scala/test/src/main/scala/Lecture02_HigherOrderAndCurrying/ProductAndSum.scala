package Lecture02_HigherOrderAndCurrying

object ProductAndSum {

  def product(f:Int => Int)(a:Int,b:Int):Int ={
    if(a>b) 1
    else f(a) * product(f)(a+1,b)
  }
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

  def myFac(n: Int):Int ={
    product(id)(1,n)
  }
  def general(f:Int => Int, op: (Int,Int) => Int, startValue:Int)(a:Int,b:Int):Int ={
    if(a>b) startValue
    else op(f(a),general(f,op,startValue)(a+1,b))
  }

  def main(args: Array[String]): Unit = {
    println(general(id, (x,y) => x+y,0)(2,4))  //2+3+4
    println(general(square, (x,y) => x*y,1)(2,4))  //2^2 * 3^2 * 4^2
  }
}
