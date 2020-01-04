package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class Deserializer(bits: Int) extends Module {

  val io = IO(new Bundle {
    val startDeserialization = Input(Bool())
    val pauseDeserialization = Input(Bool())
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

  val guessingPhase = RegInit(Bool(), false.B)
  val cyclesOfLow = RegInit(UInt(6.W), 0.U)
  val cyclesOfHigh = RegInit(UInt(6.W), 0.U)

  when(!io.pauseDeserialization) {
    when((io.startDeserialization && !deserialize) || guessingPhase) {
      when(io.startDeserialization) {
        guessingPhase := true.B
      }
      when(io.readData) {
        cyclesOfHigh := cyclesOfHigh + 1.U
      }.otherwise {
        cyclesOfLow := cyclesOfLow + 1.U
        when((cyclesOfLow + cyclesOfHigh) > 56.U) {
          shiftDataBuffer(cyclesOfHigh > cyclesOfLow)
          guessingPhase := false.B
          deserialize := true.B
          microsecondCounter := 0.U
          cycleCounter := 0.U
        }
      }
    }

    when(deserialize && !guessingPhase) {
      cycleCounter := cycleCounter + 1.U
      when(cycleCounter === 0.U) {
        microsecondCounter := microsecondCounter + 1.U
        when(microsecondCounter === 2.U) {
          shiftDataBuffer(io.readData)
        }
      }
    }
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
