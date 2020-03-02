package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class DataLine extends BlackBox with HasBlackBoxResource {

  val io = IO(new Bundle {
    val line = Analog(1.W)

    val write = Input(Bool())

    val writeData = Input(Bool())
    val readData = Output(Bool())
  })

  addResource("/data_line.v")

}
