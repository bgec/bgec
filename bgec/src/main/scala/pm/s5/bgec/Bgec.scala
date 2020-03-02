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

    val outJoystickXNotConvSt = Output(Bool())
    val inJoystickXNotEndOfConv = Input(Bool())
    val outJoystickXNotChipSel = Output(Bool())
    val outJoystickXNotRead = Output(Bool())
    val inJoystickXData = Input(UInt(8.W))

    val outJoystickYNotConvSt = Output(Bool())
    val inJoystickYNotEndOfConv = Input(Bool())
    val outJoystickYNotChipSel = Output(Bool())
    val outJoystickYNotRead = Output(Bool())
    val inJoystickYData = Input(UInt(8.W))

    val outCStickXNotConvSt = Output(Bool())
    val inCStickXNotEndOfConv = Input(Bool())
    val outCStickXNotChipSel = Output(Bool())
    val outCStickXNotRead = Output(Bool())
    val inCStickXData = Input(UInt(8.W))

    val outCStickYNotConvSt = Output(Bool())
    val inCStickYNotEndOfConv = Input(Bool())
    val outCStickYNotChipSel = Output(Bool())
    val outCStickYNotRead = Output(Bool())
    val inCStickYData = Input(UInt(8.W))

    val outTriggerLNotConvSt = Output(Bool())
    val inTriggerLNotEndOfConv = Input(Bool())
    val outTriggerLNotChipSel = Output(Bool())
    val outTriggerLNotRead = Output(Bool())
    val inTriggerLData = Input(UInt(8.W))

    val outTriggerRNotConvSt = Output(Bool())
    val inTriggerRNotEndOfConv = Input(Bool())
    val outTriggerRNotChipSel = Output(Bool())
    val outTriggerRNotRead = Output(Bool())
    val inTriggerRData = Input(UInt(8.W))

    val gcData = Analog(1.W)
  })

  val clockParity = RegInit(Bool(), false.B)

  val joystickXADC = Module(new ParallelADC(8))
  io.outJoystickXNotConvSt := joystickXADC.io.notConvSt
  joystickXADC.io.notEndOfConv := io.inJoystickXNotEndOfConv
  io.outJoystickXNotChipSel := joystickXADC.io.notChipSel
  io.outJoystickXNotRead := joystickXADC.io.notRead
  joystickXADC.io.dataBus := io.inJoystickXData
  
  val joystickYADC = Module(new ParallelADC(8))
  io.outJoystickYNotConvSt := joystickYADC.io.notConvSt
  joystickYADC.io.notEndOfConv := io.inJoystickYNotEndOfConv
  io.outJoystickYNotChipSel := joystickYADC.io.notChipSel
  io.outJoystickYNotRead := joystickYADC.io.notRead
  joystickYADC.io.dataBus := io.inJoystickYData

  val cStickXADC = Module(new ParallelADC(8))
  io.outCStickXNotConvSt := cStickXADC.io.notConvSt
  cStickXADC.io.notEndOfConv := io.inCStickXNotEndOfConv
  io.outCStickXNotChipSel := cStickXADC.io.notChipSel
  io.outCStickXNotRead := cStickXADC.io.notRead
  cStickXADC.io.dataBus := io.inCStickXData

  val cStickYADC = Module(new ParallelADC(8))
  io.outCStickYNotConvSt := cStickYADC.io.notConvSt
  cStickYADC.io.notEndOfConv := io.inCStickYNotEndOfConv
  io.outCStickYNotChipSel := cStickYADC.io.notChipSel
  io.outCStickYNotRead := cStickYADC.io.notRead
  cStickYADC.io.dataBus := io.inCStickYData

  val triggerLADC = Module(new ParallelADC(8))
  io.outTriggerLNotConvSt := triggerLADC.io.notConvSt
  triggerLADC.io.notEndOfConv := io.inTriggerLNotEndOfConv
  io.outTriggerLNotChipSel := triggerLADC.io.notChipSel
  io.outTriggerLNotRead := triggerLADC.io.notRead
  triggerLADC.io.dataBus := io.inTriggerLData

  val triggerRADC = Module(new ParallelADC(8))
  io.outTriggerRNotConvSt := triggerRADC.io.notConvSt
  triggerRADC.io.notEndOfConv := io.inTriggerRNotEndOfConv
  io.outTriggerRNotChipSel := triggerRADC.io.notChipSel
  io.outTriggerRNotRead := triggerRADC.io.notRead
  triggerRADC.io.dataBus := io.inTriggerRData

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
  controller.io.inJoystickX := joystickXADC.io.outData
  controller.io.inJoystickY := joystickYADC.io.outData
  controller.io.inCstickX := cStickXADC.io.outData
  controller.io.inCstickY := cStickYADC.io.outData
  controller.io.inTriggerL := triggerLADC.io.outData
  controller.io.inTriggerR := triggerRADC.io.outData

  val dataLine = Module(new DataLine)
  dataLine.io.line <> io.gcData

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
