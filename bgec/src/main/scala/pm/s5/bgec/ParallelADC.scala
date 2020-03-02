package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class ParallelADC(bits: Int) extends Module {

  val io = IO(new Bundle {
    val notConvSt = Output(Bool())
    val notEndOfConv = Input(Bool())
    val notChipSel = Output(Bool())
    val notRead = Output(Bool())
    val dataBus = Input(UInt(bits.W))

    val outData = Output(UInt(bits.W))
  })

  val dataReg = Reg(UInt(bits.W))

  io.outData := dataReg

  val startConversion = RegInit(Bool(), true.B)

  when(startConversion) {
    io.notConvSt := false.B
  }.otherwise {
    io.notConvSt := true.B
    startConversion := false.B
  }

  val selectAndRead = RegInit(Bool(), false.B)
  io.notChipSel := !selectAndRead
  io.notRead := selectAndRead

  when(selectAndRead) {
    dataReg := io.dataBus
    selectAndRead := false.B
    startConversion := true.B
  }

  when(!io.notEndOfConv) {
    selectAndRead := true.B
  }

}
