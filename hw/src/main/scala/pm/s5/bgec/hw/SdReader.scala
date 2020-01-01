package pm.s5.bgec.hw

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class SdReader extends Module {

  val io = IO(new Bundle {
    val data = Analog(4.W)
    val command = Analog(1.W)
    val clock = Output(Clock())
  })

  io.clock := clock

}
