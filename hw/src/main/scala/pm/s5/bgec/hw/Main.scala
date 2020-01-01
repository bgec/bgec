package pm.s5.bgec.hw

import chisel3._
import chisel3.util._
import firrtl.FirrtlExecutionSuccess

object Main {

  def main(args: Array[String]): Unit = {
    Driver.execute(args, () => new Bgec)
  }

}
