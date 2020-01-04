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
module Serializer(
  input         clock,
  input         reset,
  input         io_startSerialization,
  input  [63:0] io_outputData,
  output        io_write,
  output        io_writeData
);
  reg [5:0] serializeIndex; // @[Serializer.scala 21:31]
  reg [31:0] _RAND_0;
  reg [1:0] microsecondCounter; // @[Serializer.scala 22:35]
  reg [31:0] _RAND_1;
  reg [3:0] cycleCounter; // @[Serializer.scala 23:29]
  reg [31:0] _RAND_2;
  reg  serialize; // @[Serializer.scala 24:26]
  reg [31:0] _RAND_3;
  wire  _T; // @[Serializer.scala 26:33]
  wire  _T_1; // @[Serializer.scala 26:30]
  wire  _GEN_0; // @[Serializer.scala 26:45]
  wire  _T_2; // @[Serializer.scala 32:29]
  wire  _T_3; // @[Serializer.scala 34:35]
  wire [63:0] _T_4; // @[Serializer.scala 37:36]
  wire  _T_5; // @[Serializer.scala 37:36]
  wire  _GEN_1; // @[Serializer.scala 34:44]
  wire  _GEN_2; // @[Serializer.scala 32:38]
  wire [3:0] _T_7; // @[Serializer.scala 39:34]
  wire  _T_8; // @[Serializer.scala 40:23]
  wire [1:0] _T_10; // @[Serializer.scala 41:48]
  wire [5:0] _T_13; // @[Serializer.scala 43:42]
  wire  _T_14; // @[Serializer.scala 44:29]
  assign _T = serialize == 1'h0; // @[Serializer.scala 26:33]
  assign _T_1 = io_startSerialization & _T; // @[Serializer.scala 26:30]
  assign _GEN_0 = _T_1 | serialize; // @[Serializer.scala 26:45]
  assign _T_2 = microsecondCounter == 2'h0; // @[Serializer.scala 32:29]
  assign _T_3 = microsecondCounter == 2'h3; // @[Serializer.scala 34:35]
  assign _T_4 = io_outputData >> serializeIndex; // @[Serializer.scala 37:36]
  assign _T_5 = _T_4[0]; // @[Serializer.scala 37:36]
  assign _GEN_1 = _T_3 | _T_5; // @[Serializer.scala 34:44]
  assign _GEN_2 = _T_2 ? 1'h0 : _GEN_1; // @[Serializer.scala 32:38]
  assign _T_7 = cycleCounter + 4'h1; // @[Serializer.scala 39:34]
  assign _T_8 = cycleCounter == 4'h0; // @[Serializer.scala 40:23]
  assign _T_10 = microsecondCounter + 2'h1; // @[Serializer.scala 41:48]
  assign _T_13 = serializeIndex + 6'h1; // @[Serializer.scala 43:42]
  assign _T_14 = serializeIndex == 6'h0; // @[Serializer.scala 44:29]
  assign io_write = serialize; // @[Serializer.scala 31:14 Serializer.scala 50:14]
  assign io_writeData = serialize ? _GEN_2 : 1'h1; // @[Serializer.scala 33:20 Serializer.scala 35:20 Serializer.scala 37:20 Serializer.scala 51:18]
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
  serializeIndex = _RAND_0[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  microsecondCounter = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cycleCounter = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  serialize = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      serializeIndex <= 6'h0;
    end else if (serialize) begin
      if (_T_8) begin
        if (_T_2) begin
          serializeIndex <= _T_13;
        end
      end
    end
    if (reset) begin
      microsecondCounter <= 2'h0;
    end else if (serialize) begin
      if (_T_8) begin
        microsecondCounter <= _T_10;
      end
    end
    if (reset) begin
      cycleCounter <= 4'h0;
    end else if (serialize) begin
      cycleCounter <= _T_7;
    end
    if (reset) begin
      serialize <= 1'h0;
    end else if (serialize) begin
      if (_T_8) begin
        if (_T_2) begin
          if (_T_14) begin
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
    end else begin
      serialize <= _GEN_0;
    end
  end
endmodule
module Deserializer(
  input   clock,
  input   reset,
  input   io_startDeserialization,
  input   io_pauseDeserialization,
  input   io_readData,
  output  io_inputData_0,
  output  io_inputData_1,
  output  io_inputData_2,
  output  io_inputData_3,
  output  io_inputData_4,
  output  io_inputData_5,
  output  io_inputData_6,
  output  io_inputData_7,
  output  io_inputData_8,
  output  io_inputData_9,
  output  io_inputData_10,
  output  io_inputData_11,
  output  io_inputData_12,
  output  io_inputData_13,
  output  io_inputData_14,
  output  io_inputData_15,
  output  io_inputData_16,
  output  io_inputData_17,
  output  io_inputData_18,
  output  io_inputData_19,
  output  io_inputData_20,
  output  io_inputData_21,
  output  io_inputData_22,
  output  io_inputData_23
);
  reg  dataBuffer_0; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_0;
  reg  dataBuffer_1; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_1;
  reg  dataBuffer_2; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_2;
  reg  dataBuffer_3; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_3;
  reg  dataBuffer_4; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_4;
  reg  dataBuffer_5; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_5;
  reg  dataBuffer_6; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_6;
  reg  dataBuffer_7; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_7;
  reg  dataBuffer_8; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_8;
  reg  dataBuffer_9; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_9;
  reg  dataBuffer_10; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_10;
  reg  dataBuffer_11; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_11;
  reg  dataBuffer_12; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_12;
  reg  dataBuffer_13; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_13;
  reg  dataBuffer_14; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_14;
  reg  dataBuffer_15; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_15;
  reg  dataBuffer_16; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_16;
  reg  dataBuffer_17; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_17;
  reg  dataBuffer_18; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_18;
  reg  dataBuffer_19; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_19;
  reg  dataBuffer_20; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_20;
  reg  dataBuffer_21; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_21;
  reg  dataBuffer_22; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_22;
  reg  dataBuffer_23; // @[Deserializer.scala 18:23]
  reg [31:0] _RAND_23;
  reg [1:0] microsecondCounter; // @[Deserializer.scala 21:35]
  reg [31:0] _RAND_24;
  reg [3:0] cycleCounter; // @[Deserializer.scala 22:29]
  reg [31:0] _RAND_25;
  reg  deserialize; // @[Deserializer.scala 23:28]
  reg [31:0] _RAND_26;
  wire  _T; // @[Deserializer.scala 25:20]
  wire  _GEN_0; // @[Deserializer.scala 25:24]
  wire  _GEN_1; // @[Deserializer.scala 25:24]
  wire  _GEN_2; // @[Deserializer.scala 25:24]
  wire  _GEN_3; // @[Deserializer.scala 25:24]
  wire  _GEN_4; // @[Deserializer.scala 25:24]
  wire  _GEN_5; // @[Deserializer.scala 25:24]
  wire  _GEN_6; // @[Deserializer.scala 25:24]
  wire  _GEN_7; // @[Deserializer.scala 25:24]
  wire  _GEN_8; // @[Deserializer.scala 25:24]
  wire  _GEN_9; // @[Deserializer.scala 25:24]
  wire  _GEN_10; // @[Deserializer.scala 25:24]
  wire  _GEN_11; // @[Deserializer.scala 25:24]
  wire  _GEN_12; // @[Deserializer.scala 25:24]
  wire  _GEN_13; // @[Deserializer.scala 25:24]
  wire  _GEN_14; // @[Deserializer.scala 25:24]
  wire  _GEN_15; // @[Deserializer.scala 25:24]
  wire  _GEN_16; // @[Deserializer.scala 25:24]
  wire  _GEN_17; // @[Deserializer.scala 25:24]
  wire  _GEN_18; // @[Deserializer.scala 25:24]
  wire  _GEN_19; // @[Deserializer.scala 25:24]
  wire  _GEN_20; // @[Deserializer.scala 25:24]
  wire  _GEN_21; // @[Deserializer.scala 25:24]
  wire  _GEN_22; // @[Deserializer.scala 25:24]
  wire  _GEN_23; // @[Deserializer.scala 25:24]
  reg  guessingPhase; // @[Deserializer.scala 29:30]
  reg [31:0] _RAND_27;
  reg [5:0] cyclesOfLow; // @[Deserializer.scala 30:28]
  reg [31:0] _RAND_28;
  reg [5:0] cyclesOfHigh; // @[Deserializer.scala 31:29]
  reg [31:0] _RAND_29;
  wire  _T_1; // @[Deserializer.scala 33:8]
  wire  _T_2; // @[Deserializer.scala 34:38]
  wire  _T_3; // @[Deserializer.scala 34:35]
  wire  _T_4; // @[Deserializer.scala 34:52]
  wire  _GEN_24; // @[Deserializer.scala 35:37]
  wire [5:0] _T_6; // @[Deserializer.scala 39:38]
  wire [5:0] _T_8; // @[Deserializer.scala 41:36]
  wire [5:0] _T_10; // @[Deserializer.scala 42:27]
  wire  _T_11; // @[Deserializer.scala 42:43]
  wire  _T_12; // @[Deserializer.scala 43:40]
  wire  _GEN_51; // @[Deserializer.scala 42:51]
  wire  _T_15; // @[Deserializer.scala 52:25]
  wire  _T_16; // @[Deserializer.scala 52:22]
  wire [3:0] _T_18; // @[Deserializer.scala 53:36]
  wire  _T_19; // @[Deserializer.scala 54:25]
  wire [1:0] _T_21; // @[Deserializer.scala 55:50]
  wire  _T_22; // @[Deserializer.scala 56:33]
  assign _T = $unsigned(reset); // @[Deserializer.scala 25:20]
  assign _GEN_0 = _T ? 1'h0 : dataBuffer_0; // @[Deserializer.scala 25:24]
  assign _GEN_1 = _T ? 1'h0 : dataBuffer_1; // @[Deserializer.scala 25:24]
  assign _GEN_2 = _T ? 1'h0 : dataBuffer_2; // @[Deserializer.scala 25:24]
  assign _GEN_3 = _T ? 1'h0 : dataBuffer_3; // @[Deserializer.scala 25:24]
  assign _GEN_4 = _T ? 1'h0 : dataBuffer_4; // @[Deserializer.scala 25:24]
  assign _GEN_5 = _T ? 1'h0 : dataBuffer_5; // @[Deserializer.scala 25:24]
  assign _GEN_6 = _T ? 1'h0 : dataBuffer_6; // @[Deserializer.scala 25:24]
  assign _GEN_7 = _T ? 1'h0 : dataBuffer_7; // @[Deserializer.scala 25:24]
  assign _GEN_8 = _T ? 1'h0 : dataBuffer_8; // @[Deserializer.scala 25:24]
  assign _GEN_9 = _T ? 1'h0 : dataBuffer_9; // @[Deserializer.scala 25:24]
  assign _GEN_10 = _T ? 1'h0 : dataBuffer_10; // @[Deserializer.scala 25:24]
  assign _GEN_11 = _T ? 1'h0 : dataBuffer_11; // @[Deserializer.scala 25:24]
  assign _GEN_12 = _T ? 1'h0 : dataBuffer_12; // @[Deserializer.scala 25:24]
  assign _GEN_13 = _T ? 1'h0 : dataBuffer_13; // @[Deserializer.scala 25:24]
  assign _GEN_14 = _T ? 1'h0 : dataBuffer_14; // @[Deserializer.scala 25:24]
  assign _GEN_15 = _T ? 1'h0 : dataBuffer_15; // @[Deserializer.scala 25:24]
  assign _GEN_16 = _T ? 1'h0 : dataBuffer_16; // @[Deserializer.scala 25:24]
  assign _GEN_17 = _T ? 1'h0 : dataBuffer_17; // @[Deserializer.scala 25:24]
  assign _GEN_18 = _T ? 1'h0 : dataBuffer_18; // @[Deserializer.scala 25:24]
  assign _GEN_19 = _T ? 1'h0 : dataBuffer_19; // @[Deserializer.scala 25:24]
  assign _GEN_20 = _T ? 1'h0 : dataBuffer_20; // @[Deserializer.scala 25:24]
  assign _GEN_21 = _T ? 1'h0 : dataBuffer_21; // @[Deserializer.scala 25:24]
  assign _GEN_22 = _T ? 1'h0 : dataBuffer_22; // @[Deserializer.scala 25:24]
  assign _GEN_23 = _T ? 1'h0 : dataBuffer_23; // @[Deserializer.scala 25:24]
  assign _T_1 = io_pauseDeserialization == 1'h0; // @[Deserializer.scala 33:8]
  assign _T_2 = deserialize == 1'h0; // @[Deserializer.scala 34:38]
  assign _T_3 = io_startDeserialization & _T_2; // @[Deserializer.scala 34:35]
  assign _T_4 = _T_3 | guessingPhase; // @[Deserializer.scala 34:52]
  assign _GEN_24 = io_startDeserialization | guessingPhase; // @[Deserializer.scala 35:37]
  assign _T_6 = cyclesOfHigh + 6'h1; // @[Deserializer.scala 39:38]
  assign _T_8 = cyclesOfLow + 6'h1; // @[Deserializer.scala 41:36]
  assign _T_10 = cyclesOfLow + cyclesOfHigh; // @[Deserializer.scala 42:27]
  assign _T_11 = _T_10 > 6'h38; // @[Deserializer.scala 42:43]
  assign _T_12 = cyclesOfHigh > cyclesOfLow; // @[Deserializer.scala 43:40]
  assign _GEN_51 = _T_11 | deserialize; // @[Deserializer.scala 42:51]
  assign _T_15 = guessingPhase == 1'h0; // @[Deserializer.scala 52:25]
  assign _T_16 = deserialize & _T_15; // @[Deserializer.scala 52:22]
  assign _T_18 = cycleCounter + 4'h1; // @[Deserializer.scala 53:36]
  assign _T_19 = cycleCounter == 4'h0; // @[Deserializer.scala 54:25]
  assign _T_21 = microsecondCounter + 2'h1; // @[Deserializer.scala 55:50]
  assign _T_22 = microsecondCounter == 2'h2; // @[Deserializer.scala 56:33]
  assign io_inputData_0 = dataBuffer_0; // @[Deserializer.scala 63:16]
  assign io_inputData_1 = dataBuffer_1; // @[Deserializer.scala 63:16]
  assign io_inputData_2 = dataBuffer_2; // @[Deserializer.scala 63:16]
  assign io_inputData_3 = dataBuffer_3; // @[Deserializer.scala 63:16]
  assign io_inputData_4 = dataBuffer_4; // @[Deserializer.scala 63:16]
  assign io_inputData_5 = dataBuffer_5; // @[Deserializer.scala 63:16]
  assign io_inputData_6 = dataBuffer_6; // @[Deserializer.scala 63:16]
  assign io_inputData_7 = dataBuffer_7; // @[Deserializer.scala 63:16]
  assign io_inputData_8 = dataBuffer_8; // @[Deserializer.scala 63:16]
  assign io_inputData_9 = dataBuffer_9; // @[Deserializer.scala 63:16]
  assign io_inputData_10 = dataBuffer_10; // @[Deserializer.scala 63:16]
  assign io_inputData_11 = dataBuffer_11; // @[Deserializer.scala 63:16]
  assign io_inputData_12 = dataBuffer_12; // @[Deserializer.scala 63:16]
  assign io_inputData_13 = dataBuffer_13; // @[Deserializer.scala 63:16]
  assign io_inputData_14 = dataBuffer_14; // @[Deserializer.scala 63:16]
  assign io_inputData_15 = dataBuffer_15; // @[Deserializer.scala 63:16]
  assign io_inputData_16 = dataBuffer_16; // @[Deserializer.scala 63:16]
  assign io_inputData_17 = dataBuffer_17; // @[Deserializer.scala 63:16]
  assign io_inputData_18 = dataBuffer_18; // @[Deserializer.scala 63:16]
  assign io_inputData_19 = dataBuffer_19; // @[Deserializer.scala 63:16]
  assign io_inputData_20 = dataBuffer_20; // @[Deserializer.scala 63:16]
  assign io_inputData_21 = dataBuffer_21; // @[Deserializer.scala 63:16]
  assign io_inputData_22 = dataBuffer_22; // @[Deserializer.scala 63:16]
  assign io_inputData_23 = dataBuffer_23; // @[Deserializer.scala 63:16]
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
  dataBuffer_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dataBuffer_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  dataBuffer_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  dataBuffer_3 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dataBuffer_4 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  dataBuffer_5 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  dataBuffer_6 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  dataBuffer_7 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  dataBuffer_8 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  dataBuffer_9 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  dataBuffer_10 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  dataBuffer_11 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  dataBuffer_12 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  dataBuffer_13 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  dataBuffer_14 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  dataBuffer_15 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  dataBuffer_16 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  dataBuffer_17 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  dataBuffer_18 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  dataBuffer_19 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  dataBuffer_20 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  dataBuffer_21 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  dataBuffer_22 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  dataBuffer_23 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  microsecondCounter = _RAND_24[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  cycleCounter = _RAND_25[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  deserialize = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  guessingPhase = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  cyclesOfLow = _RAND_28[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  cyclesOfHigh = _RAND_29[5:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_0 <= dataBuffer_1;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_0 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_0 <= dataBuffer_1;
            end else if (_T) begin
              dataBuffer_0 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_0 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_0 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_0 <= dataBuffer_1;
          end else begin
            dataBuffer_0 <= _GEN_0;
          end
        end else begin
          dataBuffer_0 <= _GEN_0;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_0 <= _GEN_0;
        end else if (_T_11) begin
          dataBuffer_0 <= dataBuffer_1;
        end else begin
          dataBuffer_0 <= _GEN_0;
        end
      end else begin
        dataBuffer_0 <= _GEN_0;
      end
    end else begin
      dataBuffer_0 <= _GEN_0;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_1 <= dataBuffer_2;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_1 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_1 <= dataBuffer_2;
            end else if (_T) begin
              dataBuffer_1 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_1 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_1 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_1 <= dataBuffer_2;
          end else begin
            dataBuffer_1 <= _GEN_1;
          end
        end else begin
          dataBuffer_1 <= _GEN_1;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_1 <= _GEN_1;
        end else if (_T_11) begin
          dataBuffer_1 <= dataBuffer_2;
        end else begin
          dataBuffer_1 <= _GEN_1;
        end
      end else begin
        dataBuffer_1 <= _GEN_1;
      end
    end else begin
      dataBuffer_1 <= _GEN_1;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_2 <= dataBuffer_3;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_2 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_2 <= dataBuffer_3;
            end else if (_T) begin
              dataBuffer_2 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_2 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_2 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_2 <= dataBuffer_3;
          end else begin
            dataBuffer_2 <= _GEN_2;
          end
        end else begin
          dataBuffer_2 <= _GEN_2;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_2 <= _GEN_2;
        end else if (_T_11) begin
          dataBuffer_2 <= dataBuffer_3;
        end else begin
          dataBuffer_2 <= _GEN_2;
        end
      end else begin
        dataBuffer_2 <= _GEN_2;
      end
    end else begin
      dataBuffer_2 <= _GEN_2;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_3 <= dataBuffer_4;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_3 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_3 <= dataBuffer_4;
            end else if (_T) begin
              dataBuffer_3 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_3 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_3 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_3 <= dataBuffer_4;
          end else begin
            dataBuffer_3 <= _GEN_3;
          end
        end else begin
          dataBuffer_3 <= _GEN_3;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_3 <= _GEN_3;
        end else if (_T_11) begin
          dataBuffer_3 <= dataBuffer_4;
        end else begin
          dataBuffer_3 <= _GEN_3;
        end
      end else begin
        dataBuffer_3 <= _GEN_3;
      end
    end else begin
      dataBuffer_3 <= _GEN_3;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_4 <= dataBuffer_5;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_4 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_4 <= dataBuffer_5;
            end else if (_T) begin
              dataBuffer_4 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_4 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_4 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_4 <= dataBuffer_5;
          end else begin
            dataBuffer_4 <= _GEN_4;
          end
        end else begin
          dataBuffer_4 <= _GEN_4;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_4 <= _GEN_4;
        end else if (_T_11) begin
          dataBuffer_4 <= dataBuffer_5;
        end else begin
          dataBuffer_4 <= _GEN_4;
        end
      end else begin
        dataBuffer_4 <= _GEN_4;
      end
    end else begin
      dataBuffer_4 <= _GEN_4;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_5 <= dataBuffer_6;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_5 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_5 <= dataBuffer_6;
            end else if (_T) begin
              dataBuffer_5 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_5 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_5 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_5 <= dataBuffer_6;
          end else begin
            dataBuffer_5 <= _GEN_5;
          end
        end else begin
          dataBuffer_5 <= _GEN_5;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_5 <= _GEN_5;
        end else if (_T_11) begin
          dataBuffer_5 <= dataBuffer_6;
        end else begin
          dataBuffer_5 <= _GEN_5;
        end
      end else begin
        dataBuffer_5 <= _GEN_5;
      end
    end else begin
      dataBuffer_5 <= _GEN_5;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_6 <= dataBuffer_7;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_6 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_6 <= dataBuffer_7;
            end else if (_T) begin
              dataBuffer_6 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_6 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_6 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_6 <= dataBuffer_7;
          end else begin
            dataBuffer_6 <= _GEN_6;
          end
        end else begin
          dataBuffer_6 <= _GEN_6;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_6 <= _GEN_6;
        end else if (_T_11) begin
          dataBuffer_6 <= dataBuffer_7;
        end else begin
          dataBuffer_6 <= _GEN_6;
        end
      end else begin
        dataBuffer_6 <= _GEN_6;
      end
    end else begin
      dataBuffer_6 <= _GEN_6;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_7 <= dataBuffer_8;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_7 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_7 <= dataBuffer_8;
            end else if (_T) begin
              dataBuffer_7 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_7 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_7 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_7 <= dataBuffer_8;
          end else begin
            dataBuffer_7 <= _GEN_7;
          end
        end else begin
          dataBuffer_7 <= _GEN_7;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_7 <= _GEN_7;
        end else if (_T_11) begin
          dataBuffer_7 <= dataBuffer_8;
        end else begin
          dataBuffer_7 <= _GEN_7;
        end
      end else begin
        dataBuffer_7 <= _GEN_7;
      end
    end else begin
      dataBuffer_7 <= _GEN_7;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_8 <= dataBuffer_9;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_8 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_8 <= dataBuffer_9;
            end else if (_T) begin
              dataBuffer_8 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_8 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_8 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_8 <= dataBuffer_9;
          end else begin
            dataBuffer_8 <= _GEN_8;
          end
        end else begin
          dataBuffer_8 <= _GEN_8;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_8 <= _GEN_8;
        end else if (_T_11) begin
          dataBuffer_8 <= dataBuffer_9;
        end else begin
          dataBuffer_8 <= _GEN_8;
        end
      end else begin
        dataBuffer_8 <= _GEN_8;
      end
    end else begin
      dataBuffer_8 <= _GEN_8;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_9 <= dataBuffer_10;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_9 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_9 <= dataBuffer_10;
            end else if (_T) begin
              dataBuffer_9 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_9 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_9 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_9 <= dataBuffer_10;
          end else begin
            dataBuffer_9 <= _GEN_9;
          end
        end else begin
          dataBuffer_9 <= _GEN_9;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_9 <= _GEN_9;
        end else if (_T_11) begin
          dataBuffer_9 <= dataBuffer_10;
        end else begin
          dataBuffer_9 <= _GEN_9;
        end
      end else begin
        dataBuffer_9 <= _GEN_9;
      end
    end else begin
      dataBuffer_9 <= _GEN_9;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_10 <= dataBuffer_11;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_10 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_10 <= dataBuffer_11;
            end else if (_T) begin
              dataBuffer_10 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_10 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_10 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_10 <= dataBuffer_11;
          end else begin
            dataBuffer_10 <= _GEN_10;
          end
        end else begin
          dataBuffer_10 <= _GEN_10;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_10 <= _GEN_10;
        end else if (_T_11) begin
          dataBuffer_10 <= dataBuffer_11;
        end else begin
          dataBuffer_10 <= _GEN_10;
        end
      end else begin
        dataBuffer_10 <= _GEN_10;
      end
    end else begin
      dataBuffer_10 <= _GEN_10;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_11 <= dataBuffer_12;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_11 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_11 <= dataBuffer_12;
            end else if (_T) begin
              dataBuffer_11 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_11 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_11 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_11 <= dataBuffer_12;
          end else begin
            dataBuffer_11 <= _GEN_11;
          end
        end else begin
          dataBuffer_11 <= _GEN_11;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_11 <= _GEN_11;
        end else if (_T_11) begin
          dataBuffer_11 <= dataBuffer_12;
        end else begin
          dataBuffer_11 <= _GEN_11;
        end
      end else begin
        dataBuffer_11 <= _GEN_11;
      end
    end else begin
      dataBuffer_11 <= _GEN_11;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_12 <= dataBuffer_13;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_12 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_12 <= dataBuffer_13;
            end else if (_T) begin
              dataBuffer_12 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_12 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_12 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_12 <= dataBuffer_13;
          end else begin
            dataBuffer_12 <= _GEN_12;
          end
        end else begin
          dataBuffer_12 <= _GEN_12;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_12 <= _GEN_12;
        end else if (_T_11) begin
          dataBuffer_12 <= dataBuffer_13;
        end else begin
          dataBuffer_12 <= _GEN_12;
        end
      end else begin
        dataBuffer_12 <= _GEN_12;
      end
    end else begin
      dataBuffer_12 <= _GEN_12;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_13 <= dataBuffer_14;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_13 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_13 <= dataBuffer_14;
            end else if (_T) begin
              dataBuffer_13 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_13 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_13 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_13 <= dataBuffer_14;
          end else begin
            dataBuffer_13 <= _GEN_13;
          end
        end else begin
          dataBuffer_13 <= _GEN_13;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_13 <= _GEN_13;
        end else if (_T_11) begin
          dataBuffer_13 <= dataBuffer_14;
        end else begin
          dataBuffer_13 <= _GEN_13;
        end
      end else begin
        dataBuffer_13 <= _GEN_13;
      end
    end else begin
      dataBuffer_13 <= _GEN_13;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_14 <= dataBuffer_15;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_14 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_14 <= dataBuffer_15;
            end else if (_T) begin
              dataBuffer_14 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_14 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_14 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_14 <= dataBuffer_15;
          end else begin
            dataBuffer_14 <= _GEN_14;
          end
        end else begin
          dataBuffer_14 <= _GEN_14;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_14 <= _GEN_14;
        end else if (_T_11) begin
          dataBuffer_14 <= dataBuffer_15;
        end else begin
          dataBuffer_14 <= _GEN_14;
        end
      end else begin
        dataBuffer_14 <= _GEN_14;
      end
    end else begin
      dataBuffer_14 <= _GEN_14;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_15 <= dataBuffer_16;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_15 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_15 <= dataBuffer_16;
            end else if (_T) begin
              dataBuffer_15 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_15 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_15 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_15 <= dataBuffer_16;
          end else begin
            dataBuffer_15 <= _GEN_15;
          end
        end else begin
          dataBuffer_15 <= _GEN_15;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_15 <= _GEN_15;
        end else if (_T_11) begin
          dataBuffer_15 <= dataBuffer_16;
        end else begin
          dataBuffer_15 <= _GEN_15;
        end
      end else begin
        dataBuffer_15 <= _GEN_15;
      end
    end else begin
      dataBuffer_15 <= _GEN_15;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_16 <= dataBuffer_17;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_16 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_16 <= dataBuffer_17;
            end else if (_T) begin
              dataBuffer_16 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_16 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_16 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_16 <= dataBuffer_17;
          end else begin
            dataBuffer_16 <= _GEN_16;
          end
        end else begin
          dataBuffer_16 <= _GEN_16;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_16 <= _GEN_16;
        end else if (_T_11) begin
          dataBuffer_16 <= dataBuffer_17;
        end else begin
          dataBuffer_16 <= _GEN_16;
        end
      end else begin
        dataBuffer_16 <= _GEN_16;
      end
    end else begin
      dataBuffer_16 <= _GEN_16;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_17 <= dataBuffer_18;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_17 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_17 <= dataBuffer_18;
            end else if (_T) begin
              dataBuffer_17 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_17 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_17 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_17 <= dataBuffer_18;
          end else begin
            dataBuffer_17 <= _GEN_17;
          end
        end else begin
          dataBuffer_17 <= _GEN_17;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_17 <= _GEN_17;
        end else if (_T_11) begin
          dataBuffer_17 <= dataBuffer_18;
        end else begin
          dataBuffer_17 <= _GEN_17;
        end
      end else begin
        dataBuffer_17 <= _GEN_17;
      end
    end else begin
      dataBuffer_17 <= _GEN_17;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_18 <= dataBuffer_19;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_18 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_18 <= dataBuffer_19;
            end else if (_T) begin
              dataBuffer_18 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_18 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_18 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_18 <= dataBuffer_19;
          end else begin
            dataBuffer_18 <= _GEN_18;
          end
        end else begin
          dataBuffer_18 <= _GEN_18;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_18 <= _GEN_18;
        end else if (_T_11) begin
          dataBuffer_18 <= dataBuffer_19;
        end else begin
          dataBuffer_18 <= _GEN_18;
        end
      end else begin
        dataBuffer_18 <= _GEN_18;
      end
    end else begin
      dataBuffer_18 <= _GEN_18;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_19 <= dataBuffer_20;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_19 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_19 <= dataBuffer_20;
            end else if (_T) begin
              dataBuffer_19 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_19 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_19 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_19 <= dataBuffer_20;
          end else begin
            dataBuffer_19 <= _GEN_19;
          end
        end else begin
          dataBuffer_19 <= _GEN_19;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_19 <= _GEN_19;
        end else if (_T_11) begin
          dataBuffer_19 <= dataBuffer_20;
        end else begin
          dataBuffer_19 <= _GEN_19;
        end
      end else begin
        dataBuffer_19 <= _GEN_19;
      end
    end else begin
      dataBuffer_19 <= _GEN_19;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_20 <= dataBuffer_21;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_20 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_20 <= dataBuffer_21;
            end else if (_T) begin
              dataBuffer_20 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_20 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_20 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_20 <= dataBuffer_21;
          end else begin
            dataBuffer_20 <= _GEN_20;
          end
        end else begin
          dataBuffer_20 <= _GEN_20;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_20 <= _GEN_20;
        end else if (_T_11) begin
          dataBuffer_20 <= dataBuffer_21;
        end else begin
          dataBuffer_20 <= _GEN_20;
        end
      end else begin
        dataBuffer_20 <= _GEN_20;
      end
    end else begin
      dataBuffer_20 <= _GEN_20;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_21 <= dataBuffer_22;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_21 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_21 <= dataBuffer_22;
            end else if (_T) begin
              dataBuffer_21 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_21 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_21 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_21 <= dataBuffer_22;
          end else begin
            dataBuffer_21 <= _GEN_21;
          end
        end else begin
          dataBuffer_21 <= _GEN_21;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_21 <= _GEN_21;
        end else if (_T_11) begin
          dataBuffer_21 <= dataBuffer_22;
        end else begin
          dataBuffer_21 <= _GEN_21;
        end
      end else begin
        dataBuffer_21 <= _GEN_21;
      end
    end else begin
      dataBuffer_21 <= _GEN_21;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_22 <= dataBuffer_23;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_22 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_22 <= dataBuffer_23;
            end else if (_T) begin
              dataBuffer_22 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_22 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_22 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_22 <= dataBuffer_23;
          end else begin
            dataBuffer_22 <= _GEN_22;
          end
        end else begin
          dataBuffer_22 <= _GEN_22;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_22 <= _GEN_22;
        end else if (_T_11) begin
          dataBuffer_22 <= dataBuffer_23;
        end else begin
          dataBuffer_22 <= _GEN_22;
        end
      end else begin
        dataBuffer_22 <= _GEN_22;
      end
    end else begin
      dataBuffer_22 <= _GEN_22;
    end
    if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          if (_T_22) begin
            dataBuffer_23 <= io_readData;
          end else if (_T_4) begin
            if (io_readData) begin
              if (_T) begin
                dataBuffer_23 <= 1'h0;
              end
            end else if (_T_11) begin
              dataBuffer_23 <= _T_12;
            end else if (_T) begin
              dataBuffer_23 <= 1'h0;
            end
          end else if (_T) begin
            dataBuffer_23 <= 1'h0;
          end
        end else if (_T_4) begin
          if (io_readData) begin
            if (_T) begin
              dataBuffer_23 <= 1'h0;
            end
          end else if (_T_11) begin
            dataBuffer_23 <= _T_12;
          end else begin
            dataBuffer_23 <= _GEN_23;
          end
        end else begin
          dataBuffer_23 <= _GEN_23;
        end
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_23 <= _GEN_23;
        end else if (_T_11) begin
          dataBuffer_23 <= _T_12;
        end else begin
          dataBuffer_23 <= _GEN_23;
        end
      end else begin
        dataBuffer_23 <= _GEN_23;
      end
    end else begin
      dataBuffer_23 <= _GEN_23;
    end
    if (reset) begin
      microsecondCounter <= 2'h0;
    end else if (_T_1) begin
      if (_T_16) begin
        if (_T_19) begin
          microsecondCounter <= _T_21;
        end else if (_T_4) begin
          if (!(io_readData)) begin
            if (_T_11) begin
              microsecondCounter <= 2'h0;
            end
          end
        end
      end else if (_T_4) begin
        if (!(io_readData)) begin
          if (_T_11) begin
            microsecondCounter <= 2'h0;
          end
        end
      end
    end
    if (reset) begin
      cycleCounter <= 4'h0;
    end else if (_T_1) begin
      if (_T_16) begin
        cycleCounter <= _T_18;
      end else if (_T_4) begin
        if (!(io_readData)) begin
          if (_T_11) begin
            cycleCounter <= 4'h0;
          end
        end
      end
    end
    if (reset) begin
      deserialize <= 1'h0;
    end else if (_T_1) begin
      if (_T_4) begin
        if (!(io_readData)) begin
          deserialize <= _GEN_51;
        end
      end
    end
    if (reset) begin
      guessingPhase <= 1'h0;
    end else if (_T_1) begin
      if (_T_4) begin
        if (io_readData) begin
          guessingPhase <= _GEN_24;
        end else if (_T_11) begin
          guessingPhase <= 1'h0;
        end else begin
          guessingPhase <= _GEN_24;
        end
      end
    end
    if (reset) begin
      cyclesOfLow <= 6'h0;
    end else if (_T_1) begin
      if (_T_4) begin
        if (!(io_readData)) begin
          cyclesOfLow <= _T_8;
        end
      end
    end
    if (reset) begin
      cyclesOfHigh <= 6'h0;
    end else if (_T_1) begin
      if (_T_4) begin
        if (io_readData) begin
          cyclesOfHigh <= _T_6;
        end
      end
    end
  end
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
  inout   io_data
);
  wire  controller_io_inButtonStart; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonY; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonX; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonB; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonA; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonL; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonR; // @[Bgec.scala 8:26]
  wire  controller_io_inButtonZ; // @[Bgec.scala 8:26]
  wire  controller_io_inDpadUp; // @[Bgec.scala 8:26]
  wire  controller_io_inDpadDown; // @[Bgec.scala 8:26]
  wire  controller_io_inDpadRight; // @[Bgec.scala 8:26]
  wire  controller_io_inDpadLeft; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inJoystickX; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inJoystickY; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inCstickX; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inCstickY; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inTriggerL; // @[Bgec.scala 8:26]
  wire [7:0] controller_io_inTriggerR; // @[Bgec.scala 8:26]
  wire [63:0] controller_io_outData; // @[Bgec.scala 8:26]
  wire  dataLine_write; // @[Bgec.scala 93:24]
  wire  dataLine_writeData; // @[Bgec.scala 93:24]
  wire  dataLine_readData; // @[Bgec.scala 93:24]
  wire  controllerDataSerializer_clock; // @[Bgec.scala 96:40]
  wire  controllerDataSerializer_reset; // @[Bgec.scala 96:40]
  wire  controllerDataSerializer_io_startSerialization; // @[Bgec.scala 96:40]
  wire [63:0] controllerDataSerializer_io_outputData; // @[Bgec.scala 96:40]
  wire  controllerDataSerializer_io_write; // @[Bgec.scala 96:40]
  wire  controllerDataSerializer_io_writeData; // @[Bgec.scala 96:40]
  wire  commandDeserializer_clock; // @[Bgec.scala 102:35]
  wire  commandDeserializer_reset; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_startDeserialization; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_pauseDeserialization; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_readData; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_0; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_1; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_2; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_3; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_4; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_5; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_6; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_7; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_8; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_9; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_10; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_11; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_12; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_13; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_14; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_15; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_16; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_17; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_18; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_19; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_20; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_21; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_22; // @[Bgec.scala 102:35]
  wire  commandDeserializer_io_inputData_23; // @[Bgec.scala 102:35]
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
  reg  toldToSerialize; // @[Bgec.scala 117:32]
  reg [31:0] _RAND_52;
  wire  _T_51; // @[Deserializer.scala 78:21]
  wire  _T_52; // @[Deserializer.scala 78:9]
  wire  _T_53; // @[Deserializer.scala 78:21]
  wire  _T_54; // @[Deserializer.scala 78:9]
  wire  _T_55; // @[Deserializer.scala 78:21]
  wire  _T_56; // @[Deserializer.scala 78:9]
  wire  _T_57; // @[Deserializer.scala 78:21]
  wire  _T_58; // @[Deserializer.scala 78:9]
  wire  _T_59; // @[Deserializer.scala 78:21]
  wire  _T_60; // @[Deserializer.scala 78:9]
  wire  _T_61; // @[Deserializer.scala 78:21]
  wire  _T_62; // @[Deserializer.scala 78:9]
  wire  _T_63; // @[Deserializer.scala 78:21]
  wire  _T_64; // @[Deserializer.scala 78:9]
  wire  _T_65; // @[Deserializer.scala 78:21]
  wire  _T_66; // @[Deserializer.scala 78:9]
  wire  _T_67; // @[Deserializer.scala 78:21]
  wire  _T_68; // @[Deserializer.scala 78:9]
  wire  _T_69; // @[Deserializer.scala 78:21]
  wire  _T_70; // @[Deserializer.scala 78:9]
  wire  _T_71; // @[Deserializer.scala 78:21]
  wire  _T_72; // @[Deserializer.scala 78:9]
  wire  _T_73; // @[Deserializer.scala 78:21]
  wire  _T_74; // @[Deserializer.scala 78:9]
  wire  _T_75; // @[Deserializer.scala 78:21]
  wire  _T_76; // @[Deserializer.scala 78:9]
  wire  _T_77; // @[Deserializer.scala 78:21]
  wire  _T_78; // @[Deserializer.scala 78:9]
  wire  _T_79; // @[Deserializer.scala 78:21]
  wire  _T_80; // @[Deserializer.scala 78:9]
  wire  _T_81; // @[Deserializer.scala 78:21]
  wire  _T_82; // @[Deserializer.scala 78:9]
  wire  _T_83; // @[Deserializer.scala 78:21]
  wire  _T_84; // @[Deserializer.scala 78:9]
  wire  _T_85; // @[Deserializer.scala 78:21]
  wire  _T_86; // @[Deserializer.scala 78:9]
  wire  _T_87; // @[Deserializer.scala 78:21]
  wire  _T_88; // @[Deserializer.scala 78:9]
  wire  _T_89; // @[Deserializer.scala 78:21]
  wire  _T_90; // @[Deserializer.scala 78:9]
  wire  _T_91; // @[Deserializer.scala 78:21]
  wire  _T_92; // @[Deserializer.scala 78:9]
  wire  _T_93; // @[Deserializer.scala 78:21]
  wire  _T_94; // @[Deserializer.scala 78:9]
  wire  _T_95; // @[Deserializer.scala 78:21]
  wire  _T_96; // @[Deserializer.scala 78:9]
  wire  _T_97; // @[Deserializer.scala 78:21]
  wire  _T_98; // @[Deserializer.scala 78:9]
  wire  _T_100; // @[Deserializer.scala 79:26]
  wire  _T_101; // @[Deserializer.scala 79:26]
  wire  _T_102; // @[Deserializer.scala 79:26]
  wire  _T_103; // @[Deserializer.scala 79:26]
  wire  _T_104; // @[Deserializer.scala 79:26]
  wire  _T_105; // @[Deserializer.scala 79:26]
  wire  _T_106; // @[Deserializer.scala 79:26]
  wire  _T_107; // @[Deserializer.scala 79:26]
  wire  _T_108; // @[Deserializer.scala 79:26]
  wire  _T_109; // @[Deserializer.scala 79:26]
  wire  _T_110; // @[Deserializer.scala 79:26]
  wire  _T_111; // @[Deserializer.scala 79:26]
  wire  _T_112; // @[Deserializer.scala 79:26]
  wire  _T_113; // @[Deserializer.scala 79:26]
  wire  _T_114; // @[Deserializer.scala 79:26]
  wire  _T_115; // @[Deserializer.scala 79:26]
  wire  _T_116; // @[Deserializer.scala 79:26]
  wire  _T_117; // @[Deserializer.scala 79:26]
  wire  _T_118; // @[Deserializer.scala 79:26]
  wire  _T_119; // @[Deserializer.scala 79:26]
  wire  _T_120; // @[Deserializer.scala 79:26]
  wire  _T_121; // @[Deserializer.scala 79:26]
  wire  _T_122; // @[Deserializer.scala 79:26]
  wire  _T_123; // @[Bgec.scala 120:55]
  Controller controller ( // @[Bgec.scala 8:26]
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
  DataLine dataLine ( // @[Bgec.scala 93:24]
    .line(io_data),
    .write(dataLine_write),
    .writeData(dataLine_writeData),
    .readData(dataLine_readData)
  );
  Serializer controllerDataSerializer ( // @[Bgec.scala 96:40]
    .clock(controllerDataSerializer_clock),
    .reset(controllerDataSerializer_reset),
    .io_startSerialization(controllerDataSerializer_io_startSerialization),
    .io_outputData(controllerDataSerializer_io_outputData),
    .io_write(controllerDataSerializer_io_write),
    .io_writeData(controllerDataSerializer_io_writeData)
  );
  Deserializer commandDeserializer ( // @[Bgec.scala 102:35]
    .clock(commandDeserializer_clock),
    .reset(commandDeserializer_reset),
    .io_startDeserialization(commandDeserializer_io_startDeserialization),
    .io_pauseDeserialization(commandDeserializer_io_pauseDeserialization),
    .io_readData(commandDeserializer_io_readData),
    .io_inputData_0(commandDeserializer_io_inputData_0),
    .io_inputData_1(commandDeserializer_io_inputData_1),
    .io_inputData_2(commandDeserializer_io_inputData_2),
    .io_inputData_3(commandDeserializer_io_inputData_3),
    .io_inputData_4(commandDeserializer_io_inputData_4),
    .io_inputData_5(commandDeserializer_io_inputData_5),
    .io_inputData_6(commandDeserializer_io_inputData_6),
    .io_inputData_7(commandDeserializer_io_inputData_7),
    .io_inputData_8(commandDeserializer_io_inputData_8),
    .io_inputData_9(commandDeserializer_io_inputData_9),
    .io_inputData_10(commandDeserializer_io_inputData_10),
    .io_inputData_11(commandDeserializer_io_inputData_11),
    .io_inputData_12(commandDeserializer_io_inputData_12),
    .io_inputData_13(commandDeserializer_io_inputData_13),
    .io_inputData_14(commandDeserializer_io_inputData_14),
    .io_inputData_15(commandDeserializer_io_inputData_15),
    .io_inputData_16(commandDeserializer_io_inputData_16),
    .io_inputData_17(commandDeserializer_io_inputData_17),
    .io_inputData_18(commandDeserializer_io_inputData_18),
    .io_inputData_19(commandDeserializer_io_inputData_19),
    .io_inputData_20(commandDeserializer_io_inputData_20),
    .io_inputData_21(commandDeserializer_io_inputData_21),
    .io_inputData_22(commandDeserializer_io_inputData_22),
    .io_inputData_23(commandDeserializer_io_inputData_23)
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
  assign _T_51 = commandDeserializer_io_inputData_0; // @[Deserializer.scala 78:21]
  assign _T_52 = _T_51 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_53 = commandDeserializer_io_inputData_1 ^ 1'h1; // @[Deserializer.scala 78:21]
  assign _T_54 = _T_53 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_55 = commandDeserializer_io_inputData_2; // @[Deserializer.scala 78:21]
  assign _T_56 = _T_55 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_57 = commandDeserializer_io_inputData_3; // @[Deserializer.scala 78:21]
  assign _T_58 = _T_57 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_59 = commandDeserializer_io_inputData_4; // @[Deserializer.scala 78:21]
  assign _T_60 = _T_59 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_61 = commandDeserializer_io_inputData_5; // @[Deserializer.scala 78:21]
  assign _T_62 = _T_61 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_63 = commandDeserializer_io_inputData_6; // @[Deserializer.scala 78:21]
  assign _T_64 = _T_63 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_65 = commandDeserializer_io_inputData_7; // @[Deserializer.scala 78:21]
  assign _T_66 = _T_65 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_67 = commandDeserializer_io_inputData_8; // @[Deserializer.scala 78:21]
  assign _T_68 = _T_67 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_69 = commandDeserializer_io_inputData_9; // @[Deserializer.scala 78:21]
  assign _T_70 = _T_69 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_71 = commandDeserializer_io_inputData_10; // @[Deserializer.scala 78:21]
  assign _T_72 = _T_71 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_73 = commandDeserializer_io_inputData_11; // @[Deserializer.scala 78:21]
  assign _T_74 = _T_73 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_75 = commandDeserializer_io_inputData_12; // @[Deserializer.scala 78:21]
  assign _T_76 = _T_75 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_77 = commandDeserializer_io_inputData_13; // @[Deserializer.scala 78:21]
  assign _T_78 = _T_77 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_79 = commandDeserializer_io_inputData_14 ^ 1'h1; // @[Deserializer.scala 78:21]
  assign _T_80 = _T_79 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_81 = commandDeserializer_io_inputData_15 ^ 1'h1; // @[Deserializer.scala 78:21]
  assign _T_82 = _T_81 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_83 = commandDeserializer_io_inputData_16; // @[Deserializer.scala 78:21]
  assign _T_84 = _T_83 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_85 = commandDeserializer_io_inputData_17; // @[Deserializer.scala 78:21]
  assign _T_86 = _T_85 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_87 = commandDeserializer_io_inputData_18; // @[Deserializer.scala 78:21]
  assign _T_88 = _T_87 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_89 = commandDeserializer_io_inputData_19; // @[Deserializer.scala 78:21]
  assign _T_90 = _T_89 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_91 = commandDeserializer_io_inputData_20; // @[Deserializer.scala 78:21]
  assign _T_92 = _T_91 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_93 = commandDeserializer_io_inputData_21; // @[Deserializer.scala 78:21]
  assign _T_94 = _T_93 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_95 = commandDeserializer_io_inputData_22 ^ 1'h1; // @[Deserializer.scala 78:21]
  assign _T_96 = _T_95 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_97 = commandDeserializer_io_inputData_23; // @[Deserializer.scala 78:21]
  assign _T_98 = _T_97 == 1'h0; // @[Deserializer.scala 78:9]
  assign _T_100 = _T_52 & _T_54; // @[Deserializer.scala 79:26]
  assign _T_101 = _T_100 & _T_56; // @[Deserializer.scala 79:26]
  assign _T_102 = _T_101 & _T_58; // @[Deserializer.scala 79:26]
  assign _T_103 = _T_102 & _T_60; // @[Deserializer.scala 79:26]
  assign _T_104 = _T_103 & _T_62; // @[Deserializer.scala 79:26]
  assign _T_105 = _T_104 & _T_64; // @[Deserializer.scala 79:26]
  assign _T_106 = _T_105 & _T_66; // @[Deserializer.scala 79:26]
  assign _T_107 = _T_106 & _T_68; // @[Deserializer.scala 79:26]
  assign _T_108 = _T_107 & _T_70; // @[Deserializer.scala 79:26]
  assign _T_109 = _T_108 & _T_72; // @[Deserializer.scala 79:26]
  assign _T_110 = _T_109 & _T_74; // @[Deserializer.scala 79:26]
  assign _T_111 = _T_110 & _T_76; // @[Deserializer.scala 79:26]
  assign _T_112 = _T_111 & _T_78; // @[Deserializer.scala 79:26]
  assign _T_113 = _T_112 & _T_80; // @[Deserializer.scala 79:26]
  assign _T_114 = _T_113 & _T_82; // @[Deserializer.scala 79:26]
  assign _T_115 = _T_114 & _T_84; // @[Deserializer.scala 79:26]
  assign _T_116 = _T_115 & _T_86; // @[Deserializer.scala 79:26]
  assign _T_117 = _T_116 & _T_88; // @[Deserializer.scala 79:26]
  assign _T_118 = _T_117 & _T_90; // @[Deserializer.scala 79:26]
  assign _T_119 = _T_118 & _T_92; // @[Deserializer.scala 79:26]
  assign _T_120 = _T_119 & _T_94; // @[Deserializer.scala 79:26]
  assign _T_121 = _T_120 & _T_96; // @[Deserializer.scala 79:26]
  assign _T_122 = _T_121 & _T_98; // @[Deserializer.scala 79:26]
  assign _T_123 = toldToSerialize == 1'h0; // @[Bgec.scala 120:55]
  assign io_adcClock = adcReady & clockParity; // @[Bgec.scala 62:17 Bgec.scala 65:17]
  assign io_adcConvert = adcReady ? 1'h0 : _T_4; // @[Bgec.scala 61:19 Bgec.scala 64:19]
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
  assign dataLine_write = controllerDataSerializer_io_write; // @[Bgec.scala 99:21]
  assign dataLine_writeData = controllerDataSerializer_io_writeData; // @[Bgec.scala 100:25]
  assign controllerDataSerializer_clock = clock;
  assign controllerDataSerializer_reset = reset;
  assign controllerDataSerializer_io_startSerialization = _T_122 & _T_123; // @[Bgec.scala 120:52 Bgec.scala 123:52]
  assign controllerDataSerializer_io_outputData = controller_io_outData; // @[Bgec.scala 97:42]
  assign commandDeserializer_clock = clock;
  assign commandDeserializer_reset = reset;
  assign commandDeserializer_io_startDeserialization = reset; // @[Bgec.scala 107:49 Bgec.scala 109:49]
  assign commandDeserializer_io_pauseDeserialization = controllerDataSerializer_io_write; // @[Bgec.scala 126:47]
  assign commandDeserializer_io_readData = dataLine_readData; // @[Bgec.scala 104:35]
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
  toldToSerialize = _RAND_52[0:0];
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
    if (reset) begin
      toldToSerialize <= 1'h0;
    end else begin
      toldToSerialize <= _T_122;
    end
  end
endmodule
