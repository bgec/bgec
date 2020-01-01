package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class Bgec extends Module {

  val controller = Module(new Controller)
  val sdreader = Module(new SdReader)
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

    val sdData = Analog(4.W)
    val sdCmd = Analog(1.W)

    val inSerialize = Input(Bool()) // TODO read commands from data line
    val data = Output(UInt(1.W)) // Analog(1.W) TODO figure out how to control a data line
  })

  controller.io.inButtonA := io.inButtonA
  controller.io.inButtonB := io.inButtonB
  controller.io.inButtonX := io.inButtonX
  controller.io.inButtonY := io.inButtonY
  controller.io.inButtonL := io.inButtonL
  controller.io.inButtonR := io.inButtonR
  controller.io.inButtonZ := io.inButtonZ
  controller.io.inButtonStart := io.inButtonStart
  controller.io.inDpadDown := io.inDpadDown
  controller.io.inDpadUp := io.inDpadUp
  controller.io.inDpadLeft := io.inDpadLeft
  controller.io.inDpadRight := io.inDpadRight
  controller.io.inJoystickX := io.inJoystickX
  controller.io.inJoystickY := io.inJoystickY
  controller.io.inCstickX := io.inCstickX
  controller.io.inCstickY := io.inCstickY
  controller.io.inTriggerL := io.inTriggerL
  controller.io.inTriggerR := io.inTriggerR

  sdreader.clock := clock
  sdreader.io.data <> io.sdData
  sdreader.io.command <> io.sdCmd

  controller.io.cyclesPerMicrosecond := 16.U
  controller.io.serialize := io.inSerialize
  io.data := controller.io.data

}
