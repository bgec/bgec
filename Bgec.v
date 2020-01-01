module Controller(
  input         clock,
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
  output [63:0] io_outData,
  input         io_serialize,
  output        io_data
);
  wire [39:0] _T_3; // @[Cat.scala 29:58]
  wire [52:0] _T_9; // @[Cat.scala 29:58]
  wire [10:0] _T_19; // @[Cat.scala 29:58]
  reg [5:0] bitIndex; // @[Controller.scala 60:21]
  reg [31:0] _RAND_0;
  reg [7:0] cycleCounter; // @[Controller.scala 61:25]
  reg [31:0] _RAND_1;
  reg [1:0] microsecondCounter; // @[Controller.scala 62:31]
  reg [31:0] _RAND_2;
  reg  serialize; // @[Controller.scala 63:22]
  reg [31:0] _RAND_3;
  wire  _GEN_0; // @[Controller.scala 65:22]
  wire  _T_21; // @[Controller.scala 69:8]
  wire  _T_22; // @[Controller.scala 75:29]
  wire  _T_23; // @[Controller.scala 77:36]
  wire  _T_24; // @[Controller.scala 77:68]
  wire  _T_25; // @[Controller.scala 77:45]
  wire [63:0] _T_26; // @[Controller.scala 78:28]
  wire  _T_27; // @[Controller.scala 78:28]
  wire  _GEN_1; // @[Controller.scala 77:78]
  wire  _GEN_2; // @[Controller.scala 75:38]
  wire [7:0] _T_29; // @[Controller.scala 82:34]
  wire  _T_30; // @[Controller.scala 83:23]
  wire  _T_31; // @[Controller.scala 85:31]
  wire  _T_32; // @[Controller.scala 87:23]
  wire [5:0] _T_34; // @[Controller.scala 90:32]
  wire [1:0] _T_36; // @[Controller.scala 93:50]
  assign _T_3 = {io_inJoystickY,io_inCstickX,io_inCstickY,io_inTriggerL,io_inTriggerR}; // @[Cat.scala 29:58]
  assign _T_9 = {io_inButtonZ,io_inDpadUp,io_inDpadDown,io_inDpadRight,io_inDpadLeft,io_inJoystickX,_T_3}; // @[Cat.scala 29:58]
  assign _T_19 = {3'h0,io_inButtonStart,io_inButtonY,io_inButtonX,io_inButtonB,io_inButtonA,1'h1,io_inButtonL,io_inButtonR}; // @[Cat.scala 29:58]
  assign _GEN_0 = io_serialize | serialize; // @[Controller.scala 65:22]
  assign _T_21 = serialize == 1'h0; // @[Controller.scala 69:8]
  assign _T_22 = microsecondCounter == 2'h0; // @[Controller.scala 75:29]
  assign _T_23 = microsecondCounter == 2'h1; // @[Controller.scala 77:36]
  assign _T_24 = microsecondCounter == 2'h2; // @[Controller.scala 77:68]
  assign _T_25 = _T_23 | _T_24; // @[Controller.scala 77:45]
  assign _T_26 = io_outData >> bitIndex; // @[Controller.scala 78:28]
  assign _T_27 = _T_26[0]; // @[Controller.scala 78:28]
  assign _GEN_1 = _T_25 ? _T_27 : 1'h1; // @[Controller.scala 77:78]
  assign _GEN_2 = _T_22 ? 1'h0 : _GEN_1; // @[Controller.scala 75:38]
  assign _T_29 = cycleCounter + 8'h1; // @[Controller.scala 82:34]
  assign _T_30 = cycleCounter == 8'h10; // @[Controller.scala 83:23]
  assign _T_31 = microsecondCounter == 2'h3; // @[Controller.scala 85:31]
  assign _T_32 = bitIndex == 6'h3f; // @[Controller.scala 87:23]
  assign _T_34 = bitIndex + 6'h1; // @[Controller.scala 90:32]
  assign _T_36 = microsecondCounter + 2'h1; // @[Controller.scala 93:50]
  assign io_outData = {_T_19,_T_9}; // @[Controller.scala 35:14]
  assign io_data = _T_21 ? 1'h0 : _GEN_2; // @[Controller.scala 70:13 Controller.scala 76:15 Controller.scala 78:15 Controller.scala 80:15]
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
  bitIndex = _RAND_0[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cycleCounter = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  microsecondCounter = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  serialize = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_21) begin
      bitIndex <= 6'h0;
    end else if (_T_30) begin
      if (_T_31) begin
        if (!(_T_32)) begin
          bitIndex <= _T_34;
        end
      end
    end
    if (_T_21) begin
      cycleCounter <= 8'h0;
    end else if (_T_30) begin
      cycleCounter <= 8'h0;
    end else begin
      cycleCounter <= _T_29;
    end
    if (_T_21) begin
      microsecondCounter <= 2'h0;
    end else if (_T_30) begin
      if (_T_31) begin
        microsecondCounter <= 2'h0;
      end else begin
        microsecondCounter <= _T_36;
      end
    end
    if (_T_21) begin
      serialize <= _GEN_0;
    end else if (_T_30) begin
      if (_T_31) begin
        if (_T_32) begin
          serialize <= 1'h0;
        end else begin
          serialize <= _GEN_0;
        end
      end else begin
        serialize <= _GEN_0;
      end
    end else begin
      serialize <= _GEN_0;
    end
  end
endmodule
module SdReader(
  inout  [3:0] io_data,
  inout        io_command
);
  initial begin end
endmodule
module Bgec(
  input        clock,
  input        reset,
  input        io_inButtonStart,
  input        io_inButtonY,
  input        io_inButtonX,
  input        io_inButtonB,
  input        io_inButtonA,
  input        io_inButtonL,
  input        io_inButtonR,
  input        io_inButtonZ,
  input        io_inDpadUp,
  input        io_inDpadDown,
  input        io_inDpadRight,
  input        io_inDpadLeft,
  input  [7:0] io_inJoystickX,
  input  [7:0] io_inJoystickY,
  input  [7:0] io_inCstickX,
  input  [7:0] io_inCstickY,
  input  [7:0] io_inTriggerL,
  input  [7:0] io_inTriggerR,
  inout  [3:0] io_sdData,
  inout        io_sdCmd,
  input        io_inSerialize,
  output       io_data
);
  wire  controller_clock; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonStart; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonY; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonX; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonB; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonA; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonL; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonR; // @[Bgec.scala 9:26]
  wire  controller_io_inButtonZ; // @[Bgec.scala 9:26]
  wire  controller_io_inDpadUp; // @[Bgec.scala 9:26]
  wire  controller_io_inDpadDown; // @[Bgec.scala 9:26]
  wire  controller_io_inDpadRight; // @[Bgec.scala 9:26]
  wire  controller_io_inDpadLeft; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inJoystickX; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inJoystickY; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inCstickX; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inCstickY; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inTriggerL; // @[Bgec.scala 9:26]
  wire [7:0] controller_io_inTriggerR; // @[Bgec.scala 9:26]
  wire [63:0] controller_io_outData; // @[Bgec.scala 9:26]
  wire  controller_io_serialize; // @[Bgec.scala 9:26]
  wire  controller_io_data; // @[Bgec.scala 9:26]
  Controller controller ( // @[Bgec.scala 9:26]
    .clock(controller_clock),
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
    .io_outData(controller_io_outData),
    .io_serialize(controller_io_serialize),
    .io_data(controller_io_data)
  );
  SdReader sdreader ( // @[Bgec.scala 10:24]
    .io_data(io_sdData),
    .io_command(io_sdCmd)
  );
  assign io_data = controller_io_data; // @[Bgec.scala 63:11]
  assign controller_clock = clock;
  assign controller_io_inButtonStart = io_inButtonStart; // @[Bgec.scala 45:31]
  assign controller_io_inButtonY = io_inButtonY; // @[Bgec.scala 41:27]
  assign controller_io_inButtonX = io_inButtonX; // @[Bgec.scala 40:27]
  assign controller_io_inButtonB = io_inButtonB; // @[Bgec.scala 39:27]
  assign controller_io_inButtonA = io_inButtonA; // @[Bgec.scala 38:27]
  assign controller_io_inButtonL = io_inButtonL; // @[Bgec.scala 42:27]
  assign controller_io_inButtonR = io_inButtonR; // @[Bgec.scala 43:27]
  assign controller_io_inButtonZ = io_inButtonZ; // @[Bgec.scala 44:27]
  assign controller_io_inDpadUp = io_inDpadUp; // @[Bgec.scala 47:26]
  assign controller_io_inDpadDown = io_inDpadDown; // @[Bgec.scala 46:28]
  assign controller_io_inDpadRight = io_inDpadRight; // @[Bgec.scala 49:29]
  assign controller_io_inDpadLeft = io_inDpadLeft; // @[Bgec.scala 48:28]
  assign controller_io_inJoystickX = io_inJoystickX; // @[Bgec.scala 50:29]
  assign controller_io_inJoystickY = io_inJoystickY; // @[Bgec.scala 51:29]
  assign controller_io_inCstickX = io_inCstickX; // @[Bgec.scala 52:27]
  assign controller_io_inCstickY = io_inCstickY; // @[Bgec.scala 53:27]
  assign controller_io_inTriggerL = io_inTriggerL; // @[Bgec.scala 54:28]
  assign controller_io_inTriggerR = io_inTriggerR; // @[Bgec.scala 55:28]
  assign controller_io_serialize = io_inSerialize; // @[Bgec.scala 62:27]
endmodule
