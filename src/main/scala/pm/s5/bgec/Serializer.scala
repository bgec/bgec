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

    val write = Output(Bool())
    val writeData = Output(Bool())
  })

  val serializeIndex = RegInit(UInt(indexLength.W), 0.U)
  val microsecondCounter = RegInit(UInt(2.W), 0.U)
  val cycleCounter = RegInit(UInt(4.W), 0.U)
  val serialize = RegInit(Bool(), false.B)

  when(io.startSerialization && !serialize) {
    serialize := true.B
  }

  when(serialize) {
    io.write := true.B
    when(microsecondCounter === 0.U) {
      io.writeData := false.B
    }.elsewhen(microsecondCounter === 3.U) {
      io.writeData := true.B
    }.otherwise {
      io.writeData := io.outputData(serializeIndex)
    }
    when(cycleCounter === 15.U) {
      when(microsecondCounter === 3.U) {
        when(serializeIndex >= (bits - 1).U) {
          serialize := false.B
        }
        serializeIndex := serializeIndex + 1.U
      }
      microsecondCounter := microsecondCounter + 1.U
    }
    cycleCounter := cycleCounter + 1.U
  }.otherwise {
    io.write := false.B
    io.writeData := true.B
  }

}
