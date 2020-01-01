package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class Controller extends Module {

  val io = IO(new Bundle {
    val inButtonStart = Input(Bool())
    val inButtonY = Input(Bool())
    val inButtonX = Input(Bool())
    val inButtonB = Input(Bool())
    val inButtonA = Input(Bool())
    val inButtonL = Input(Bool())
    val inButtonR = Input(Bool())
    val inButtonZ = Input(Bool())
    val inDpadUp = Input(Bool())
    val inDpadDown = Input(Bool())
    val inDpadRight = Input(Bool())
    val inDpadLeft = Input(Bool())
    val inJoystickX = Input(UInt(8.W))
    val inJoystickY = Input(UInt(8.W))
    val inCstickX = Input(UInt(8.W))
    val inCstickY = Input(UInt(8.W))
    val inTriggerL = Input(UInt(8.W))
    val inTriggerR = Input(UInt(8.W))
    val outData = Output(UInt(64.W))

    val cyclesPerMicrosecond = Input(UInt(8.W))
    val serialize = Input(Bool())
    val data = Output(UInt(1.W))
  })

  io.outData := Cat(Seq(
    false.B,
    false.B,
    false.B,
    io.inButtonStart,
    io.inButtonY,
    io.inButtonX,
    io.inButtonB,
    io.inButtonA,
    true.B,
    io.inButtonL,
    io.inButtonR,
    io.inButtonZ,
    io.inDpadUp,
    io.inDpadDown,
    io.inDpadRight,
    io.inDpadLeft,
    io.inJoystickX,
    io.inJoystickY,
    io.inCstickX,
    io.inCstickY,
    io.inTriggerL,
    io.inTriggerR
  ))

  val bitIndex = Reg(UInt(6.W))
  val cycleCounter = Reg(UInt(8.W))
  val microsecondCounter = Reg(UInt(2.W))
  val serialize = Reg(Bool())

  when(io.serialize) {
    serialize := true.B
  }

  when(!serialize) {
    io.data := 0.U
    bitIndex := 0.U
    cycleCounter := 0.U
    microsecondCounter := 0.U
  }.otherwise {
    when(microsecondCounter === 0.U) {
      io.data := 0.U
    }.elsewhen((microsecondCounter === 1.U) || (microsecondCounter === 2.U)) {
      io.data := io.outData(bitIndex)
    }.otherwise {
      io.data := 1.U
    }
    cycleCounter := cycleCounter + 1.U
    when(cycleCounter === io.cyclesPerMicrosecond) {
      cycleCounter := 0.U
      when(microsecondCounter === 3.U) {
        microsecondCounter := 0.U
        when(bitIndex === 63.U) {
          serialize := false.B
        }.otherwise {
          bitIndex := bitIndex + 1.U
        }
      }.otherwise {
        microsecondCounter := microsecondCounter + 1.U
      }
    }
  }

}
