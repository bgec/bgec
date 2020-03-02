package pm.s5.bgec

import chisel3._
import chisel3.util._
import firrtl.FirrtlExecutionSuccess

object Main {

  def main(args: Array[String]): Unit = {
    Driver.execute(args :+ "--target-dir" :+ "dist", () => new Bgec)
  }

}
