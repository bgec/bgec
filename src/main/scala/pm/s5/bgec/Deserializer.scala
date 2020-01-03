package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class Deserializer(bits: Int) extends Module {

  val io = IO(new Bundle {
    val startDeserialization = Input(Bool())
    val readData = Input(Bool())

    val inputData = Output(Vec(bits, Bool()))
    val bitsRead = Output(UInt(bits.W))
  })

  val dataBuffer = Reg(Vec(bits, Bool()))
  val bitsReadReg = Reg(UInt(bits.W))

  val microsecondCounter = RegInit(UInt(2.W), 0.U)
  val cycleCounter = RegInit(UInt(4.W), 0.U)
  val deserialize = RegInit(Bool(), false.B)

  when(reset.asBool()) {
    (0 until bits).foreach(dataBuffer(_) := false.B)
  }

  when(io.startDeserialization && !deserialize) {
    // TODO align microsecondCounter
  }

  io.inputData := dataBuffer
  io.bitsRead := bitsReadReg

  def shiftDataBuffer(newBit: Bool) = {
    bitsReadReg := bitsReadReg + 1.U
    (0 until (bits - 1)).foreach { i =>
      dataBuffer(i) := dataBuffer(i + 1)
    }
    dataBuffer(bits - 1) := newBit
  }

  def dataBufferEndsWith(sequence: Vector[Boolean]) = {
    sequence.zipWithIndex.map {
      case (bit, i) =>
        val bufferBit = io.inputData(bits - sequence.size + i)
        !(bufferBit ^ bit.B)
    }.foldLeft(true.B)(_ && _)
  }

}
