package pm.s5.bgec

import chisel3._
import chisel3.experimental.Analog

class Bgec extends Module {

  val controller = Module(new Controller)
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

    val inJoystickXSerial = Input(Bool())
    val inJoystickYSerial = Input(Bool())
    val inCstickXSerial = Input(Bool())
    val inCstickYSerial = Input(Bool())
    val inTriggerLSerial = Input(Bool())
    val inTriggerRSerial = Input(Bool())
    val adcClock = Output(Bool())
    val adcConvert = Output(Bool())

    val data = Analog(1.W)
  })

  val clockParity = RegInit(Bool(), false.B)
  val adcReady = RegInit(Bool(), false.B)
  val adcTiming = RegInit(UInt(7.W), 0.U)
  val adcBitIndex = Reg(UInt(3.W))

  val joystickXBits = Reg(Vec(8, Bool()))
  val joystickYBits = Reg(Vec(8, Bool()))
  val cstickXBits = Reg(Vec(8, Bool()))
  val cstickYBits = Reg(Vec(8, Bool()))
  val triggerLBits = Reg(Vec(8, Bool()))
  val triggerRBits = Reg(Vec(8, Bool()))

  when(adcReady) {
    when(clockParity) {
      joystickXBits(adcBitIndex) := io.inJoystickXSerial
      joystickYBits(adcBitIndex) := io.inJoystickYSerial
      cstickXBits(adcBitIndex) := io.inCstickXSerial
      cstickYBits(adcBitIndex) := io.inCstickYSerial
      triggerLBits(adcBitIndex) := io.inTriggerLSerial
      triggerRBits(adcBitIndex) := io.inTriggerRSerial
      adcBitIndex := adcBitIndex + 1.U
      when(adcBitIndex === 0.U) {
        adcReady := false.B
      }
    }
    clockParity := !clockParity
    io.adcConvert := false.B
    io.adcClock := clockParity
  }.otherwise {
    io.adcConvert := adcTiming < 7.U
    io.adcClock := false.B
    adcTiming := adcTiming + 1.U
    when(adcTiming === 0.U) {
      adcReady := true.B
      adcBitIndex := 0.U
      clockParity := false.B
    }
  }

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
  controller.io.inJoystickX := joystickXBits.asUInt()
  controller.io.inJoystickY := joystickYBits.asUInt()
  controller.io.inCstickX := cstickXBits.asUInt()
  controller.io.inCstickY := cstickYBits.asUInt()
  controller.io.inTriggerL := triggerLBits.asUInt()
  controller.io.inTriggerR := triggerRBits.asUInt()

  val dataLine = Module(new DataLine)
  dataLine.io.line <> io.data

  val controllerDataSerializer = Module(new Serializer(64))
  controllerDataSerializer.io.outputData := controller.io.outData

  dataLine.io.write := controllerDataSerializer.io.write
  dataLine.io.writeData := controllerDataSerializer.io.writeData

  val commandDeserializer = Module(new Deserializer(24))

  commandDeserializer.io.readData := dataLine.io.readData

  when(reset.asBool()) {
    commandDeserializer.io.startDeserialization := true.B
  }.otherwise {
    commandDeserializer.io.startDeserialization := false.B
  }

  val requestSequence = "0100 0000 0000 0011 0000 0010".collect {
    case '0' => false
    case '1' => true
  }.toVector

  val toldToSerialize = RegInit(Bool(), false.B)

  when(commandDeserializer.dataBufferEndsWith(requestSequence)) {
    controllerDataSerializer.io.startSerialization := !toldToSerialize
    toldToSerialize := true.B
  }.otherwise {
    controllerDataSerializer.io.startSerialization := false.B
    toldToSerialize := false.B
  }
  commandDeserializer.io.pauseDeserialization := controllerDataSerializer.io.write

}
