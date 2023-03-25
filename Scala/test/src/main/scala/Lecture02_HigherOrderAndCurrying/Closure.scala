package Lecture02_HigherOrderAndCurrying

import Lecture02_HigherOrderAndCurrying.Currying01.{fac, id, square, sum}

object Closure {
  var n = 5
  val add = (x:Int) => x+n    //closure with n coming from outside

  def main(args: Array[String]): Unit = {
    println(add(2))           //closure with add coming from outside
    n =100
    println(add(2))
    println(add(2))
  }

}
