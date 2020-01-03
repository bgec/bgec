package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class Serializer(bits: Int) extends Module {

  val indexLength = (bits - 1).toBinaryString.length

  val io = IO(new Bundle {
    val data = Analog(1.W)

    val startSerialization = Input(Bool())
    val outputData = Input(UInt(bits.W))
  })

  val dataLine = Module(new DataLine)

  dataLine.io.clock := clock

  dataLine.io.line <> io.data

  val serializeIndex = RegInit(UInt(indexLength.W), 0.U)
  val microsecondCounter = RegInit(UInt(2.W), 0.U)
  val cycleCounter = RegInit(UInt(4.W), 0.U)
  val serialize = RegInit(Bool(), false.B)

  when(io.startSerialization && !serialize) {
    serialize := true.B
  }

  when(serialize) {
    dataLine.io.write := true.B
    when(microsecondCounter === 0.U) {
      dataLine.io.writeData := false.B
    }.elsewhen(microsecondCounter === 3.U) {
      dataLine.io.writeData := true.B
    }.otherwise {
      dataLine.io.writeData := io.outputData(serializeIndex)
    }
    cycleCounter := cycleCounter + 1.U
    when(cycleCounter === 0.U) {
      microsecondCounter := microsecondCounter + 1.U
      when(microsecondCounter === 0.U) {
        serializeIndex := serializeIndex + 1.U
        when(serializeIndex === 0.U || serializeIndex >= bits.U) {
          serialize := false.B
        }
      }
    }
  }.otherwise {
    dataLine.io.write := false.B
  }

}