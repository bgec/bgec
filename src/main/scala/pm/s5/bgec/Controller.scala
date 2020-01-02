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
  })

  io.outData := Cat(Seq( // TODO Map based on compile arguments
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

}
