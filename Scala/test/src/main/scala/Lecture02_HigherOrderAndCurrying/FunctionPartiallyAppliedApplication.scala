package Lecture02_HigherOrderAndCurrying
import java.util.Date

object FunctionPartiallyAppliedApplication {
  def dateMessage(date: Date, s: String) ={
    println(date + ", " +s)
  }

  def main(args: Array[String]): Unit = {
    var date = new Date
    var newMessage = dateMessage(date, _:String) //closure
    for(i:Int <- 0.to(5)) {
      Thread.sleep(300)
      date = new Date
      newMessage("message " + i)
    }
  }
}
