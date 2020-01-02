module Controller(
  input         io_inButtonStart,
  input         io_inButtonY,
  input         io_inButtonX,
  input         io_inButtonB,
  input         io_inButtonA,
  input         io_inButtonL,
  input         io_inButtonR,
  input         io_inButtonZ,
  input         io_inDpadUp,
  input         io_inDpadDown,
  input         io_inDpadRight,
  input         io_inDpadLeft,
  input  [7:0]  io_inJoystickX,
  input  [7:0]  io_inJoystickY,
  input  [7:0]  io_inCstickX,
  input  [7:0]  io_inCstickY,
  input  [7:0]  io_inTriggerL,
  input  [7:0]  io_inTriggerR,
  output [63:0] io_outData
);
  wire [39:0] _T_3; // @[Cat.scala 29:58]
  wire [52:0] _T_9; // @[Cat.scala 29:58]
  wire [10:0] _T_19; // @[Cat.scala 29:58]
  assign _T_3 = {io_inJoystickY,io_inCstickX,io_inCstickY,io_inTriggerL,io_inTriggerR}; // @[Cat.scala 29:58]
  assign _T_9 = {io_inButtonZ,io_inDpadUp,io_inDpadDown,io_inDpadRight,io_inDpadLeft,io_inJoystickX,_T_3}; // @[Cat.scala 29:58]
  assign _T_19 = {3'h0,io_inButtonStart,io_inButtonY,io_inButtonX,io_inButtonB,io_inButtonA,1'h1,io_inButtonL,io_inButtonR}; // @[Cat.scala 29:58]
  assign io_outData = {_T_19,_T_9}; // @[Controller.scala 31:14]
endmodule
module Bgec(
  input   clock,
  input   reset,
  input   io_inButtonStart,
  input   io_inButtonY,
  input   io_inButtonX,
  input   io_inButtonB,
  input   io_inButtonA,
  input   io_inButtonL,
  input   io_inButtonR,
  input   io_inButtonZ,
  input   io_inDpadUp,
  input   io_inDpadDown,
  input   io_inDpadRight,
  input   io_inDpadLeft,
  input   io_inJoystickXSerial,
  input   io_inJoystickYSerial,
  input   io_inCstickXSerial,
  input   io_inCstickYSerial,
  input   io_inTriggerLSerial,
  input   io_inTriggerRSerial,
  output  io_adcClock,
  output  io_adcConvert,
  input   io_serialize,
  output  io_dataOut
);
  wire  controller_io_inButtonStart; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonY; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonX; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonB; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonA; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonL; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonR; // @[Bgec.scala 7:26]
  wire  controller_io_inButtonZ; // @[Bgec.scala 7:26]
  wire  controller_io_inDpadUp; // @[Bgec.scala 7:26]
  wire  controller_io_inDpadDown; // @[Bgec.scala 7:26]
  wire  controller_io_inDpadRight; // @[Bgec.scala 7:26]
  wire  controller_io_inDpadLeft; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inJoystickX; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inJoystickY; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inCstickX; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inCstickY; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inTriggerL; // @[Bgec.scala 7:26]
  wire [7:0] controller_io_inTriggerR; // @[Bgec.scala 7:26]
  wire [63:0] controller_io_outData; // @[Bgec.scala 7:26]
  reg  clockParity; // @[Bgec.scala 35:28]
  reg [31:0] _RAND_0;
  reg  adcReady; // @[Bgec.scala 36:25]
  reg [31:0] _RAND_1;
  reg [6:0] adcTiming; // @[Bgec.scala 37:26]
  reg [31:0] _RAND_2;
  reg [2:0] adcBitIndex; // @[Bgec.scala 38:24]
  reg [31:0] _RAND_3;
  reg  joystickXBits_0; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_4;
  reg  joystickXBits_1; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_5;
  reg  joystickXBits_2; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_6;
  reg  joystickXBits_3; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_7;
  reg  joystickXBits_4; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_8;
  reg  joystickXBits_5; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_9;
  reg  joystickXBits_6; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_10;
  reg  joystickXBits_7; // @[Bgec.scala 40:26]
  reg [31:0] _RAND_11;
  reg  joystickYBits_0; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_12;
  reg  joystickYBits_1; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_13;
  reg  joystickYBits_2; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_14;
  reg  joystickYBits_3; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_15;
  reg  joystickYBits_4; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_16;
  reg  joystickYBits_5; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_17;
  reg  joystickYBits_6; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_18;
  reg  joystickYBits_7; // @[Bgec.scala 41:26]
  reg [31:0] _RAND_19;
  reg  cstickXBits_0; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_20;
  reg  cstickXBits_1; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_21;
  reg  cstickXBits_2; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_22;
  reg  cstickXBits_3; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_23;
  reg  cstickXBits_4; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_24;
  reg  cstickXBits_5; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_25;
  reg  cstickXBits_6; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_26;
  reg  cstickXBits_7; // @[Bgec.scala 42:24]
  reg [31:0] _RAND_27;
  reg  cstickYBits_0; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_28;
  reg  cstickYBits_1; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_29;
  reg  cstickYBits_2; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_30;
  reg  cstickYBits_3; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_31;
  reg  cstickYBits_4; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_32;
  reg  cstickYBits_5; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_33;
  reg  cstickYBits_6; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_34;
  reg  cstickYBits_7; // @[Bgec.scala 43:24]
  reg [31:0] _RAND_35;
  reg  triggerLBits_0; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_36;
  reg  triggerLBits_1; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_37;
  reg  triggerLBits_2; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_38;
  reg  triggerLBits_3; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_39;
  reg  triggerLBits_4; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_40;
  reg  triggerLBits_5; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_41;
  reg  triggerLBits_6; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_42;
  reg  triggerLBits_7; // @[Bgec.scala 44:25]
  reg [31:0] _RAND_43;
  reg  triggerRBits_0; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_44;
  reg  triggerRBits_1; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_45;
  reg  triggerRBits_2; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_46;
  reg  triggerRBits_3; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_47;
  reg  triggerRBits_4; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_48;
  reg  triggerRBits_5; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_49;
  reg  triggerRBits_6; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_50;
  reg  triggerRBits_7; // @[Bgec.scala 45:25]
  reg [31:0] _RAND_51;
  wire [2:0] _T_1; // @[Bgec.scala 55:34]
  wire  _T_2; // @[Bgec.scala 56:24]
  wire  _T_3; // @[Bgec.scala 60:20]
  wire  _T_4; // @[Bgec.scala 64:32]
  wire [6:0] _T_6; // @[Bgec.scala 66:28]
  wire  _T_7; // @[Bgec.scala 67:20]
  wire  _GEN_99; // @[Bgec.scala 67:29]
  wire [3:0] _T_10; // @[Bgec.scala 86:52]
  wire [3:0] _T_13; // @[Bgec.scala 86:52]
  wire [3:0] _T_17; // @[Bgec.scala 87:52]
  wire [3:0] _T_20; // @[Bgec.scala 87:52]
  wire [3:0] _T_24; // @[Bgec.scala 88:48]
  wire [3:0] _T_27; // @[Bgec.scala 88:48]
  wire [3:0] _T_31; // @[Bgec.scala 89:48]
  wire [3:0] _T_34; // @[Bgec.scala 89:48]
  wire [3:0] _T_38; // @[Bgec.scala 90:50]
  wire [3:0] _T_41; // @[Bgec.scala 90:50]
  wire [3:0] _T_45; // @[Bgec.scala 91:50]
  wire [3:0] _T_48; // @[Bgec.scala 91:50]
  reg [5:0] serializeIndex; // @[Bgec.scala 93:27]
  reg [31:0] _RAND_52;
  reg [1:0] microsecondCounter; // @[Bgec.scala 94:31]
  reg [31:0] _RAND_53;
  reg [3:0] cycleCounter; // @[Bgec.scala 95:25]
  reg [31:0] _RAND_54;
  reg  doSerialize; // @[Bgec.scala 96:28]
  reg [31:0] _RAND_55;
  wire  _T_50; // @[Bgec.scala 98:24]
  wire  _T_51; // @[Bgec.scala 98:21]
  wire  _GEN_159; // @[Bgec.scala 98:38]
  wire  _T_52; // @[Bgec.scala 106:29]
  wire  _T_53; // @[Bgec.scala 108:35]
  wire [63:0] _T_54; // @[Bgec.scala 111:42]
  wire  _T_55; // @[Bgec.scala 111:42]
  wire  _GEN_160; // @[Bgec.scala 108:44]
  wire  _GEN_161; // @[Bgec.scala 106:38]
  wire [3:0] _T_57; // @[Bgec.scala 113:34]
  wire  _T_58; // @[Bgec.scala 114:23]
  wire [1:0] _T_60; // @[Bgec.scala 115:48]
  wire [5:0] _T_63; // @[Bgec.scala 117:42]
  wire  _T_64; // @[Bgec.scala 118:29]
  Controller controller ( // @[Bgec.scala 7:26]
    .io_inButtonStart(controller_io_inButtonStart),
    .io_inButtonY(controller_io_inButtonY),
    .io_inButtonX(controller_io_inButtonX),
    .io_inButtonB(controller_io_inButtonB),
    .io_inButtonA(controller_io_inButtonA),
    .io_inButtonL(controller_io_inButtonL),
    .io_inButtonR(controller_io_inButtonR),
    .io_inButtonZ(controller_io_inButtonZ),
    .io_inDpadUp(controller_io_inDpadUp),
    .io_inDpadDown(controller_io_inDpadDown),
    .io_inDpadRight(controller_io_inDpadRight),
    .io_inDpadLeft(controller_io_inDpadLeft),
    .io_inJoystickX(controller_io_inJoystickX),
    .io_inJoystickY(controller_io_inJoystickY),
    .io_inCstickX(controller_io_inCstickX),
    .io_inCstickY(controller_io_inCstickY),
    .io_inTriggerL(controller_io_inTriggerL),
    .io_inTriggerR(controller_io_inTriggerR),
    .io_outData(controller_io_outData)
  );
  assign _T_1 = adcBitIndex + 3'h1; // @[Bgec.scala 55:34]
  assign _T_2 = adcBitIndex == 3'h0; // @[Bgec.scala 56:24]
  assign _T_3 = clockParity == 1'h0; // @[Bgec.scala 60:20]
  assign _T_4 = adcTiming < 7'h7; // @[Bgec.scala 64:32]
  assign _T_6 = adcTiming + 7'h1; // @[Bgec.scala 66:28]
  assign _T_7 = adcTiming == 7'h0; // @[Bgec.scala 67:20]
  assign _GEN_99 = _T_7 | adcReady; // @[Bgec.scala 67:29]
  assign _T_10 = {joystickXBits_3,joystickXBits_2,joystickXBits_1,joystickXBits_0}; // @[Bgec.scala 86:52]
  assign _T_13 = {joystickXBits_7,joystickXBits_6,joystickXBits_5,joystickXBits_4}; // @[Bgec.scala 86:52]
  assign _T_17 = {joystickYBits_3,joystickYBits_2,joystickYBits_1,joystickYBits_0}; // @[Bgec.scala 87:52]
  assign _T_20 = {joystickYBits_7,joystickYBits_6,joystickYBits_5,joystickYBits_4}; // @[Bgec.scala 87:52]
  assign _T_24 = {cstickXBits_3,cstickXBits_2,cstickXBits_1,cstickXBits_0}; // @[Bgec.scala 88:48]
  assign _T_27 = {cstickXBits_7,cstickXBits_6,cstickXBits_5,cstickXBits_4}; // @[Bgec.scala 88:48]
  assign _T_31 = {cstickYBits_3,cstickYBits_2,cstickYBits_1,cstickYBits_0}; // @[Bgec.scala 89:48]
  assign _T_34 = {cstickYBits_7,cstickYBits_6,cstickYBits_5,cstickYBits_4}; // @[Bgec.scala 89:48]
  assign _T_38 = {triggerLBits_3,triggerLBits_2,triggerLBits_1,triggerLBits_0}; // @[Bgec.scala 90:50]
  assign _T_41 = {triggerLBits_7,triggerLBits_6,triggerLBits_5,triggerLBits_4}; // @[Bgec.scala 90:50]
  assign _T_45 = {triggerRBits_3,triggerRBits_2,triggerRBits_1,triggerRBits_0}; // @[Bgec.scala 91:50]
  assign _T_48 = {triggerRBits_7,triggerRBits_6,triggerRBits_5,triggerRBits_4}; // @[Bgec.scala 91:50]
  assign _T_50 = doSerialize == 1'h0; // @[Bgec.scala 98:24]
  assign _T_51 = io_serialize & _T_50; // @[Bgec.scala 98:21]
  assign _GEN_159 = _T_51 | doSerialize; // @[Bgec.scala 98:38]
  assign _T_52 = microsecondCounter == 2'h0; // @[Bgec.scala 106:29]
  assign _T_53 = microsecondCounter == 2'h3; // @[Bgec.scala 108:35]
  assign _T_54 = controller_io_outData >> serializeIndex; // @[Bgec.scala 111:42]
  assign _T_55 = _T_54[0]; // @[Bgec.scala 111:42]
  assign _GEN_160 = _T_53 | _T_55; // @[Bgec.scala 108:44]
  assign _GEN_161 = _T_52 ? 1'h0 : _GEN_160; // @[Bgec.scala 106:38]
  assign _T_57 = cycleCounter + 4'h1; // @[Bgec.scala 113:34]
  assign _T_58 = cycleCounter == 4'h0; // @[Bgec.scala 114:23]
  assign _T_60 = microsecondCounter + 2'h1; // @[Bgec.scala 115:48]
  assign _T_63 = serializeIndex + 6'h1; // @[Bgec.scala 117:42]
  assign _T_64 = serializeIndex == 6'h0; // @[Bgec.scala 118:29]
  assign io_adcClock = adcReady & clockParity; // @[Bgec.scala 62:17 Bgec.scala 65:17]
  assign io_adcConvert = adcReady ? 1'h0 : _T_4; // @[Bgec.scala 61:19 Bgec.scala 64:19]
  assign io_dataOut = doSerialize & _GEN_161; // @[Bgec.scala 107:18 Bgec.scala 109:18 Bgec.scala 111:18 Bgec.scala 123:26]
  assign controller_io_inButtonStart = io_inButtonStart; // @[Bgec.scala 81:31]
  assign controller_io_inButtonY = io_inButtonY; // @[Bgec.scala 77:27]
  assign controller_io_inButtonX = io_inButtonX; // @[Bgec.scala 76:27]
  assign controller_io_inButtonB = io_inButtonB; // @[Bgec.scala 75:27]
  assign controller_io_inButtonA = io_inButtonA; // @[Bgec.scala 74:27]
  assign controller_io_inButtonL = io_inButtonL; // @[Bgec.scala 78:27]
  assign controller_io_inButtonR = io_inButtonR; // @[Bgec.scala 79:27]
  assign controller_io_inButtonZ = io_inButtonZ; // @[Bgec.scala 80:27]
  assign controller_io_inDpadUp = io_inDpadUp; // @[Bgec.scala 83:26]
  assign controller_io_inDpadDown = io_inDpadDown; // @[Bgec.scala 82:28]
  assign controller_io_inDpadRight = io_inDpadRight; // @[Bgec.scala 85:29]
  assign controller_io_inDpadLeft = io_inDpadLeft; // @[Bgec.scala 84:28]
  assign controller_io_inJoystickX = {_T_13,_T_10}; // @[Bgec.scala 86:29]
  assign controller_io_inJoystickY = {_T_20,_T_17}; // @[Bgec.scala 87:29]
  assign controller_io_inCstickX = {_T_27,_T_24}; // @[Bgec.scala 88:27]
  assign controller_io_inCstickY = {_T_34,_T_31}; // @[Bgec.scala 89:27]
  assign controller_io_inTriggerL = {_T_41,_T_38}; // @[Bgec.scala 90:28]
  assign controller_io_inTriggerR = {_T_48,_T_45}; // @[Bgec.scala 91:28]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  clockParity = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  adcReady = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  adcTiming = _RAND_2[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  adcBitIndex = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  joystickXBits_0 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  joystickXBits_1 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  joystickXBits_2 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  joystickXBits_3 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  joystickXBits_4 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  joystickXBits_5 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  joystickXBits_6 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  joystickXBits_7 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  joystickYBits_0 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  joystickYBits_1 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  joystickYBits_2 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  joystickYBits_3 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  joystickYBits_4 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  joystickYBits_5 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  joystickYBits_6 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  joystickYBits_7 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  cstickXBits_0 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  cstickXBits_1 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  cstickXBits_2 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  cstickXBits_3 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  cstickXBits_4 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  cstickXBits_5 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  cstickXBits_6 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  cstickXBits_7 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  cstickYBits_0 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  cstickYBits_1 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  cstickYBits_2 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  cstickYBits_3 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  cstickYBits_4 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  cstickYBits_5 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  cstickYBits_6 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  cstickYBits_7 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  triggerLBits_0 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  triggerLBits_1 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  triggerLBits_2 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  triggerLBits_3 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  triggerLBits_4 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  triggerLBits_5 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  triggerLBits_6 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  triggerLBits_7 = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  triggerRBits_0 = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  triggerRBits_1 = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  triggerRBits_2 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  triggerRBits_3 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  triggerRBits_4 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  triggerRBits_5 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  triggerRBits_6 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  triggerRBits_7 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  serializeIndex = _RAND_52[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  microsecondCounter = _RAND_53[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  cycleCounter = _RAND_54[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  doSerialize = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      clockParity <= 1'h0;
    end else if (adcReady) begin
      clockParity <= _T_3;
    end else if (_T_7) begin
      clockParity <= 1'h0;
    end
    if (reset) begin
      adcReady <= 1'h0;
    end else if (adcReady) begin
      if (clockParity) begin
        if (_T_2) begin
          adcReady <= 1'h0;
        end
      end
    end else begin
      adcReady <= _GEN_99;
    end
    if (reset) begin
      adcTiming <= 7'h0;
    end else if (!(adcReady)) begin
      adcTiming <= _T_6;
    end
    if (adcReady) begin
      if (clockParity) begin
        adcBitIndex <= _T_1;
      end
    end else if (_T_7) begin
      adcBitIndex <= 3'h0;
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          joystickXBits_0 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          joystickXBits_1 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          joystickXBits_2 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          joystickXBits_3 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          joystickXBits_4 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          joystickXBits_5 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          joystickXBits_6 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          joystickXBits_7 <= io_inJoystickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          joystickYBits_0 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          joystickYBits_1 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          joystickYBits_2 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          joystickYBits_3 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          joystickYBits_4 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          joystickYBits_5 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          joystickYBits_6 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          joystickYBits_7 <= io_inJoystickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          cstickXBits_0 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          cstickXBits_1 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          cstickXBits_2 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          cstickXBits_3 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          cstickXBits_4 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          cstickXBits_5 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          cstickXBits_6 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          cstickXBits_7 <= io_inCstickXSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          cstickYBits_0 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          cstickYBits_1 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          cstickYBits_2 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          cstickYBits_3 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          cstickYBits_4 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          cstickYBits_5 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          cstickYBits_6 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          cstickYBits_7 <= io_inCstickYSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          triggerLBits_0 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          triggerLBits_1 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          triggerLBits_2 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          triggerLBits_3 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          triggerLBits_4 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          triggerLBits_5 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          triggerLBits_6 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          triggerLBits_7 <= io_inTriggerLSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h0 == adcBitIndex) begin
          triggerRBits_0 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h1 == adcBitIndex) begin
          triggerRBits_1 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h2 == adcBitIndex) begin
          triggerRBits_2 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h3 == adcBitIndex) begin
          triggerRBits_3 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h4 == adcBitIndex) begin
          triggerRBits_4 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h5 == adcBitIndex) begin
          triggerRBits_5 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h6 == adcBitIndex) begin
          triggerRBits_6 <= io_inTriggerRSerial;
        end
      end
    end
    if (adcReady) begin
      if (clockParity) begin
        if (3'h7 == adcBitIndex) begin
          triggerRBits_7 <= io_inTriggerRSerial;
        end
      end
    end
    if (doSerialize) begin
      if (_T_58) begin
        if (_T_52) begin
          serializeIndex <= _T_63;
        end else if (_T_51) begin
          serializeIndex <= 6'h0;
        end
      end else if (_T_51) begin
        serializeIndex <= 6'h0;
      end
    end else if (_T_51) begin
      serializeIndex <= 6'h0;
    end
    if (doSerialize) begin
      if (_T_58) begin
        microsecondCounter <= _T_60;
      end else if (_T_51) begin
        microsecondCounter <= 2'h0;
      end
    end else if (_T_51) begin
      microsecondCounter <= 2'h0;
    end
    if (doSerialize) begin
      cycleCounter <= _T_57;
    end else if (_T_51) begin
      cycleCounter <= 4'h0;
    end
    if (reset) begin
      doSerialize <= 1'h0;
    end else if (doSerialize) begin
      if (_T_58) begin
        if (_T_52) begin
          if (_T_64) begin
            doSerialize <= 1'h0;
          end else begin
            doSerialize <= _GEN_159;
          end
        end else begin
          doSerialize <= _GEN_159;
        end
      end else begin
        doSerialize <= _GEN_159;
      end
    end else begin
      doSerialize <= _GEN_159;
    end
  end
endmodule
