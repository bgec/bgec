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
  wire  _T_6; // @[Serializer.scala 39:23]
  wire  _T_8; // @[Serializer.scala 41:29]
  wire [5:0] _T_10; // @[Serializer.scala 44:42]
  wire [1:0] _T_12; // @[Serializer.scala 46:48]
  wire [3:0] _T_14; // @[Serializer.scala 48:34]
  assign _T = serialize == 1'h0; // @[Serializer.scala 26:33]
  assign _T_1 = io_startSerialization & _T; // @[Serializer.scala 26:30]
  assign _GEN_0 = _T_1 | serialize; // @[Serializer.scala 26:45]
  assign _T_2 = microsecondCounter == 2'h0; // @[Serializer.scala 32:29]
  assign _T_3 = microsecondCounter == 2'h3; // @[Serializer.scala 34:35]
  assign _T_4 = io_outputData >> serializeIndex; // @[Serializer.scala 37:36]
  assign _T_5 = _T_4[0]; // @[Serializer.scala 37:36]
  assign _GEN_1 = _T_3 | _T_5; // @[Serializer.scala 34:44]
  assign _GEN_2 = _T_2 ? 1'h0 : _GEN_1; // @[Serializer.scala 32:38]
  assign _T_6 = cycleCounter == 4'hf; // @[Serializer.scala 39:23]
  assign _T_8 = serializeIndex >= 6'h3f; // @[Serializer.scala 41:29]
  assign _T_10 = serializeIndex + 6'h1; // @[Serializer.scala 44:42]
  assign _T_12 = microsecondCounter + 2'h1; // @[Serializer.scala 46:48]
  assign _T_14 = cycleCounter + 4'h1; // @[Serializer.scala 48:34]
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
      if (_T_6) begin
        if (_T_3) begin
          serializeIndex <= _T_10;
        end
      end
    end
    if (reset) begin
      microsecondCounter <= 2'h0;
    end else if (serialize) begin
      if (_T_6) begin
        microsecondCounter <= _T_12;
      end
    end
    if (reset) begin
      cycleCounter <= 4'h0;
    end else if (serialize) begin
      cycleCounter <= _T_14;
    end
    if (reset) begin
      serialize <= 1'h0;
    end else if (serialize) begin
      if (_T_6) begin
        if (_T_3) begin
          if (_T_8) begin
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
  input         clock,
  input         reset,
  input         io_startDeserialization,
  input         io_pauseDeserialization,
  input         io_readData,
  output        io_inputData_0,
  output        io_inputData_1,
  output        io_inputData_2,
  output        io_inputData_3,
  output        io_inputData_4,
  output        io_inputData_5,
  output        io_inputData_6,
  output        io_inputData_7,
  output        io_inputData_8,
  output        io_inputData_9,
  output        io_inputData_10,
  output        io_inputData_11,
  output        io_inputData_12,
  output        io_inputData_13,
  output        io_inputData_14,
  output        io_inputData_15,
  output        io_inputData_16,
  output        io_inputData_17,
  output        io_inputData_18,
  output        io_inputData_19,
  output        io_inputData_20,
  output        io_inputData_21,
  output        io_inputData_22,
  output        io_inputData_23,
  output [23:0] io_bitsRead
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
  reg [23:0] bitsReadReg; // @[Deserializer.scala 19:24]
  reg [31:0] _RAND_24;
  reg [1:0] microsecondCounter; // @[Deserializer.scala 21:35]
  reg [31:0] _RAND_25;
  reg [3:0] cycleCounter; // @[Deserializer.scala 22:29]
  reg [31:0] _RAND_26;
  reg  deserialize; // @[Deserializer.scala 23:28]
  reg [31:0] _RAND_27;
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
  reg [31:0] _RAND_28;
  reg [5:0] cyclesOfLow; // @[Deserializer.scala 30:28]
  reg [31:0] _RAND_29;
  reg [5:0] cyclesOfHigh; // @[Deserializer.scala 31:29]
  reg [31:0] _RAND_30;
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
  wire [4:0] _T_13;
  wire [23:0] _T_15; // @[Deserializer.scala 68:32]
  wire  _GEN_75; // @[Deserializer.scala 42:51]
  wire  _T_16; // @[Deserializer.scala 52:25]
  wire  _T_17; // @[Deserializer.scala 52:22]
  wire  _T_18; // @[Deserializer.scala 53:25]
  wire  _T_19; // @[Deserializer.scala 54:33]
  wire [1:0] _T_24; // @[Deserializer.scala 57:50]
  wire [3:0] _T_26; // @[Deserializer.scala 59:36]
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
  assign _T_13 = bitsReadReg[4:0];
  assign _T_15 = bitsReadReg + 24'h1; // @[Deserializer.scala 68:32]
  assign _GEN_75 = _T_11 | deserialize; // @[Deserializer.scala 42:51]
  assign _T_16 = guessingPhase == 1'h0; // @[Deserializer.scala 52:25]
  assign _T_17 = deserialize & _T_16; // @[Deserializer.scala 52:22]
  assign _T_18 = cycleCounter == 4'h3; // @[Deserializer.scala 53:25]
  assign _T_19 = microsecondCounter == 2'h2; // @[Deserializer.scala 54:33]
  assign _T_24 = microsecondCounter + 2'h1; // @[Deserializer.scala 57:50]
  assign _T_26 = cycleCounter + 4'h1; // @[Deserializer.scala 59:36]
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
  assign io_bitsRead = bitsReadReg; // @[Deserializer.scala 64:15]
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
  bitsReadReg = _RAND_24[23:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  microsecondCounter = _RAND_25[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  cycleCounter = _RAND_26[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  deserialize = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  guessingPhase = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  cyclesOfLow = _RAND_29[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  cyclesOfHigh = _RAND_30[5:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T_1) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h0 == _T_13) begin
              dataBuffer_0 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_0 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h0 == _T_13) begin
                  dataBuffer_0 <= _T_12;
                end else if (_T) begin
                  dataBuffer_0 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_0 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_0 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_0 <= _GEN_0;
            end else if (_T_11) begin
              if (5'h0 == _T_13) begin
                dataBuffer_0 <= _T_12;
              end else begin
                dataBuffer_0 <= _GEN_0;
              end
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
            if (5'h0 == _T_13) begin
              dataBuffer_0 <= _T_12;
            end else begin
              dataBuffer_0 <= _GEN_0;
            end
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
          if (5'h0 == _T_13) begin
            dataBuffer_0 <= _T_12;
          end else begin
            dataBuffer_0 <= _GEN_0;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h1 == _T_13) begin
              dataBuffer_1 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_1 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h1 == _T_13) begin
                  dataBuffer_1 <= _T_12;
                end else if (_T) begin
                  dataBuffer_1 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_1 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_1 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_1 <= _GEN_1;
            end else if (_T_11) begin
              if (5'h1 == _T_13) begin
                dataBuffer_1 <= _T_12;
              end else begin
                dataBuffer_1 <= _GEN_1;
              end
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
            if (5'h1 == _T_13) begin
              dataBuffer_1 <= _T_12;
            end else begin
              dataBuffer_1 <= _GEN_1;
            end
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
          if (5'h1 == _T_13) begin
            dataBuffer_1 <= _T_12;
          end else begin
            dataBuffer_1 <= _GEN_1;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h2 == _T_13) begin
              dataBuffer_2 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_2 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h2 == _T_13) begin
                  dataBuffer_2 <= _T_12;
                end else if (_T) begin
                  dataBuffer_2 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_2 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_2 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_2 <= _GEN_2;
            end else if (_T_11) begin
              if (5'h2 == _T_13) begin
                dataBuffer_2 <= _T_12;
              end else begin
                dataBuffer_2 <= _GEN_2;
              end
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
            if (5'h2 == _T_13) begin
              dataBuffer_2 <= _T_12;
            end else begin
              dataBuffer_2 <= _GEN_2;
            end
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
          if (5'h2 == _T_13) begin
            dataBuffer_2 <= _T_12;
          end else begin
            dataBuffer_2 <= _GEN_2;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h3 == _T_13) begin
              dataBuffer_3 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_3 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h3 == _T_13) begin
                  dataBuffer_3 <= _T_12;
                end else if (_T) begin
                  dataBuffer_3 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_3 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_3 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_3 <= _GEN_3;
            end else if (_T_11) begin
              if (5'h3 == _T_13) begin
                dataBuffer_3 <= _T_12;
              end else begin
                dataBuffer_3 <= _GEN_3;
              end
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
            if (5'h3 == _T_13) begin
              dataBuffer_3 <= _T_12;
            end else begin
              dataBuffer_3 <= _GEN_3;
            end
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
          if (5'h3 == _T_13) begin
            dataBuffer_3 <= _T_12;
          end else begin
            dataBuffer_3 <= _GEN_3;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h4 == _T_13) begin
              dataBuffer_4 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_4 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h4 == _T_13) begin
                  dataBuffer_4 <= _T_12;
                end else if (_T) begin
                  dataBuffer_4 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_4 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_4 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_4 <= _GEN_4;
            end else if (_T_11) begin
              if (5'h4 == _T_13) begin
                dataBuffer_4 <= _T_12;
              end else begin
                dataBuffer_4 <= _GEN_4;
              end
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
            if (5'h4 == _T_13) begin
              dataBuffer_4 <= _T_12;
            end else begin
              dataBuffer_4 <= _GEN_4;
            end
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
          if (5'h4 == _T_13) begin
            dataBuffer_4 <= _T_12;
          end else begin
            dataBuffer_4 <= _GEN_4;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h5 == _T_13) begin
              dataBuffer_5 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_5 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h5 == _T_13) begin
                  dataBuffer_5 <= _T_12;
                end else if (_T) begin
                  dataBuffer_5 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_5 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_5 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_5 <= _GEN_5;
            end else if (_T_11) begin
              if (5'h5 == _T_13) begin
                dataBuffer_5 <= _T_12;
              end else begin
                dataBuffer_5 <= _GEN_5;
              end
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
            if (5'h5 == _T_13) begin
              dataBuffer_5 <= _T_12;
            end else begin
              dataBuffer_5 <= _GEN_5;
            end
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
          if (5'h5 == _T_13) begin
            dataBuffer_5 <= _T_12;
          end else begin
            dataBuffer_5 <= _GEN_5;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h6 == _T_13) begin
              dataBuffer_6 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_6 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h6 == _T_13) begin
                  dataBuffer_6 <= _T_12;
                end else if (_T) begin
                  dataBuffer_6 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_6 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_6 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_6 <= _GEN_6;
            end else if (_T_11) begin
              if (5'h6 == _T_13) begin
                dataBuffer_6 <= _T_12;
              end else begin
                dataBuffer_6 <= _GEN_6;
              end
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
            if (5'h6 == _T_13) begin
              dataBuffer_6 <= _T_12;
            end else begin
              dataBuffer_6 <= _GEN_6;
            end
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
          if (5'h6 == _T_13) begin
            dataBuffer_6 <= _T_12;
          end else begin
            dataBuffer_6 <= _GEN_6;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h7 == _T_13) begin
              dataBuffer_7 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_7 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h7 == _T_13) begin
                  dataBuffer_7 <= _T_12;
                end else if (_T) begin
                  dataBuffer_7 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_7 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_7 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_7 <= _GEN_7;
            end else if (_T_11) begin
              if (5'h7 == _T_13) begin
                dataBuffer_7 <= _T_12;
              end else begin
                dataBuffer_7 <= _GEN_7;
              end
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
            if (5'h7 == _T_13) begin
              dataBuffer_7 <= _T_12;
            end else begin
              dataBuffer_7 <= _GEN_7;
            end
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
          if (5'h7 == _T_13) begin
            dataBuffer_7 <= _T_12;
          end else begin
            dataBuffer_7 <= _GEN_7;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h8 == _T_13) begin
              dataBuffer_8 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_8 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h8 == _T_13) begin
                  dataBuffer_8 <= _T_12;
                end else if (_T) begin
                  dataBuffer_8 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_8 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_8 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_8 <= _GEN_8;
            end else if (_T_11) begin
              if (5'h8 == _T_13) begin
                dataBuffer_8 <= _T_12;
              end else begin
                dataBuffer_8 <= _GEN_8;
              end
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
            if (5'h8 == _T_13) begin
              dataBuffer_8 <= _T_12;
            end else begin
              dataBuffer_8 <= _GEN_8;
            end
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
          if (5'h8 == _T_13) begin
            dataBuffer_8 <= _T_12;
          end else begin
            dataBuffer_8 <= _GEN_8;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h9 == _T_13) begin
              dataBuffer_9 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_9 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h9 == _T_13) begin
                  dataBuffer_9 <= _T_12;
                end else if (_T) begin
                  dataBuffer_9 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_9 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_9 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_9 <= _GEN_9;
            end else if (_T_11) begin
              if (5'h9 == _T_13) begin
                dataBuffer_9 <= _T_12;
              end else begin
                dataBuffer_9 <= _GEN_9;
              end
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
            if (5'h9 == _T_13) begin
              dataBuffer_9 <= _T_12;
            end else begin
              dataBuffer_9 <= _GEN_9;
            end
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
          if (5'h9 == _T_13) begin
            dataBuffer_9 <= _T_12;
          end else begin
            dataBuffer_9 <= _GEN_9;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'ha == _T_13) begin
              dataBuffer_10 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_10 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'ha == _T_13) begin
                  dataBuffer_10 <= _T_12;
                end else if (_T) begin
                  dataBuffer_10 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_10 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_10 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_10 <= _GEN_10;
            end else if (_T_11) begin
              if (5'ha == _T_13) begin
                dataBuffer_10 <= _T_12;
              end else begin
                dataBuffer_10 <= _GEN_10;
              end
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
            if (5'ha == _T_13) begin
              dataBuffer_10 <= _T_12;
            end else begin
              dataBuffer_10 <= _GEN_10;
            end
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
          if (5'ha == _T_13) begin
            dataBuffer_10 <= _T_12;
          end else begin
            dataBuffer_10 <= _GEN_10;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hb == _T_13) begin
              dataBuffer_11 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_11 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hb == _T_13) begin
                  dataBuffer_11 <= _T_12;
                end else if (_T) begin
                  dataBuffer_11 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_11 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_11 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_11 <= _GEN_11;
            end else if (_T_11) begin
              if (5'hb == _T_13) begin
                dataBuffer_11 <= _T_12;
              end else begin
                dataBuffer_11 <= _GEN_11;
              end
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
            if (5'hb == _T_13) begin
              dataBuffer_11 <= _T_12;
            end else begin
              dataBuffer_11 <= _GEN_11;
            end
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
          if (5'hb == _T_13) begin
            dataBuffer_11 <= _T_12;
          end else begin
            dataBuffer_11 <= _GEN_11;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hc == _T_13) begin
              dataBuffer_12 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_12 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hc == _T_13) begin
                  dataBuffer_12 <= _T_12;
                end else if (_T) begin
                  dataBuffer_12 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_12 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_12 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_12 <= _GEN_12;
            end else if (_T_11) begin
              if (5'hc == _T_13) begin
                dataBuffer_12 <= _T_12;
              end else begin
                dataBuffer_12 <= _GEN_12;
              end
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
            if (5'hc == _T_13) begin
              dataBuffer_12 <= _T_12;
            end else begin
              dataBuffer_12 <= _GEN_12;
            end
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
          if (5'hc == _T_13) begin
            dataBuffer_12 <= _T_12;
          end else begin
            dataBuffer_12 <= _GEN_12;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hd == _T_13) begin
              dataBuffer_13 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_13 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hd == _T_13) begin
                  dataBuffer_13 <= _T_12;
                end else if (_T) begin
                  dataBuffer_13 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_13 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_13 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_13 <= _GEN_13;
            end else if (_T_11) begin
              if (5'hd == _T_13) begin
                dataBuffer_13 <= _T_12;
              end else begin
                dataBuffer_13 <= _GEN_13;
              end
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
            if (5'hd == _T_13) begin
              dataBuffer_13 <= _T_12;
            end else begin
              dataBuffer_13 <= _GEN_13;
            end
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
          if (5'hd == _T_13) begin
            dataBuffer_13 <= _T_12;
          end else begin
            dataBuffer_13 <= _GEN_13;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'he == _T_13) begin
              dataBuffer_14 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_14 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'he == _T_13) begin
                  dataBuffer_14 <= _T_12;
                end else if (_T) begin
                  dataBuffer_14 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_14 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_14 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_14 <= _GEN_14;
            end else if (_T_11) begin
              if (5'he == _T_13) begin
                dataBuffer_14 <= _T_12;
              end else begin
                dataBuffer_14 <= _GEN_14;
              end
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
            if (5'he == _T_13) begin
              dataBuffer_14 <= _T_12;
            end else begin
              dataBuffer_14 <= _GEN_14;
            end
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
          if (5'he == _T_13) begin
            dataBuffer_14 <= _T_12;
          end else begin
            dataBuffer_14 <= _GEN_14;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hf == _T_13) begin
              dataBuffer_15 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_15 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hf == _T_13) begin
                  dataBuffer_15 <= _T_12;
                end else if (_T) begin
                  dataBuffer_15 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_15 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_15 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_15 <= _GEN_15;
            end else if (_T_11) begin
              if (5'hf == _T_13) begin
                dataBuffer_15 <= _T_12;
              end else begin
                dataBuffer_15 <= _GEN_15;
              end
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
            if (5'hf == _T_13) begin
              dataBuffer_15 <= _T_12;
            end else begin
              dataBuffer_15 <= _GEN_15;
            end
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
          if (5'hf == _T_13) begin
            dataBuffer_15 <= _T_12;
          end else begin
            dataBuffer_15 <= _GEN_15;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h10 == _T_13) begin
              dataBuffer_16 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_16 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h10 == _T_13) begin
                  dataBuffer_16 <= _T_12;
                end else if (_T) begin
                  dataBuffer_16 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_16 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_16 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_16 <= _GEN_16;
            end else if (_T_11) begin
              if (5'h10 == _T_13) begin
                dataBuffer_16 <= _T_12;
              end else begin
                dataBuffer_16 <= _GEN_16;
              end
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
            if (5'h10 == _T_13) begin
              dataBuffer_16 <= _T_12;
            end else begin
              dataBuffer_16 <= _GEN_16;
            end
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
          if (5'h10 == _T_13) begin
            dataBuffer_16 <= _T_12;
          end else begin
            dataBuffer_16 <= _GEN_16;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h11 == _T_13) begin
              dataBuffer_17 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_17 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h11 == _T_13) begin
                  dataBuffer_17 <= _T_12;
                end else if (_T) begin
                  dataBuffer_17 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_17 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_17 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_17 <= _GEN_17;
            end else if (_T_11) begin
              if (5'h11 == _T_13) begin
                dataBuffer_17 <= _T_12;
              end else begin
                dataBuffer_17 <= _GEN_17;
              end
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
            if (5'h11 == _T_13) begin
              dataBuffer_17 <= _T_12;
            end else begin
              dataBuffer_17 <= _GEN_17;
            end
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
          if (5'h11 == _T_13) begin
            dataBuffer_17 <= _T_12;
          end else begin
            dataBuffer_17 <= _GEN_17;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h12 == _T_13) begin
              dataBuffer_18 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_18 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h12 == _T_13) begin
                  dataBuffer_18 <= _T_12;
                end else if (_T) begin
                  dataBuffer_18 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_18 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_18 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_18 <= _GEN_18;
            end else if (_T_11) begin
              if (5'h12 == _T_13) begin
                dataBuffer_18 <= _T_12;
              end else begin
                dataBuffer_18 <= _GEN_18;
              end
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
            if (5'h12 == _T_13) begin
              dataBuffer_18 <= _T_12;
            end else begin
              dataBuffer_18 <= _GEN_18;
            end
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
          if (5'h12 == _T_13) begin
            dataBuffer_18 <= _T_12;
          end else begin
            dataBuffer_18 <= _GEN_18;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h13 == _T_13) begin
              dataBuffer_19 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_19 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h13 == _T_13) begin
                  dataBuffer_19 <= _T_12;
                end else if (_T) begin
                  dataBuffer_19 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_19 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_19 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_19 <= _GEN_19;
            end else if (_T_11) begin
              if (5'h13 == _T_13) begin
                dataBuffer_19 <= _T_12;
              end else begin
                dataBuffer_19 <= _GEN_19;
              end
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
            if (5'h13 == _T_13) begin
              dataBuffer_19 <= _T_12;
            end else begin
              dataBuffer_19 <= _GEN_19;
            end
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
          if (5'h13 == _T_13) begin
            dataBuffer_19 <= _T_12;
          end else begin
            dataBuffer_19 <= _GEN_19;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h14 == _T_13) begin
              dataBuffer_20 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_20 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h14 == _T_13) begin
                  dataBuffer_20 <= _T_12;
                end else if (_T) begin
                  dataBuffer_20 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_20 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_20 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_20 <= _GEN_20;
            end else if (_T_11) begin
              if (5'h14 == _T_13) begin
                dataBuffer_20 <= _T_12;
              end else begin
                dataBuffer_20 <= _GEN_20;
              end
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
            if (5'h14 == _T_13) begin
              dataBuffer_20 <= _T_12;
            end else begin
              dataBuffer_20 <= _GEN_20;
            end
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
          if (5'h14 == _T_13) begin
            dataBuffer_20 <= _T_12;
          end else begin
            dataBuffer_20 <= _GEN_20;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h15 == _T_13) begin
              dataBuffer_21 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_21 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h15 == _T_13) begin
                  dataBuffer_21 <= _T_12;
                end else if (_T) begin
                  dataBuffer_21 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_21 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_21 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_21 <= _GEN_21;
            end else if (_T_11) begin
              if (5'h15 == _T_13) begin
                dataBuffer_21 <= _T_12;
              end else begin
                dataBuffer_21 <= _GEN_21;
              end
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
            if (5'h15 == _T_13) begin
              dataBuffer_21 <= _T_12;
            end else begin
              dataBuffer_21 <= _GEN_21;
            end
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
          if (5'h15 == _T_13) begin
            dataBuffer_21 <= _T_12;
          end else begin
            dataBuffer_21 <= _GEN_21;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h16 == _T_13) begin
              dataBuffer_22 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_22 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h16 == _T_13) begin
                  dataBuffer_22 <= _T_12;
                end else if (_T) begin
                  dataBuffer_22 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_22 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_22 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_22 <= _GEN_22;
            end else if (_T_11) begin
              if (5'h16 == _T_13) begin
                dataBuffer_22 <= _T_12;
              end else begin
                dataBuffer_22 <= _GEN_22;
              end
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
            if (5'h16 == _T_13) begin
              dataBuffer_22 <= _T_12;
            end else begin
              dataBuffer_22 <= _GEN_22;
            end
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
          if (5'h16 == _T_13) begin
            dataBuffer_22 <= _T_12;
          end else begin
            dataBuffer_22 <= _GEN_22;
          end
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
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h17 == _T_13) begin
              dataBuffer_23 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (_T) begin
                  dataBuffer_23 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h17 == _T_13) begin
                  dataBuffer_23 <= _T_12;
                end else if (_T) begin
                  dataBuffer_23 <= 1'h0;
                end
              end else if (_T) begin
                dataBuffer_23 <= 1'h0;
              end
            end else if (_T) begin
              dataBuffer_23 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_23 <= _GEN_23;
            end else if (_T_11) begin
              if (5'h17 == _T_13) begin
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
        end else if (_T_4) begin
          if (io_readData) begin
            dataBuffer_23 <= _GEN_23;
          end else if (_T_11) begin
            if (5'h17 == _T_13) begin
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
      end else if (_T_4) begin
        if (io_readData) begin
          dataBuffer_23 <= _GEN_23;
        end else if (_T_11) begin
          if (5'h17 == _T_13) begin
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
    end else begin
      dataBuffer_23 <= _GEN_23;
    end
    if (_T_1) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            bitsReadReg <= _T_15;
          end else if (_T_4) begin
            if (!(io_readData)) begin
              if (_T_11) begin
                bitsReadReg <= _T_15;
              end
            end
          end
        end else if (_T_4) begin
          if (!(io_readData)) begin
            if (_T_11) begin
              bitsReadReg <= _T_15;
            end
          end
        end
      end else if (_T_4) begin
        if (!(io_readData)) begin
          if (_T_11) begin
            bitsReadReg <= _T_15;
          end
        end
      end
    end
    if (reset) begin
      microsecondCounter <= 2'h0;
    end else if (_T_1) begin
      if (_T_17) begin
        if (_T_18) begin
          microsecondCounter <= _T_24;
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
      if (_T_17) begin
        cycleCounter <= _T_26;
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
          deserialize <= _GEN_75;
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
  wire [23:0] commandDeserializer_io_bitsRead; // @[Bgec.scala 102:35]
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
  wire [4:0] _T_52; // @[Deserializer.scala 74:47]
  wire [5:0] _T_53; // @[Deserializer.scala 74:65]
  wire [4:0] _T_54; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_735; // @[Deserializer.scala 74:72]
  wire [23:0] _T_56; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_0; // @[Deserializer.scala 74:87]
  wire [4:0] _T_57; // @[Deserializer.scala 74:87]
  wire  _GEN_157; // @[Deserializer.scala 75:21]
  wire  _GEN_158; // @[Deserializer.scala 75:21]
  wire  _GEN_159; // @[Deserializer.scala 75:21]
  wire  _GEN_160; // @[Deserializer.scala 75:21]
  wire  _GEN_161; // @[Deserializer.scala 75:21]
  wire  _GEN_162; // @[Deserializer.scala 75:21]
  wire  _GEN_163; // @[Deserializer.scala 75:21]
  wire  _GEN_164; // @[Deserializer.scala 75:21]
  wire  _GEN_165; // @[Deserializer.scala 75:21]
  wire  _GEN_166; // @[Deserializer.scala 75:21]
  wire  _GEN_167; // @[Deserializer.scala 75:21]
  wire  _GEN_168; // @[Deserializer.scala 75:21]
  wire  _GEN_169; // @[Deserializer.scala 75:21]
  wire  _GEN_170; // @[Deserializer.scala 75:21]
  wire  _GEN_171; // @[Deserializer.scala 75:21]
  wire  _GEN_172; // @[Deserializer.scala 75:21]
  wire  _GEN_173; // @[Deserializer.scala 75:21]
  wire  _GEN_174; // @[Deserializer.scala 75:21]
  wire  _GEN_175; // @[Deserializer.scala 75:21]
  wire  _GEN_176; // @[Deserializer.scala 75:21]
  wire  _GEN_177; // @[Deserializer.scala 75:21]
  wire  _GEN_178; // @[Deserializer.scala 75:21]
  wire  _GEN_179; // @[Deserializer.scala 75:21]
  wire  _GEN_180; // @[Deserializer.scala 75:21]
  wire  _T_60; // @[Deserializer.scala 75:9]
  wire [4:0] _T_64; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_736; // @[Deserializer.scala 74:72]
  wire [23:0] _T_66; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_1; // @[Deserializer.scala 74:87]
  wire [4:0] _T_67; // @[Deserializer.scala 74:87]
  wire  _GEN_182; // @[Deserializer.scala 75:21]
  wire  _GEN_183; // @[Deserializer.scala 75:21]
  wire  _GEN_184; // @[Deserializer.scala 75:21]
  wire  _GEN_185; // @[Deserializer.scala 75:21]
  wire  _GEN_186; // @[Deserializer.scala 75:21]
  wire  _GEN_187; // @[Deserializer.scala 75:21]
  wire  _GEN_188; // @[Deserializer.scala 75:21]
  wire  _GEN_189; // @[Deserializer.scala 75:21]
  wire  _GEN_190; // @[Deserializer.scala 75:21]
  wire  _GEN_191; // @[Deserializer.scala 75:21]
  wire  _GEN_192; // @[Deserializer.scala 75:21]
  wire  _GEN_193; // @[Deserializer.scala 75:21]
  wire  _GEN_194; // @[Deserializer.scala 75:21]
  wire  _GEN_195; // @[Deserializer.scala 75:21]
  wire  _GEN_196; // @[Deserializer.scala 75:21]
  wire  _GEN_197; // @[Deserializer.scala 75:21]
  wire  _GEN_198; // @[Deserializer.scala 75:21]
  wire  _GEN_199; // @[Deserializer.scala 75:21]
  wire  _GEN_200; // @[Deserializer.scala 75:21]
  wire  _GEN_201; // @[Deserializer.scala 75:21]
  wire  _GEN_202; // @[Deserializer.scala 75:21]
  wire  _GEN_203; // @[Deserializer.scala 75:21]
  wire  _GEN_204; // @[Deserializer.scala 75:21]
  wire  _T_69; // @[Deserializer.scala 75:21]
  wire  _T_70; // @[Deserializer.scala 75:9]
  wire [4:0] _T_74; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_737; // @[Deserializer.scala 74:72]
  wire [23:0] _T_76; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_2; // @[Deserializer.scala 74:87]
  wire [4:0] _T_77; // @[Deserializer.scala 74:87]
  wire  _GEN_206; // @[Deserializer.scala 75:21]
  wire  _GEN_207; // @[Deserializer.scala 75:21]
  wire  _GEN_208; // @[Deserializer.scala 75:21]
  wire  _GEN_209; // @[Deserializer.scala 75:21]
  wire  _GEN_210; // @[Deserializer.scala 75:21]
  wire  _GEN_211; // @[Deserializer.scala 75:21]
  wire  _GEN_212; // @[Deserializer.scala 75:21]
  wire  _GEN_213; // @[Deserializer.scala 75:21]
  wire  _GEN_214; // @[Deserializer.scala 75:21]
  wire  _GEN_215; // @[Deserializer.scala 75:21]
  wire  _GEN_216; // @[Deserializer.scala 75:21]
  wire  _GEN_217; // @[Deserializer.scala 75:21]
  wire  _GEN_218; // @[Deserializer.scala 75:21]
  wire  _GEN_219; // @[Deserializer.scala 75:21]
  wire  _GEN_220; // @[Deserializer.scala 75:21]
  wire  _GEN_221; // @[Deserializer.scala 75:21]
  wire  _GEN_222; // @[Deserializer.scala 75:21]
  wire  _GEN_223; // @[Deserializer.scala 75:21]
  wire  _GEN_224; // @[Deserializer.scala 75:21]
  wire  _GEN_225; // @[Deserializer.scala 75:21]
  wire  _GEN_226; // @[Deserializer.scala 75:21]
  wire  _GEN_227; // @[Deserializer.scala 75:21]
  wire  _GEN_228; // @[Deserializer.scala 75:21]
  wire  _T_80; // @[Deserializer.scala 75:9]
  wire [4:0] _T_84; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_738; // @[Deserializer.scala 74:72]
  wire [23:0] _T_86; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_3; // @[Deserializer.scala 74:87]
  wire [4:0] _T_87; // @[Deserializer.scala 74:87]
  wire  _GEN_230; // @[Deserializer.scala 75:21]
  wire  _GEN_231; // @[Deserializer.scala 75:21]
  wire  _GEN_232; // @[Deserializer.scala 75:21]
  wire  _GEN_233; // @[Deserializer.scala 75:21]
  wire  _GEN_234; // @[Deserializer.scala 75:21]
  wire  _GEN_235; // @[Deserializer.scala 75:21]
  wire  _GEN_236; // @[Deserializer.scala 75:21]
  wire  _GEN_237; // @[Deserializer.scala 75:21]
  wire  _GEN_238; // @[Deserializer.scala 75:21]
  wire  _GEN_239; // @[Deserializer.scala 75:21]
  wire  _GEN_240; // @[Deserializer.scala 75:21]
  wire  _GEN_241; // @[Deserializer.scala 75:21]
  wire  _GEN_242; // @[Deserializer.scala 75:21]
  wire  _GEN_243; // @[Deserializer.scala 75:21]
  wire  _GEN_244; // @[Deserializer.scala 75:21]
  wire  _GEN_245; // @[Deserializer.scala 75:21]
  wire  _GEN_246; // @[Deserializer.scala 75:21]
  wire  _GEN_247; // @[Deserializer.scala 75:21]
  wire  _GEN_248; // @[Deserializer.scala 75:21]
  wire  _GEN_249; // @[Deserializer.scala 75:21]
  wire  _GEN_250; // @[Deserializer.scala 75:21]
  wire  _GEN_251; // @[Deserializer.scala 75:21]
  wire  _GEN_252; // @[Deserializer.scala 75:21]
  wire  _T_90; // @[Deserializer.scala 75:9]
  wire [4:0] _T_94; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_739; // @[Deserializer.scala 74:72]
  wire [23:0] _T_96; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_4; // @[Deserializer.scala 74:87]
  wire [4:0] _T_97; // @[Deserializer.scala 74:87]
  wire  _GEN_254; // @[Deserializer.scala 75:21]
  wire  _GEN_255; // @[Deserializer.scala 75:21]
  wire  _GEN_256; // @[Deserializer.scala 75:21]
  wire  _GEN_257; // @[Deserializer.scala 75:21]
  wire  _GEN_258; // @[Deserializer.scala 75:21]
  wire  _GEN_259; // @[Deserializer.scala 75:21]
  wire  _GEN_260; // @[Deserializer.scala 75:21]
  wire  _GEN_261; // @[Deserializer.scala 75:21]
  wire  _GEN_262; // @[Deserializer.scala 75:21]
  wire  _GEN_263; // @[Deserializer.scala 75:21]
  wire  _GEN_264; // @[Deserializer.scala 75:21]
  wire  _GEN_265; // @[Deserializer.scala 75:21]
  wire  _GEN_266; // @[Deserializer.scala 75:21]
  wire  _GEN_267; // @[Deserializer.scala 75:21]
  wire  _GEN_268; // @[Deserializer.scala 75:21]
  wire  _GEN_269; // @[Deserializer.scala 75:21]
  wire  _GEN_270; // @[Deserializer.scala 75:21]
  wire  _GEN_271; // @[Deserializer.scala 75:21]
  wire  _GEN_272; // @[Deserializer.scala 75:21]
  wire  _GEN_273; // @[Deserializer.scala 75:21]
  wire  _GEN_274; // @[Deserializer.scala 75:21]
  wire  _GEN_275; // @[Deserializer.scala 75:21]
  wire  _GEN_276; // @[Deserializer.scala 75:21]
  wire  _T_100; // @[Deserializer.scala 75:9]
  wire [4:0] _T_104; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_740; // @[Deserializer.scala 74:72]
  wire [23:0] _T_106; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_5; // @[Deserializer.scala 74:87]
  wire [4:0] _T_107; // @[Deserializer.scala 74:87]
  wire  _GEN_278; // @[Deserializer.scala 75:21]
  wire  _GEN_279; // @[Deserializer.scala 75:21]
  wire  _GEN_280; // @[Deserializer.scala 75:21]
  wire  _GEN_281; // @[Deserializer.scala 75:21]
  wire  _GEN_282; // @[Deserializer.scala 75:21]
  wire  _GEN_283; // @[Deserializer.scala 75:21]
  wire  _GEN_284; // @[Deserializer.scala 75:21]
  wire  _GEN_285; // @[Deserializer.scala 75:21]
  wire  _GEN_286; // @[Deserializer.scala 75:21]
  wire  _GEN_287; // @[Deserializer.scala 75:21]
  wire  _GEN_288; // @[Deserializer.scala 75:21]
  wire  _GEN_289; // @[Deserializer.scala 75:21]
  wire  _GEN_290; // @[Deserializer.scala 75:21]
  wire  _GEN_291; // @[Deserializer.scala 75:21]
  wire  _GEN_292; // @[Deserializer.scala 75:21]
  wire  _GEN_293; // @[Deserializer.scala 75:21]
  wire  _GEN_294; // @[Deserializer.scala 75:21]
  wire  _GEN_295; // @[Deserializer.scala 75:21]
  wire  _GEN_296; // @[Deserializer.scala 75:21]
  wire  _GEN_297; // @[Deserializer.scala 75:21]
  wire  _GEN_298; // @[Deserializer.scala 75:21]
  wire  _GEN_299; // @[Deserializer.scala 75:21]
  wire  _GEN_300; // @[Deserializer.scala 75:21]
  wire  _T_110; // @[Deserializer.scala 75:9]
  wire [4:0] _T_114; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_741; // @[Deserializer.scala 74:72]
  wire [23:0] _T_116; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_6; // @[Deserializer.scala 74:87]
  wire [4:0] _T_117; // @[Deserializer.scala 74:87]
  wire  _GEN_302; // @[Deserializer.scala 75:21]
  wire  _GEN_303; // @[Deserializer.scala 75:21]
  wire  _GEN_304; // @[Deserializer.scala 75:21]
  wire  _GEN_305; // @[Deserializer.scala 75:21]
  wire  _GEN_306; // @[Deserializer.scala 75:21]
  wire  _GEN_307; // @[Deserializer.scala 75:21]
  wire  _GEN_308; // @[Deserializer.scala 75:21]
  wire  _GEN_309; // @[Deserializer.scala 75:21]
  wire  _GEN_310; // @[Deserializer.scala 75:21]
  wire  _GEN_311; // @[Deserializer.scala 75:21]
  wire  _GEN_312; // @[Deserializer.scala 75:21]
  wire  _GEN_313; // @[Deserializer.scala 75:21]
  wire  _GEN_314; // @[Deserializer.scala 75:21]
  wire  _GEN_315; // @[Deserializer.scala 75:21]
  wire  _GEN_316; // @[Deserializer.scala 75:21]
  wire  _GEN_317; // @[Deserializer.scala 75:21]
  wire  _GEN_318; // @[Deserializer.scala 75:21]
  wire  _GEN_319; // @[Deserializer.scala 75:21]
  wire  _GEN_320; // @[Deserializer.scala 75:21]
  wire  _GEN_321; // @[Deserializer.scala 75:21]
  wire  _GEN_322; // @[Deserializer.scala 75:21]
  wire  _GEN_323; // @[Deserializer.scala 75:21]
  wire  _GEN_324; // @[Deserializer.scala 75:21]
  wire  _T_120; // @[Deserializer.scala 75:9]
  wire [4:0] _T_124; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_742; // @[Deserializer.scala 74:72]
  wire [23:0] _T_126; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_7; // @[Deserializer.scala 74:87]
  wire [4:0] _T_127; // @[Deserializer.scala 74:87]
  wire  _GEN_326; // @[Deserializer.scala 75:21]
  wire  _GEN_327; // @[Deserializer.scala 75:21]
  wire  _GEN_328; // @[Deserializer.scala 75:21]
  wire  _GEN_329; // @[Deserializer.scala 75:21]
  wire  _GEN_330; // @[Deserializer.scala 75:21]
  wire  _GEN_331; // @[Deserializer.scala 75:21]
  wire  _GEN_332; // @[Deserializer.scala 75:21]
  wire  _GEN_333; // @[Deserializer.scala 75:21]
  wire  _GEN_334; // @[Deserializer.scala 75:21]
  wire  _GEN_335; // @[Deserializer.scala 75:21]
  wire  _GEN_336; // @[Deserializer.scala 75:21]
  wire  _GEN_337; // @[Deserializer.scala 75:21]
  wire  _GEN_338; // @[Deserializer.scala 75:21]
  wire  _GEN_339; // @[Deserializer.scala 75:21]
  wire  _GEN_340; // @[Deserializer.scala 75:21]
  wire  _GEN_341; // @[Deserializer.scala 75:21]
  wire  _GEN_342; // @[Deserializer.scala 75:21]
  wire  _GEN_343; // @[Deserializer.scala 75:21]
  wire  _GEN_344; // @[Deserializer.scala 75:21]
  wire  _GEN_345; // @[Deserializer.scala 75:21]
  wire  _GEN_346; // @[Deserializer.scala 75:21]
  wire  _GEN_347; // @[Deserializer.scala 75:21]
  wire  _GEN_348; // @[Deserializer.scala 75:21]
  wire  _T_130; // @[Deserializer.scala 75:9]
  wire [4:0] _T_134; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_743; // @[Deserializer.scala 74:72]
  wire [23:0] _T_136; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_8; // @[Deserializer.scala 74:87]
  wire [4:0] _T_137; // @[Deserializer.scala 74:87]
  wire  _GEN_350; // @[Deserializer.scala 75:21]
  wire  _GEN_351; // @[Deserializer.scala 75:21]
  wire  _GEN_352; // @[Deserializer.scala 75:21]
  wire  _GEN_353; // @[Deserializer.scala 75:21]
  wire  _GEN_354; // @[Deserializer.scala 75:21]
  wire  _GEN_355; // @[Deserializer.scala 75:21]
  wire  _GEN_356; // @[Deserializer.scala 75:21]
  wire  _GEN_357; // @[Deserializer.scala 75:21]
  wire  _GEN_358; // @[Deserializer.scala 75:21]
  wire  _GEN_359; // @[Deserializer.scala 75:21]
  wire  _GEN_360; // @[Deserializer.scala 75:21]
  wire  _GEN_361; // @[Deserializer.scala 75:21]
  wire  _GEN_362; // @[Deserializer.scala 75:21]
  wire  _GEN_363; // @[Deserializer.scala 75:21]
  wire  _GEN_364; // @[Deserializer.scala 75:21]
  wire  _GEN_365; // @[Deserializer.scala 75:21]
  wire  _GEN_366; // @[Deserializer.scala 75:21]
  wire  _GEN_367; // @[Deserializer.scala 75:21]
  wire  _GEN_368; // @[Deserializer.scala 75:21]
  wire  _GEN_369; // @[Deserializer.scala 75:21]
  wire  _GEN_370; // @[Deserializer.scala 75:21]
  wire  _GEN_371; // @[Deserializer.scala 75:21]
  wire  _GEN_372; // @[Deserializer.scala 75:21]
  wire  _T_140; // @[Deserializer.scala 75:9]
  wire [4:0] _T_144; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_744; // @[Deserializer.scala 74:72]
  wire [23:0] _T_146; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_9; // @[Deserializer.scala 74:87]
  wire [4:0] _T_147; // @[Deserializer.scala 74:87]
  wire  _GEN_374; // @[Deserializer.scala 75:21]
  wire  _GEN_375; // @[Deserializer.scala 75:21]
  wire  _GEN_376; // @[Deserializer.scala 75:21]
  wire  _GEN_377; // @[Deserializer.scala 75:21]
  wire  _GEN_378; // @[Deserializer.scala 75:21]
  wire  _GEN_379; // @[Deserializer.scala 75:21]
  wire  _GEN_380; // @[Deserializer.scala 75:21]
  wire  _GEN_381; // @[Deserializer.scala 75:21]
  wire  _GEN_382; // @[Deserializer.scala 75:21]
  wire  _GEN_383; // @[Deserializer.scala 75:21]
  wire  _GEN_384; // @[Deserializer.scala 75:21]
  wire  _GEN_385; // @[Deserializer.scala 75:21]
  wire  _GEN_386; // @[Deserializer.scala 75:21]
  wire  _GEN_387; // @[Deserializer.scala 75:21]
  wire  _GEN_388; // @[Deserializer.scala 75:21]
  wire  _GEN_389; // @[Deserializer.scala 75:21]
  wire  _GEN_390; // @[Deserializer.scala 75:21]
  wire  _GEN_391; // @[Deserializer.scala 75:21]
  wire  _GEN_392; // @[Deserializer.scala 75:21]
  wire  _GEN_393; // @[Deserializer.scala 75:21]
  wire  _GEN_394; // @[Deserializer.scala 75:21]
  wire  _GEN_395; // @[Deserializer.scala 75:21]
  wire  _GEN_396; // @[Deserializer.scala 75:21]
  wire  _T_150; // @[Deserializer.scala 75:9]
  wire [4:0] _T_154; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_745; // @[Deserializer.scala 74:72]
  wire [23:0] _T_156; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_10; // @[Deserializer.scala 74:87]
  wire [4:0] _T_157; // @[Deserializer.scala 74:87]
  wire  _GEN_398; // @[Deserializer.scala 75:21]
  wire  _GEN_399; // @[Deserializer.scala 75:21]
  wire  _GEN_400; // @[Deserializer.scala 75:21]
  wire  _GEN_401; // @[Deserializer.scala 75:21]
  wire  _GEN_402; // @[Deserializer.scala 75:21]
  wire  _GEN_403; // @[Deserializer.scala 75:21]
  wire  _GEN_404; // @[Deserializer.scala 75:21]
  wire  _GEN_405; // @[Deserializer.scala 75:21]
  wire  _GEN_406; // @[Deserializer.scala 75:21]
  wire  _GEN_407; // @[Deserializer.scala 75:21]
  wire  _GEN_408; // @[Deserializer.scala 75:21]
  wire  _GEN_409; // @[Deserializer.scala 75:21]
  wire  _GEN_410; // @[Deserializer.scala 75:21]
  wire  _GEN_411; // @[Deserializer.scala 75:21]
  wire  _GEN_412; // @[Deserializer.scala 75:21]
  wire  _GEN_413; // @[Deserializer.scala 75:21]
  wire  _GEN_414; // @[Deserializer.scala 75:21]
  wire  _GEN_415; // @[Deserializer.scala 75:21]
  wire  _GEN_416; // @[Deserializer.scala 75:21]
  wire  _GEN_417; // @[Deserializer.scala 75:21]
  wire  _GEN_418; // @[Deserializer.scala 75:21]
  wire  _GEN_419; // @[Deserializer.scala 75:21]
  wire  _GEN_420; // @[Deserializer.scala 75:21]
  wire  _T_160; // @[Deserializer.scala 75:9]
  wire [4:0] _T_164; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_746; // @[Deserializer.scala 74:72]
  wire [23:0] _T_166; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_11; // @[Deserializer.scala 74:87]
  wire [4:0] _T_167; // @[Deserializer.scala 74:87]
  wire  _GEN_422; // @[Deserializer.scala 75:21]
  wire  _GEN_423; // @[Deserializer.scala 75:21]
  wire  _GEN_424; // @[Deserializer.scala 75:21]
  wire  _GEN_425; // @[Deserializer.scala 75:21]
  wire  _GEN_426; // @[Deserializer.scala 75:21]
  wire  _GEN_427; // @[Deserializer.scala 75:21]
  wire  _GEN_428; // @[Deserializer.scala 75:21]
  wire  _GEN_429; // @[Deserializer.scala 75:21]
  wire  _GEN_430; // @[Deserializer.scala 75:21]
  wire  _GEN_431; // @[Deserializer.scala 75:21]
  wire  _GEN_432; // @[Deserializer.scala 75:21]
  wire  _GEN_433; // @[Deserializer.scala 75:21]
  wire  _GEN_434; // @[Deserializer.scala 75:21]
  wire  _GEN_435; // @[Deserializer.scala 75:21]
  wire  _GEN_436; // @[Deserializer.scala 75:21]
  wire  _GEN_437; // @[Deserializer.scala 75:21]
  wire  _GEN_438; // @[Deserializer.scala 75:21]
  wire  _GEN_439; // @[Deserializer.scala 75:21]
  wire  _GEN_440; // @[Deserializer.scala 75:21]
  wire  _GEN_441; // @[Deserializer.scala 75:21]
  wire  _GEN_442; // @[Deserializer.scala 75:21]
  wire  _GEN_443; // @[Deserializer.scala 75:21]
  wire  _GEN_444; // @[Deserializer.scala 75:21]
  wire  _T_170; // @[Deserializer.scala 75:9]
  wire [4:0] _T_174; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_747; // @[Deserializer.scala 74:72]
  wire [23:0] _T_176; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_12; // @[Deserializer.scala 74:87]
  wire [4:0] _T_177; // @[Deserializer.scala 74:87]
  wire  _GEN_446; // @[Deserializer.scala 75:21]
  wire  _GEN_447; // @[Deserializer.scala 75:21]
  wire  _GEN_448; // @[Deserializer.scala 75:21]
  wire  _GEN_449; // @[Deserializer.scala 75:21]
  wire  _GEN_450; // @[Deserializer.scala 75:21]
  wire  _GEN_451; // @[Deserializer.scala 75:21]
  wire  _GEN_452; // @[Deserializer.scala 75:21]
  wire  _GEN_453; // @[Deserializer.scala 75:21]
  wire  _GEN_454; // @[Deserializer.scala 75:21]
  wire  _GEN_455; // @[Deserializer.scala 75:21]
  wire  _GEN_456; // @[Deserializer.scala 75:21]
  wire  _GEN_457; // @[Deserializer.scala 75:21]
  wire  _GEN_458; // @[Deserializer.scala 75:21]
  wire  _GEN_459; // @[Deserializer.scala 75:21]
  wire  _GEN_460; // @[Deserializer.scala 75:21]
  wire  _GEN_461; // @[Deserializer.scala 75:21]
  wire  _GEN_462; // @[Deserializer.scala 75:21]
  wire  _GEN_463; // @[Deserializer.scala 75:21]
  wire  _GEN_464; // @[Deserializer.scala 75:21]
  wire  _GEN_465; // @[Deserializer.scala 75:21]
  wire  _GEN_466; // @[Deserializer.scala 75:21]
  wire  _GEN_467; // @[Deserializer.scala 75:21]
  wire  _GEN_468; // @[Deserializer.scala 75:21]
  wire  _T_180; // @[Deserializer.scala 75:9]
  wire [4:0] _T_184; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_748; // @[Deserializer.scala 74:72]
  wire [23:0] _T_186; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_13; // @[Deserializer.scala 74:87]
  wire [4:0] _T_187; // @[Deserializer.scala 74:87]
  wire  _GEN_470; // @[Deserializer.scala 75:21]
  wire  _GEN_471; // @[Deserializer.scala 75:21]
  wire  _GEN_472; // @[Deserializer.scala 75:21]
  wire  _GEN_473; // @[Deserializer.scala 75:21]
  wire  _GEN_474; // @[Deserializer.scala 75:21]
  wire  _GEN_475; // @[Deserializer.scala 75:21]
  wire  _GEN_476; // @[Deserializer.scala 75:21]
  wire  _GEN_477; // @[Deserializer.scala 75:21]
  wire  _GEN_478; // @[Deserializer.scala 75:21]
  wire  _GEN_479; // @[Deserializer.scala 75:21]
  wire  _GEN_480; // @[Deserializer.scala 75:21]
  wire  _GEN_481; // @[Deserializer.scala 75:21]
  wire  _GEN_482; // @[Deserializer.scala 75:21]
  wire  _GEN_483; // @[Deserializer.scala 75:21]
  wire  _GEN_484; // @[Deserializer.scala 75:21]
  wire  _GEN_485; // @[Deserializer.scala 75:21]
  wire  _GEN_486; // @[Deserializer.scala 75:21]
  wire  _GEN_487; // @[Deserializer.scala 75:21]
  wire  _GEN_488; // @[Deserializer.scala 75:21]
  wire  _GEN_489; // @[Deserializer.scala 75:21]
  wire  _GEN_490; // @[Deserializer.scala 75:21]
  wire  _GEN_491; // @[Deserializer.scala 75:21]
  wire  _GEN_492; // @[Deserializer.scala 75:21]
  wire  _T_190; // @[Deserializer.scala 75:9]
  wire [4:0] _T_194; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_749; // @[Deserializer.scala 74:72]
  wire [23:0] _T_196; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_14; // @[Deserializer.scala 74:87]
  wire [4:0] _T_197; // @[Deserializer.scala 74:87]
  wire  _GEN_494; // @[Deserializer.scala 75:21]
  wire  _GEN_495; // @[Deserializer.scala 75:21]
  wire  _GEN_496; // @[Deserializer.scala 75:21]
  wire  _GEN_497; // @[Deserializer.scala 75:21]
  wire  _GEN_498; // @[Deserializer.scala 75:21]
  wire  _GEN_499; // @[Deserializer.scala 75:21]
  wire  _GEN_500; // @[Deserializer.scala 75:21]
  wire  _GEN_501; // @[Deserializer.scala 75:21]
  wire  _GEN_502; // @[Deserializer.scala 75:21]
  wire  _GEN_503; // @[Deserializer.scala 75:21]
  wire  _GEN_504; // @[Deserializer.scala 75:21]
  wire  _GEN_505; // @[Deserializer.scala 75:21]
  wire  _GEN_506; // @[Deserializer.scala 75:21]
  wire  _GEN_507; // @[Deserializer.scala 75:21]
  wire  _GEN_508; // @[Deserializer.scala 75:21]
  wire  _GEN_509; // @[Deserializer.scala 75:21]
  wire  _GEN_510; // @[Deserializer.scala 75:21]
  wire  _GEN_511; // @[Deserializer.scala 75:21]
  wire  _GEN_512; // @[Deserializer.scala 75:21]
  wire  _GEN_513; // @[Deserializer.scala 75:21]
  wire  _GEN_514; // @[Deserializer.scala 75:21]
  wire  _GEN_515; // @[Deserializer.scala 75:21]
  wire  _GEN_516; // @[Deserializer.scala 75:21]
  wire  _T_199; // @[Deserializer.scala 75:21]
  wire  _T_200; // @[Deserializer.scala 75:9]
  wire [4:0] _T_204; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_750; // @[Deserializer.scala 74:72]
  wire [23:0] _T_206; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_15; // @[Deserializer.scala 74:87]
  wire [4:0] _T_207; // @[Deserializer.scala 74:87]
  wire  _GEN_518; // @[Deserializer.scala 75:21]
  wire  _GEN_519; // @[Deserializer.scala 75:21]
  wire  _GEN_520; // @[Deserializer.scala 75:21]
  wire  _GEN_521; // @[Deserializer.scala 75:21]
  wire  _GEN_522; // @[Deserializer.scala 75:21]
  wire  _GEN_523; // @[Deserializer.scala 75:21]
  wire  _GEN_524; // @[Deserializer.scala 75:21]
  wire  _GEN_525; // @[Deserializer.scala 75:21]
  wire  _GEN_526; // @[Deserializer.scala 75:21]
  wire  _GEN_527; // @[Deserializer.scala 75:21]
  wire  _GEN_528; // @[Deserializer.scala 75:21]
  wire  _GEN_529; // @[Deserializer.scala 75:21]
  wire  _GEN_530; // @[Deserializer.scala 75:21]
  wire  _GEN_531; // @[Deserializer.scala 75:21]
  wire  _GEN_532; // @[Deserializer.scala 75:21]
  wire  _GEN_533; // @[Deserializer.scala 75:21]
  wire  _GEN_534; // @[Deserializer.scala 75:21]
  wire  _GEN_535; // @[Deserializer.scala 75:21]
  wire  _GEN_536; // @[Deserializer.scala 75:21]
  wire  _GEN_537; // @[Deserializer.scala 75:21]
  wire  _GEN_538; // @[Deserializer.scala 75:21]
  wire  _GEN_539; // @[Deserializer.scala 75:21]
  wire  _GEN_540; // @[Deserializer.scala 75:21]
  wire  _T_209; // @[Deserializer.scala 75:21]
  wire  _T_210; // @[Deserializer.scala 75:9]
  wire [4:0] _T_214; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_751; // @[Deserializer.scala 74:72]
  wire [23:0] _T_216; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_16; // @[Deserializer.scala 74:87]
  wire [4:0] _T_217; // @[Deserializer.scala 74:87]
  wire  _GEN_542; // @[Deserializer.scala 75:21]
  wire  _GEN_543; // @[Deserializer.scala 75:21]
  wire  _GEN_544; // @[Deserializer.scala 75:21]
  wire  _GEN_545; // @[Deserializer.scala 75:21]
  wire  _GEN_546; // @[Deserializer.scala 75:21]
  wire  _GEN_547; // @[Deserializer.scala 75:21]
  wire  _GEN_548; // @[Deserializer.scala 75:21]
  wire  _GEN_549; // @[Deserializer.scala 75:21]
  wire  _GEN_550; // @[Deserializer.scala 75:21]
  wire  _GEN_551; // @[Deserializer.scala 75:21]
  wire  _GEN_552; // @[Deserializer.scala 75:21]
  wire  _GEN_553; // @[Deserializer.scala 75:21]
  wire  _GEN_554; // @[Deserializer.scala 75:21]
  wire  _GEN_555; // @[Deserializer.scala 75:21]
  wire  _GEN_556; // @[Deserializer.scala 75:21]
  wire  _GEN_557; // @[Deserializer.scala 75:21]
  wire  _GEN_558; // @[Deserializer.scala 75:21]
  wire  _GEN_559; // @[Deserializer.scala 75:21]
  wire  _GEN_560; // @[Deserializer.scala 75:21]
  wire  _GEN_561; // @[Deserializer.scala 75:21]
  wire  _GEN_562; // @[Deserializer.scala 75:21]
  wire  _GEN_563; // @[Deserializer.scala 75:21]
  wire  _GEN_564; // @[Deserializer.scala 75:21]
  wire  _T_220; // @[Deserializer.scala 75:9]
  wire [4:0] _T_224; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_752; // @[Deserializer.scala 74:72]
  wire [23:0] _T_226; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_17; // @[Deserializer.scala 74:87]
  wire [4:0] _T_227; // @[Deserializer.scala 74:87]
  wire  _GEN_566; // @[Deserializer.scala 75:21]
  wire  _GEN_567; // @[Deserializer.scala 75:21]
  wire  _GEN_568; // @[Deserializer.scala 75:21]
  wire  _GEN_569; // @[Deserializer.scala 75:21]
  wire  _GEN_570; // @[Deserializer.scala 75:21]
  wire  _GEN_571; // @[Deserializer.scala 75:21]
  wire  _GEN_572; // @[Deserializer.scala 75:21]
  wire  _GEN_573; // @[Deserializer.scala 75:21]
  wire  _GEN_574; // @[Deserializer.scala 75:21]
  wire  _GEN_575; // @[Deserializer.scala 75:21]
  wire  _GEN_576; // @[Deserializer.scala 75:21]
  wire  _GEN_577; // @[Deserializer.scala 75:21]
  wire  _GEN_578; // @[Deserializer.scala 75:21]
  wire  _GEN_579; // @[Deserializer.scala 75:21]
  wire  _GEN_580; // @[Deserializer.scala 75:21]
  wire  _GEN_581; // @[Deserializer.scala 75:21]
  wire  _GEN_582; // @[Deserializer.scala 75:21]
  wire  _GEN_583; // @[Deserializer.scala 75:21]
  wire  _GEN_584; // @[Deserializer.scala 75:21]
  wire  _GEN_585; // @[Deserializer.scala 75:21]
  wire  _GEN_586; // @[Deserializer.scala 75:21]
  wire  _GEN_587; // @[Deserializer.scala 75:21]
  wire  _GEN_588; // @[Deserializer.scala 75:21]
  wire  _T_230; // @[Deserializer.scala 75:9]
  wire [4:0] _T_234; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_753; // @[Deserializer.scala 74:72]
  wire [23:0] _T_236; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_18; // @[Deserializer.scala 74:87]
  wire [4:0] _T_237; // @[Deserializer.scala 74:87]
  wire  _GEN_590; // @[Deserializer.scala 75:21]
  wire  _GEN_591; // @[Deserializer.scala 75:21]
  wire  _GEN_592; // @[Deserializer.scala 75:21]
  wire  _GEN_593; // @[Deserializer.scala 75:21]
  wire  _GEN_594; // @[Deserializer.scala 75:21]
  wire  _GEN_595; // @[Deserializer.scala 75:21]
  wire  _GEN_596; // @[Deserializer.scala 75:21]
  wire  _GEN_597; // @[Deserializer.scala 75:21]
  wire  _GEN_598; // @[Deserializer.scala 75:21]
  wire  _GEN_599; // @[Deserializer.scala 75:21]
  wire  _GEN_600; // @[Deserializer.scala 75:21]
  wire  _GEN_601; // @[Deserializer.scala 75:21]
  wire  _GEN_602; // @[Deserializer.scala 75:21]
  wire  _GEN_603; // @[Deserializer.scala 75:21]
  wire  _GEN_604; // @[Deserializer.scala 75:21]
  wire  _GEN_605; // @[Deserializer.scala 75:21]
  wire  _GEN_606; // @[Deserializer.scala 75:21]
  wire  _GEN_607; // @[Deserializer.scala 75:21]
  wire  _GEN_608; // @[Deserializer.scala 75:21]
  wire  _GEN_609; // @[Deserializer.scala 75:21]
  wire  _GEN_610; // @[Deserializer.scala 75:21]
  wire  _GEN_611; // @[Deserializer.scala 75:21]
  wire  _GEN_612; // @[Deserializer.scala 75:21]
  wire  _T_240; // @[Deserializer.scala 75:9]
  wire [4:0] _T_244; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_754; // @[Deserializer.scala 74:72]
  wire [23:0] _T_246; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_19; // @[Deserializer.scala 74:87]
  wire [4:0] _T_247; // @[Deserializer.scala 74:87]
  wire  _GEN_614; // @[Deserializer.scala 75:21]
  wire  _GEN_615; // @[Deserializer.scala 75:21]
  wire  _GEN_616; // @[Deserializer.scala 75:21]
  wire  _GEN_617; // @[Deserializer.scala 75:21]
  wire  _GEN_618; // @[Deserializer.scala 75:21]
  wire  _GEN_619; // @[Deserializer.scala 75:21]
  wire  _GEN_620; // @[Deserializer.scala 75:21]
  wire  _GEN_621; // @[Deserializer.scala 75:21]
  wire  _GEN_622; // @[Deserializer.scala 75:21]
  wire  _GEN_623; // @[Deserializer.scala 75:21]
  wire  _GEN_624; // @[Deserializer.scala 75:21]
  wire  _GEN_625; // @[Deserializer.scala 75:21]
  wire  _GEN_626; // @[Deserializer.scala 75:21]
  wire  _GEN_627; // @[Deserializer.scala 75:21]
  wire  _GEN_628; // @[Deserializer.scala 75:21]
  wire  _GEN_629; // @[Deserializer.scala 75:21]
  wire  _GEN_630; // @[Deserializer.scala 75:21]
  wire  _GEN_631; // @[Deserializer.scala 75:21]
  wire  _GEN_632; // @[Deserializer.scala 75:21]
  wire  _GEN_633; // @[Deserializer.scala 75:21]
  wire  _GEN_634; // @[Deserializer.scala 75:21]
  wire  _GEN_635; // @[Deserializer.scala 75:21]
  wire  _GEN_636; // @[Deserializer.scala 75:21]
  wire  _T_250; // @[Deserializer.scala 75:9]
  wire [4:0] _T_254; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_755; // @[Deserializer.scala 74:72]
  wire [23:0] _T_256; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_20; // @[Deserializer.scala 74:87]
  wire [4:0] _T_257; // @[Deserializer.scala 74:87]
  wire  _GEN_638; // @[Deserializer.scala 75:21]
  wire  _GEN_639; // @[Deserializer.scala 75:21]
  wire  _GEN_640; // @[Deserializer.scala 75:21]
  wire  _GEN_641; // @[Deserializer.scala 75:21]
  wire  _GEN_642; // @[Deserializer.scala 75:21]
  wire  _GEN_643; // @[Deserializer.scala 75:21]
  wire  _GEN_644; // @[Deserializer.scala 75:21]
  wire  _GEN_645; // @[Deserializer.scala 75:21]
  wire  _GEN_646; // @[Deserializer.scala 75:21]
  wire  _GEN_647; // @[Deserializer.scala 75:21]
  wire  _GEN_648; // @[Deserializer.scala 75:21]
  wire  _GEN_649; // @[Deserializer.scala 75:21]
  wire  _GEN_650; // @[Deserializer.scala 75:21]
  wire  _GEN_651; // @[Deserializer.scala 75:21]
  wire  _GEN_652; // @[Deserializer.scala 75:21]
  wire  _GEN_653; // @[Deserializer.scala 75:21]
  wire  _GEN_654; // @[Deserializer.scala 75:21]
  wire  _GEN_655; // @[Deserializer.scala 75:21]
  wire  _GEN_656; // @[Deserializer.scala 75:21]
  wire  _GEN_657; // @[Deserializer.scala 75:21]
  wire  _GEN_658; // @[Deserializer.scala 75:21]
  wire  _GEN_659; // @[Deserializer.scala 75:21]
  wire  _GEN_660; // @[Deserializer.scala 75:21]
  wire  _T_260; // @[Deserializer.scala 75:9]
  wire [4:0] _T_264; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_756; // @[Deserializer.scala 74:72]
  wire [23:0] _T_266; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_21; // @[Deserializer.scala 74:87]
  wire [4:0] _T_267; // @[Deserializer.scala 74:87]
  wire  _GEN_662; // @[Deserializer.scala 75:21]
  wire  _GEN_663; // @[Deserializer.scala 75:21]
  wire  _GEN_664; // @[Deserializer.scala 75:21]
  wire  _GEN_665; // @[Deserializer.scala 75:21]
  wire  _GEN_666; // @[Deserializer.scala 75:21]
  wire  _GEN_667; // @[Deserializer.scala 75:21]
  wire  _GEN_668; // @[Deserializer.scala 75:21]
  wire  _GEN_669; // @[Deserializer.scala 75:21]
  wire  _GEN_670; // @[Deserializer.scala 75:21]
  wire  _GEN_671; // @[Deserializer.scala 75:21]
  wire  _GEN_672; // @[Deserializer.scala 75:21]
  wire  _GEN_673; // @[Deserializer.scala 75:21]
  wire  _GEN_674; // @[Deserializer.scala 75:21]
  wire  _GEN_675; // @[Deserializer.scala 75:21]
  wire  _GEN_676; // @[Deserializer.scala 75:21]
  wire  _GEN_677; // @[Deserializer.scala 75:21]
  wire  _GEN_678; // @[Deserializer.scala 75:21]
  wire  _GEN_679; // @[Deserializer.scala 75:21]
  wire  _GEN_680; // @[Deserializer.scala 75:21]
  wire  _GEN_681; // @[Deserializer.scala 75:21]
  wire  _GEN_682; // @[Deserializer.scala 75:21]
  wire  _GEN_683; // @[Deserializer.scala 75:21]
  wire  _GEN_684; // @[Deserializer.scala 75:21]
  wire  _T_270; // @[Deserializer.scala 75:9]
  wire [4:0] _T_274; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_757; // @[Deserializer.scala 74:72]
  wire [23:0] _T_276; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_22; // @[Deserializer.scala 74:87]
  wire [4:0] _T_277; // @[Deserializer.scala 74:87]
  wire  _GEN_686; // @[Deserializer.scala 75:21]
  wire  _GEN_687; // @[Deserializer.scala 75:21]
  wire  _GEN_688; // @[Deserializer.scala 75:21]
  wire  _GEN_689; // @[Deserializer.scala 75:21]
  wire  _GEN_690; // @[Deserializer.scala 75:21]
  wire  _GEN_691; // @[Deserializer.scala 75:21]
  wire  _GEN_692; // @[Deserializer.scala 75:21]
  wire  _GEN_693; // @[Deserializer.scala 75:21]
  wire  _GEN_694; // @[Deserializer.scala 75:21]
  wire  _GEN_695; // @[Deserializer.scala 75:21]
  wire  _GEN_696; // @[Deserializer.scala 75:21]
  wire  _GEN_697; // @[Deserializer.scala 75:21]
  wire  _GEN_698; // @[Deserializer.scala 75:21]
  wire  _GEN_699; // @[Deserializer.scala 75:21]
  wire  _GEN_700; // @[Deserializer.scala 75:21]
  wire  _GEN_701; // @[Deserializer.scala 75:21]
  wire  _GEN_702; // @[Deserializer.scala 75:21]
  wire  _GEN_703; // @[Deserializer.scala 75:21]
  wire  _GEN_704; // @[Deserializer.scala 75:21]
  wire  _GEN_705; // @[Deserializer.scala 75:21]
  wire  _GEN_706; // @[Deserializer.scala 75:21]
  wire  _GEN_707; // @[Deserializer.scala 75:21]
  wire  _GEN_708; // @[Deserializer.scala 75:21]
  wire  _T_279; // @[Deserializer.scala 75:21]
  wire  _T_280; // @[Deserializer.scala 75:9]
  wire [4:0] _T_284; // @[Deserializer.scala 74:65]
  wire [23:0] _GEN_758; // @[Deserializer.scala 74:72]
  wire [23:0] _T_286; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_23; // @[Deserializer.scala 74:87]
  wire [4:0] _T_287; // @[Deserializer.scala 74:87]
  wire  _GEN_710; // @[Deserializer.scala 75:21]
  wire  _GEN_711; // @[Deserializer.scala 75:21]
  wire  _GEN_712; // @[Deserializer.scala 75:21]
  wire  _GEN_713; // @[Deserializer.scala 75:21]
  wire  _GEN_714; // @[Deserializer.scala 75:21]
  wire  _GEN_715; // @[Deserializer.scala 75:21]
  wire  _GEN_716; // @[Deserializer.scala 75:21]
  wire  _GEN_717; // @[Deserializer.scala 75:21]
  wire  _GEN_718; // @[Deserializer.scala 75:21]
  wire  _GEN_719; // @[Deserializer.scala 75:21]
  wire  _GEN_720; // @[Deserializer.scala 75:21]
  wire  _GEN_721; // @[Deserializer.scala 75:21]
  wire  _GEN_722; // @[Deserializer.scala 75:21]
  wire  _GEN_723; // @[Deserializer.scala 75:21]
  wire  _GEN_724; // @[Deserializer.scala 75:21]
  wire  _GEN_725; // @[Deserializer.scala 75:21]
  wire  _GEN_726; // @[Deserializer.scala 75:21]
  wire  _GEN_727; // @[Deserializer.scala 75:21]
  wire  _GEN_728; // @[Deserializer.scala 75:21]
  wire  _GEN_729; // @[Deserializer.scala 75:21]
  wire  _GEN_730; // @[Deserializer.scala 75:21]
  wire  _GEN_731; // @[Deserializer.scala 75:21]
  wire  _GEN_732; // @[Deserializer.scala 75:21]
  wire  _T_290; // @[Deserializer.scala 75:9]
  wire  _T_292; // @[Deserializer.scala 76:26]
  wire  _T_293; // @[Deserializer.scala 76:26]
  wire  _T_294; // @[Deserializer.scala 76:26]
  wire  _T_295; // @[Deserializer.scala 76:26]
  wire  _T_296; // @[Deserializer.scala 76:26]
  wire  _T_297; // @[Deserializer.scala 76:26]
  wire  _T_298; // @[Deserializer.scala 76:26]
  wire  _T_299; // @[Deserializer.scala 76:26]
  wire  _T_300; // @[Deserializer.scala 76:26]
  wire  _T_301; // @[Deserializer.scala 76:26]
  wire  _T_302; // @[Deserializer.scala 76:26]
  wire  _T_303; // @[Deserializer.scala 76:26]
  wire  _T_304; // @[Deserializer.scala 76:26]
  wire  _T_305; // @[Deserializer.scala 76:26]
  wire  _T_306; // @[Deserializer.scala 76:26]
  wire  _T_307; // @[Deserializer.scala 76:26]
  wire  _T_308; // @[Deserializer.scala 76:26]
  wire  _T_309; // @[Deserializer.scala 76:26]
  wire  _T_310; // @[Deserializer.scala 76:26]
  wire  _T_311; // @[Deserializer.scala 76:26]
  wire  _T_312; // @[Deserializer.scala 76:26]
  wire  _T_313; // @[Deserializer.scala 76:26]
  wire  _T_314; // @[Deserializer.scala 76:26]
  wire  _T_315; // @[Bgec.scala 120:55]
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
    .io_inputData_23(commandDeserializer_io_inputData_23),
    .io_bitsRead(commandDeserializer_io_bitsRead)
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
  assign _T_52 = 5'h18 - 5'h18; // @[Deserializer.scala 74:47]
  assign _T_53 = {{1'd0}, _T_52}; // @[Deserializer.scala 74:65]
  assign _T_54 = _T_53[4:0]; // @[Deserializer.scala 74:65]
  assign _GEN_735 = {{19'd0}, _T_54}; // @[Deserializer.scala 74:72]
  assign _T_56 = _GEN_735 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_0 = _T_56 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_57 = _GEN_0[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_157 = commandDeserializer_io_inputData_0; // @[Deserializer.scala 75:21]
  assign _GEN_158 = 5'h1 == _T_57 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_159 = 5'h2 == _T_57 ? commandDeserializer_io_inputData_2 : _GEN_158; // @[Deserializer.scala 75:21]
  assign _GEN_160 = 5'h3 == _T_57 ? commandDeserializer_io_inputData_3 : _GEN_159; // @[Deserializer.scala 75:21]
  assign _GEN_161 = 5'h4 == _T_57 ? commandDeserializer_io_inputData_4 : _GEN_160; // @[Deserializer.scala 75:21]
  assign _GEN_162 = 5'h5 == _T_57 ? commandDeserializer_io_inputData_5 : _GEN_161; // @[Deserializer.scala 75:21]
  assign _GEN_163 = 5'h6 == _T_57 ? commandDeserializer_io_inputData_6 : _GEN_162; // @[Deserializer.scala 75:21]
  assign _GEN_164 = 5'h7 == _T_57 ? commandDeserializer_io_inputData_7 : _GEN_163; // @[Deserializer.scala 75:21]
  assign _GEN_165 = 5'h8 == _T_57 ? commandDeserializer_io_inputData_8 : _GEN_164; // @[Deserializer.scala 75:21]
  assign _GEN_166 = 5'h9 == _T_57 ? commandDeserializer_io_inputData_9 : _GEN_165; // @[Deserializer.scala 75:21]
  assign _GEN_167 = 5'ha == _T_57 ? commandDeserializer_io_inputData_10 : _GEN_166; // @[Deserializer.scala 75:21]
  assign _GEN_168 = 5'hb == _T_57 ? commandDeserializer_io_inputData_11 : _GEN_167; // @[Deserializer.scala 75:21]
  assign _GEN_169 = 5'hc == _T_57 ? commandDeserializer_io_inputData_12 : _GEN_168; // @[Deserializer.scala 75:21]
  assign _GEN_170 = 5'hd == _T_57 ? commandDeserializer_io_inputData_13 : _GEN_169; // @[Deserializer.scala 75:21]
  assign _GEN_171 = 5'he == _T_57 ? commandDeserializer_io_inputData_14 : _GEN_170; // @[Deserializer.scala 75:21]
  assign _GEN_172 = 5'hf == _T_57 ? commandDeserializer_io_inputData_15 : _GEN_171; // @[Deserializer.scala 75:21]
  assign _GEN_173 = 5'h10 == _T_57 ? commandDeserializer_io_inputData_16 : _GEN_172; // @[Deserializer.scala 75:21]
  assign _GEN_174 = 5'h11 == _T_57 ? commandDeserializer_io_inputData_17 : _GEN_173; // @[Deserializer.scala 75:21]
  assign _GEN_175 = 5'h12 == _T_57 ? commandDeserializer_io_inputData_18 : _GEN_174; // @[Deserializer.scala 75:21]
  assign _GEN_176 = 5'h13 == _T_57 ? commandDeserializer_io_inputData_19 : _GEN_175; // @[Deserializer.scala 75:21]
  assign _GEN_177 = 5'h14 == _T_57 ? commandDeserializer_io_inputData_20 : _GEN_176; // @[Deserializer.scala 75:21]
  assign _GEN_178 = 5'h15 == _T_57 ? commandDeserializer_io_inputData_21 : _GEN_177; // @[Deserializer.scala 75:21]
  assign _GEN_179 = 5'h16 == _T_57 ? commandDeserializer_io_inputData_22 : _GEN_178; // @[Deserializer.scala 75:21]
  assign _GEN_180 = 5'h17 == _T_57 ? commandDeserializer_io_inputData_23 : _GEN_179; // @[Deserializer.scala 75:21]
  assign _T_60 = _GEN_180 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_64 = _T_52 + 5'h1; // @[Deserializer.scala 74:65]
  assign _GEN_736 = {{19'd0}, _T_64}; // @[Deserializer.scala 74:72]
  assign _T_66 = _GEN_736 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_1 = _T_66 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_67 = _GEN_1[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_182 = 5'h1 == _T_67 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_183 = 5'h2 == _T_67 ? commandDeserializer_io_inputData_2 : _GEN_182; // @[Deserializer.scala 75:21]
  assign _GEN_184 = 5'h3 == _T_67 ? commandDeserializer_io_inputData_3 : _GEN_183; // @[Deserializer.scala 75:21]
  assign _GEN_185 = 5'h4 == _T_67 ? commandDeserializer_io_inputData_4 : _GEN_184; // @[Deserializer.scala 75:21]
  assign _GEN_186 = 5'h5 == _T_67 ? commandDeserializer_io_inputData_5 : _GEN_185; // @[Deserializer.scala 75:21]
  assign _GEN_187 = 5'h6 == _T_67 ? commandDeserializer_io_inputData_6 : _GEN_186; // @[Deserializer.scala 75:21]
  assign _GEN_188 = 5'h7 == _T_67 ? commandDeserializer_io_inputData_7 : _GEN_187; // @[Deserializer.scala 75:21]
  assign _GEN_189 = 5'h8 == _T_67 ? commandDeserializer_io_inputData_8 : _GEN_188; // @[Deserializer.scala 75:21]
  assign _GEN_190 = 5'h9 == _T_67 ? commandDeserializer_io_inputData_9 : _GEN_189; // @[Deserializer.scala 75:21]
  assign _GEN_191 = 5'ha == _T_67 ? commandDeserializer_io_inputData_10 : _GEN_190; // @[Deserializer.scala 75:21]
  assign _GEN_192 = 5'hb == _T_67 ? commandDeserializer_io_inputData_11 : _GEN_191; // @[Deserializer.scala 75:21]
  assign _GEN_193 = 5'hc == _T_67 ? commandDeserializer_io_inputData_12 : _GEN_192; // @[Deserializer.scala 75:21]
  assign _GEN_194 = 5'hd == _T_67 ? commandDeserializer_io_inputData_13 : _GEN_193; // @[Deserializer.scala 75:21]
  assign _GEN_195 = 5'he == _T_67 ? commandDeserializer_io_inputData_14 : _GEN_194; // @[Deserializer.scala 75:21]
  assign _GEN_196 = 5'hf == _T_67 ? commandDeserializer_io_inputData_15 : _GEN_195; // @[Deserializer.scala 75:21]
  assign _GEN_197 = 5'h10 == _T_67 ? commandDeserializer_io_inputData_16 : _GEN_196; // @[Deserializer.scala 75:21]
  assign _GEN_198 = 5'h11 == _T_67 ? commandDeserializer_io_inputData_17 : _GEN_197; // @[Deserializer.scala 75:21]
  assign _GEN_199 = 5'h12 == _T_67 ? commandDeserializer_io_inputData_18 : _GEN_198; // @[Deserializer.scala 75:21]
  assign _GEN_200 = 5'h13 == _T_67 ? commandDeserializer_io_inputData_19 : _GEN_199; // @[Deserializer.scala 75:21]
  assign _GEN_201 = 5'h14 == _T_67 ? commandDeserializer_io_inputData_20 : _GEN_200; // @[Deserializer.scala 75:21]
  assign _GEN_202 = 5'h15 == _T_67 ? commandDeserializer_io_inputData_21 : _GEN_201; // @[Deserializer.scala 75:21]
  assign _GEN_203 = 5'h16 == _T_67 ? commandDeserializer_io_inputData_22 : _GEN_202; // @[Deserializer.scala 75:21]
  assign _GEN_204 = 5'h17 == _T_67 ? commandDeserializer_io_inputData_23 : _GEN_203; // @[Deserializer.scala 75:21]
  assign _T_69 = _GEN_204 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_70 = _T_69 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_74 = _T_52 + 5'h2; // @[Deserializer.scala 74:65]
  assign _GEN_737 = {{19'd0}, _T_74}; // @[Deserializer.scala 74:72]
  assign _T_76 = _GEN_737 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_2 = _T_76 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_77 = _GEN_2[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_206 = 5'h1 == _T_77 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_207 = 5'h2 == _T_77 ? commandDeserializer_io_inputData_2 : _GEN_206; // @[Deserializer.scala 75:21]
  assign _GEN_208 = 5'h3 == _T_77 ? commandDeserializer_io_inputData_3 : _GEN_207; // @[Deserializer.scala 75:21]
  assign _GEN_209 = 5'h4 == _T_77 ? commandDeserializer_io_inputData_4 : _GEN_208; // @[Deserializer.scala 75:21]
  assign _GEN_210 = 5'h5 == _T_77 ? commandDeserializer_io_inputData_5 : _GEN_209; // @[Deserializer.scala 75:21]
  assign _GEN_211 = 5'h6 == _T_77 ? commandDeserializer_io_inputData_6 : _GEN_210; // @[Deserializer.scala 75:21]
  assign _GEN_212 = 5'h7 == _T_77 ? commandDeserializer_io_inputData_7 : _GEN_211; // @[Deserializer.scala 75:21]
  assign _GEN_213 = 5'h8 == _T_77 ? commandDeserializer_io_inputData_8 : _GEN_212; // @[Deserializer.scala 75:21]
  assign _GEN_214 = 5'h9 == _T_77 ? commandDeserializer_io_inputData_9 : _GEN_213; // @[Deserializer.scala 75:21]
  assign _GEN_215 = 5'ha == _T_77 ? commandDeserializer_io_inputData_10 : _GEN_214; // @[Deserializer.scala 75:21]
  assign _GEN_216 = 5'hb == _T_77 ? commandDeserializer_io_inputData_11 : _GEN_215; // @[Deserializer.scala 75:21]
  assign _GEN_217 = 5'hc == _T_77 ? commandDeserializer_io_inputData_12 : _GEN_216; // @[Deserializer.scala 75:21]
  assign _GEN_218 = 5'hd == _T_77 ? commandDeserializer_io_inputData_13 : _GEN_217; // @[Deserializer.scala 75:21]
  assign _GEN_219 = 5'he == _T_77 ? commandDeserializer_io_inputData_14 : _GEN_218; // @[Deserializer.scala 75:21]
  assign _GEN_220 = 5'hf == _T_77 ? commandDeserializer_io_inputData_15 : _GEN_219; // @[Deserializer.scala 75:21]
  assign _GEN_221 = 5'h10 == _T_77 ? commandDeserializer_io_inputData_16 : _GEN_220; // @[Deserializer.scala 75:21]
  assign _GEN_222 = 5'h11 == _T_77 ? commandDeserializer_io_inputData_17 : _GEN_221; // @[Deserializer.scala 75:21]
  assign _GEN_223 = 5'h12 == _T_77 ? commandDeserializer_io_inputData_18 : _GEN_222; // @[Deserializer.scala 75:21]
  assign _GEN_224 = 5'h13 == _T_77 ? commandDeserializer_io_inputData_19 : _GEN_223; // @[Deserializer.scala 75:21]
  assign _GEN_225 = 5'h14 == _T_77 ? commandDeserializer_io_inputData_20 : _GEN_224; // @[Deserializer.scala 75:21]
  assign _GEN_226 = 5'h15 == _T_77 ? commandDeserializer_io_inputData_21 : _GEN_225; // @[Deserializer.scala 75:21]
  assign _GEN_227 = 5'h16 == _T_77 ? commandDeserializer_io_inputData_22 : _GEN_226; // @[Deserializer.scala 75:21]
  assign _GEN_228 = 5'h17 == _T_77 ? commandDeserializer_io_inputData_23 : _GEN_227; // @[Deserializer.scala 75:21]
  assign _T_80 = _GEN_228 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_84 = _T_52 + 5'h3; // @[Deserializer.scala 74:65]
  assign _GEN_738 = {{19'd0}, _T_84}; // @[Deserializer.scala 74:72]
  assign _T_86 = _GEN_738 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_3 = _T_86 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_87 = _GEN_3[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_230 = 5'h1 == _T_87 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_231 = 5'h2 == _T_87 ? commandDeserializer_io_inputData_2 : _GEN_230; // @[Deserializer.scala 75:21]
  assign _GEN_232 = 5'h3 == _T_87 ? commandDeserializer_io_inputData_3 : _GEN_231; // @[Deserializer.scala 75:21]
  assign _GEN_233 = 5'h4 == _T_87 ? commandDeserializer_io_inputData_4 : _GEN_232; // @[Deserializer.scala 75:21]
  assign _GEN_234 = 5'h5 == _T_87 ? commandDeserializer_io_inputData_5 : _GEN_233; // @[Deserializer.scala 75:21]
  assign _GEN_235 = 5'h6 == _T_87 ? commandDeserializer_io_inputData_6 : _GEN_234; // @[Deserializer.scala 75:21]
  assign _GEN_236 = 5'h7 == _T_87 ? commandDeserializer_io_inputData_7 : _GEN_235; // @[Deserializer.scala 75:21]
  assign _GEN_237 = 5'h8 == _T_87 ? commandDeserializer_io_inputData_8 : _GEN_236; // @[Deserializer.scala 75:21]
  assign _GEN_238 = 5'h9 == _T_87 ? commandDeserializer_io_inputData_9 : _GEN_237; // @[Deserializer.scala 75:21]
  assign _GEN_239 = 5'ha == _T_87 ? commandDeserializer_io_inputData_10 : _GEN_238; // @[Deserializer.scala 75:21]
  assign _GEN_240 = 5'hb == _T_87 ? commandDeserializer_io_inputData_11 : _GEN_239; // @[Deserializer.scala 75:21]
  assign _GEN_241 = 5'hc == _T_87 ? commandDeserializer_io_inputData_12 : _GEN_240; // @[Deserializer.scala 75:21]
  assign _GEN_242 = 5'hd == _T_87 ? commandDeserializer_io_inputData_13 : _GEN_241; // @[Deserializer.scala 75:21]
  assign _GEN_243 = 5'he == _T_87 ? commandDeserializer_io_inputData_14 : _GEN_242; // @[Deserializer.scala 75:21]
  assign _GEN_244 = 5'hf == _T_87 ? commandDeserializer_io_inputData_15 : _GEN_243; // @[Deserializer.scala 75:21]
  assign _GEN_245 = 5'h10 == _T_87 ? commandDeserializer_io_inputData_16 : _GEN_244; // @[Deserializer.scala 75:21]
  assign _GEN_246 = 5'h11 == _T_87 ? commandDeserializer_io_inputData_17 : _GEN_245; // @[Deserializer.scala 75:21]
  assign _GEN_247 = 5'h12 == _T_87 ? commandDeserializer_io_inputData_18 : _GEN_246; // @[Deserializer.scala 75:21]
  assign _GEN_248 = 5'h13 == _T_87 ? commandDeserializer_io_inputData_19 : _GEN_247; // @[Deserializer.scala 75:21]
  assign _GEN_249 = 5'h14 == _T_87 ? commandDeserializer_io_inputData_20 : _GEN_248; // @[Deserializer.scala 75:21]
  assign _GEN_250 = 5'h15 == _T_87 ? commandDeserializer_io_inputData_21 : _GEN_249; // @[Deserializer.scala 75:21]
  assign _GEN_251 = 5'h16 == _T_87 ? commandDeserializer_io_inputData_22 : _GEN_250; // @[Deserializer.scala 75:21]
  assign _GEN_252 = 5'h17 == _T_87 ? commandDeserializer_io_inputData_23 : _GEN_251; // @[Deserializer.scala 75:21]
  assign _T_90 = _GEN_252 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_94 = _T_52 + 5'h4; // @[Deserializer.scala 74:65]
  assign _GEN_739 = {{19'd0}, _T_94}; // @[Deserializer.scala 74:72]
  assign _T_96 = _GEN_739 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_4 = _T_96 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_97 = _GEN_4[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_254 = 5'h1 == _T_97 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_255 = 5'h2 == _T_97 ? commandDeserializer_io_inputData_2 : _GEN_254; // @[Deserializer.scala 75:21]
  assign _GEN_256 = 5'h3 == _T_97 ? commandDeserializer_io_inputData_3 : _GEN_255; // @[Deserializer.scala 75:21]
  assign _GEN_257 = 5'h4 == _T_97 ? commandDeserializer_io_inputData_4 : _GEN_256; // @[Deserializer.scala 75:21]
  assign _GEN_258 = 5'h5 == _T_97 ? commandDeserializer_io_inputData_5 : _GEN_257; // @[Deserializer.scala 75:21]
  assign _GEN_259 = 5'h6 == _T_97 ? commandDeserializer_io_inputData_6 : _GEN_258; // @[Deserializer.scala 75:21]
  assign _GEN_260 = 5'h7 == _T_97 ? commandDeserializer_io_inputData_7 : _GEN_259; // @[Deserializer.scala 75:21]
  assign _GEN_261 = 5'h8 == _T_97 ? commandDeserializer_io_inputData_8 : _GEN_260; // @[Deserializer.scala 75:21]
  assign _GEN_262 = 5'h9 == _T_97 ? commandDeserializer_io_inputData_9 : _GEN_261; // @[Deserializer.scala 75:21]
  assign _GEN_263 = 5'ha == _T_97 ? commandDeserializer_io_inputData_10 : _GEN_262; // @[Deserializer.scala 75:21]
  assign _GEN_264 = 5'hb == _T_97 ? commandDeserializer_io_inputData_11 : _GEN_263; // @[Deserializer.scala 75:21]
  assign _GEN_265 = 5'hc == _T_97 ? commandDeserializer_io_inputData_12 : _GEN_264; // @[Deserializer.scala 75:21]
  assign _GEN_266 = 5'hd == _T_97 ? commandDeserializer_io_inputData_13 : _GEN_265; // @[Deserializer.scala 75:21]
  assign _GEN_267 = 5'he == _T_97 ? commandDeserializer_io_inputData_14 : _GEN_266; // @[Deserializer.scala 75:21]
  assign _GEN_268 = 5'hf == _T_97 ? commandDeserializer_io_inputData_15 : _GEN_267; // @[Deserializer.scala 75:21]
  assign _GEN_269 = 5'h10 == _T_97 ? commandDeserializer_io_inputData_16 : _GEN_268; // @[Deserializer.scala 75:21]
  assign _GEN_270 = 5'h11 == _T_97 ? commandDeserializer_io_inputData_17 : _GEN_269; // @[Deserializer.scala 75:21]
  assign _GEN_271 = 5'h12 == _T_97 ? commandDeserializer_io_inputData_18 : _GEN_270; // @[Deserializer.scala 75:21]
  assign _GEN_272 = 5'h13 == _T_97 ? commandDeserializer_io_inputData_19 : _GEN_271; // @[Deserializer.scala 75:21]
  assign _GEN_273 = 5'h14 == _T_97 ? commandDeserializer_io_inputData_20 : _GEN_272; // @[Deserializer.scala 75:21]
  assign _GEN_274 = 5'h15 == _T_97 ? commandDeserializer_io_inputData_21 : _GEN_273; // @[Deserializer.scala 75:21]
  assign _GEN_275 = 5'h16 == _T_97 ? commandDeserializer_io_inputData_22 : _GEN_274; // @[Deserializer.scala 75:21]
  assign _GEN_276 = 5'h17 == _T_97 ? commandDeserializer_io_inputData_23 : _GEN_275; // @[Deserializer.scala 75:21]
  assign _T_100 = _GEN_276 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_104 = _T_52 + 5'h5; // @[Deserializer.scala 74:65]
  assign _GEN_740 = {{19'd0}, _T_104}; // @[Deserializer.scala 74:72]
  assign _T_106 = _GEN_740 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_5 = _T_106 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_107 = _GEN_5[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_278 = 5'h1 == _T_107 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_279 = 5'h2 == _T_107 ? commandDeserializer_io_inputData_2 : _GEN_278; // @[Deserializer.scala 75:21]
  assign _GEN_280 = 5'h3 == _T_107 ? commandDeserializer_io_inputData_3 : _GEN_279; // @[Deserializer.scala 75:21]
  assign _GEN_281 = 5'h4 == _T_107 ? commandDeserializer_io_inputData_4 : _GEN_280; // @[Deserializer.scala 75:21]
  assign _GEN_282 = 5'h5 == _T_107 ? commandDeserializer_io_inputData_5 : _GEN_281; // @[Deserializer.scala 75:21]
  assign _GEN_283 = 5'h6 == _T_107 ? commandDeserializer_io_inputData_6 : _GEN_282; // @[Deserializer.scala 75:21]
  assign _GEN_284 = 5'h7 == _T_107 ? commandDeserializer_io_inputData_7 : _GEN_283; // @[Deserializer.scala 75:21]
  assign _GEN_285 = 5'h8 == _T_107 ? commandDeserializer_io_inputData_8 : _GEN_284; // @[Deserializer.scala 75:21]
  assign _GEN_286 = 5'h9 == _T_107 ? commandDeserializer_io_inputData_9 : _GEN_285; // @[Deserializer.scala 75:21]
  assign _GEN_287 = 5'ha == _T_107 ? commandDeserializer_io_inputData_10 : _GEN_286; // @[Deserializer.scala 75:21]
  assign _GEN_288 = 5'hb == _T_107 ? commandDeserializer_io_inputData_11 : _GEN_287; // @[Deserializer.scala 75:21]
  assign _GEN_289 = 5'hc == _T_107 ? commandDeserializer_io_inputData_12 : _GEN_288; // @[Deserializer.scala 75:21]
  assign _GEN_290 = 5'hd == _T_107 ? commandDeserializer_io_inputData_13 : _GEN_289; // @[Deserializer.scala 75:21]
  assign _GEN_291 = 5'he == _T_107 ? commandDeserializer_io_inputData_14 : _GEN_290; // @[Deserializer.scala 75:21]
  assign _GEN_292 = 5'hf == _T_107 ? commandDeserializer_io_inputData_15 : _GEN_291; // @[Deserializer.scala 75:21]
  assign _GEN_293 = 5'h10 == _T_107 ? commandDeserializer_io_inputData_16 : _GEN_292; // @[Deserializer.scala 75:21]
  assign _GEN_294 = 5'h11 == _T_107 ? commandDeserializer_io_inputData_17 : _GEN_293; // @[Deserializer.scala 75:21]
  assign _GEN_295 = 5'h12 == _T_107 ? commandDeserializer_io_inputData_18 : _GEN_294; // @[Deserializer.scala 75:21]
  assign _GEN_296 = 5'h13 == _T_107 ? commandDeserializer_io_inputData_19 : _GEN_295; // @[Deserializer.scala 75:21]
  assign _GEN_297 = 5'h14 == _T_107 ? commandDeserializer_io_inputData_20 : _GEN_296; // @[Deserializer.scala 75:21]
  assign _GEN_298 = 5'h15 == _T_107 ? commandDeserializer_io_inputData_21 : _GEN_297; // @[Deserializer.scala 75:21]
  assign _GEN_299 = 5'h16 == _T_107 ? commandDeserializer_io_inputData_22 : _GEN_298; // @[Deserializer.scala 75:21]
  assign _GEN_300 = 5'h17 == _T_107 ? commandDeserializer_io_inputData_23 : _GEN_299; // @[Deserializer.scala 75:21]
  assign _T_110 = _GEN_300 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_114 = _T_52 + 5'h6; // @[Deserializer.scala 74:65]
  assign _GEN_741 = {{19'd0}, _T_114}; // @[Deserializer.scala 74:72]
  assign _T_116 = _GEN_741 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_6 = _T_116 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_117 = _GEN_6[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_302 = 5'h1 == _T_117 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_303 = 5'h2 == _T_117 ? commandDeserializer_io_inputData_2 : _GEN_302; // @[Deserializer.scala 75:21]
  assign _GEN_304 = 5'h3 == _T_117 ? commandDeserializer_io_inputData_3 : _GEN_303; // @[Deserializer.scala 75:21]
  assign _GEN_305 = 5'h4 == _T_117 ? commandDeserializer_io_inputData_4 : _GEN_304; // @[Deserializer.scala 75:21]
  assign _GEN_306 = 5'h5 == _T_117 ? commandDeserializer_io_inputData_5 : _GEN_305; // @[Deserializer.scala 75:21]
  assign _GEN_307 = 5'h6 == _T_117 ? commandDeserializer_io_inputData_6 : _GEN_306; // @[Deserializer.scala 75:21]
  assign _GEN_308 = 5'h7 == _T_117 ? commandDeserializer_io_inputData_7 : _GEN_307; // @[Deserializer.scala 75:21]
  assign _GEN_309 = 5'h8 == _T_117 ? commandDeserializer_io_inputData_8 : _GEN_308; // @[Deserializer.scala 75:21]
  assign _GEN_310 = 5'h9 == _T_117 ? commandDeserializer_io_inputData_9 : _GEN_309; // @[Deserializer.scala 75:21]
  assign _GEN_311 = 5'ha == _T_117 ? commandDeserializer_io_inputData_10 : _GEN_310; // @[Deserializer.scala 75:21]
  assign _GEN_312 = 5'hb == _T_117 ? commandDeserializer_io_inputData_11 : _GEN_311; // @[Deserializer.scala 75:21]
  assign _GEN_313 = 5'hc == _T_117 ? commandDeserializer_io_inputData_12 : _GEN_312; // @[Deserializer.scala 75:21]
  assign _GEN_314 = 5'hd == _T_117 ? commandDeserializer_io_inputData_13 : _GEN_313; // @[Deserializer.scala 75:21]
  assign _GEN_315 = 5'he == _T_117 ? commandDeserializer_io_inputData_14 : _GEN_314; // @[Deserializer.scala 75:21]
  assign _GEN_316 = 5'hf == _T_117 ? commandDeserializer_io_inputData_15 : _GEN_315; // @[Deserializer.scala 75:21]
  assign _GEN_317 = 5'h10 == _T_117 ? commandDeserializer_io_inputData_16 : _GEN_316; // @[Deserializer.scala 75:21]
  assign _GEN_318 = 5'h11 == _T_117 ? commandDeserializer_io_inputData_17 : _GEN_317; // @[Deserializer.scala 75:21]
  assign _GEN_319 = 5'h12 == _T_117 ? commandDeserializer_io_inputData_18 : _GEN_318; // @[Deserializer.scala 75:21]
  assign _GEN_320 = 5'h13 == _T_117 ? commandDeserializer_io_inputData_19 : _GEN_319; // @[Deserializer.scala 75:21]
  assign _GEN_321 = 5'h14 == _T_117 ? commandDeserializer_io_inputData_20 : _GEN_320; // @[Deserializer.scala 75:21]
  assign _GEN_322 = 5'h15 == _T_117 ? commandDeserializer_io_inputData_21 : _GEN_321; // @[Deserializer.scala 75:21]
  assign _GEN_323 = 5'h16 == _T_117 ? commandDeserializer_io_inputData_22 : _GEN_322; // @[Deserializer.scala 75:21]
  assign _GEN_324 = 5'h17 == _T_117 ? commandDeserializer_io_inputData_23 : _GEN_323; // @[Deserializer.scala 75:21]
  assign _T_120 = _GEN_324 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_124 = _T_52 + 5'h7; // @[Deserializer.scala 74:65]
  assign _GEN_742 = {{19'd0}, _T_124}; // @[Deserializer.scala 74:72]
  assign _T_126 = _GEN_742 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_7 = _T_126 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_127 = _GEN_7[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_326 = 5'h1 == _T_127 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_327 = 5'h2 == _T_127 ? commandDeserializer_io_inputData_2 : _GEN_326; // @[Deserializer.scala 75:21]
  assign _GEN_328 = 5'h3 == _T_127 ? commandDeserializer_io_inputData_3 : _GEN_327; // @[Deserializer.scala 75:21]
  assign _GEN_329 = 5'h4 == _T_127 ? commandDeserializer_io_inputData_4 : _GEN_328; // @[Deserializer.scala 75:21]
  assign _GEN_330 = 5'h5 == _T_127 ? commandDeserializer_io_inputData_5 : _GEN_329; // @[Deserializer.scala 75:21]
  assign _GEN_331 = 5'h6 == _T_127 ? commandDeserializer_io_inputData_6 : _GEN_330; // @[Deserializer.scala 75:21]
  assign _GEN_332 = 5'h7 == _T_127 ? commandDeserializer_io_inputData_7 : _GEN_331; // @[Deserializer.scala 75:21]
  assign _GEN_333 = 5'h8 == _T_127 ? commandDeserializer_io_inputData_8 : _GEN_332; // @[Deserializer.scala 75:21]
  assign _GEN_334 = 5'h9 == _T_127 ? commandDeserializer_io_inputData_9 : _GEN_333; // @[Deserializer.scala 75:21]
  assign _GEN_335 = 5'ha == _T_127 ? commandDeserializer_io_inputData_10 : _GEN_334; // @[Deserializer.scala 75:21]
  assign _GEN_336 = 5'hb == _T_127 ? commandDeserializer_io_inputData_11 : _GEN_335; // @[Deserializer.scala 75:21]
  assign _GEN_337 = 5'hc == _T_127 ? commandDeserializer_io_inputData_12 : _GEN_336; // @[Deserializer.scala 75:21]
  assign _GEN_338 = 5'hd == _T_127 ? commandDeserializer_io_inputData_13 : _GEN_337; // @[Deserializer.scala 75:21]
  assign _GEN_339 = 5'he == _T_127 ? commandDeserializer_io_inputData_14 : _GEN_338; // @[Deserializer.scala 75:21]
  assign _GEN_340 = 5'hf == _T_127 ? commandDeserializer_io_inputData_15 : _GEN_339; // @[Deserializer.scala 75:21]
  assign _GEN_341 = 5'h10 == _T_127 ? commandDeserializer_io_inputData_16 : _GEN_340; // @[Deserializer.scala 75:21]
  assign _GEN_342 = 5'h11 == _T_127 ? commandDeserializer_io_inputData_17 : _GEN_341; // @[Deserializer.scala 75:21]
  assign _GEN_343 = 5'h12 == _T_127 ? commandDeserializer_io_inputData_18 : _GEN_342; // @[Deserializer.scala 75:21]
  assign _GEN_344 = 5'h13 == _T_127 ? commandDeserializer_io_inputData_19 : _GEN_343; // @[Deserializer.scala 75:21]
  assign _GEN_345 = 5'h14 == _T_127 ? commandDeserializer_io_inputData_20 : _GEN_344; // @[Deserializer.scala 75:21]
  assign _GEN_346 = 5'h15 == _T_127 ? commandDeserializer_io_inputData_21 : _GEN_345; // @[Deserializer.scala 75:21]
  assign _GEN_347 = 5'h16 == _T_127 ? commandDeserializer_io_inputData_22 : _GEN_346; // @[Deserializer.scala 75:21]
  assign _GEN_348 = 5'h17 == _T_127 ? commandDeserializer_io_inputData_23 : _GEN_347; // @[Deserializer.scala 75:21]
  assign _T_130 = _GEN_348 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_134 = _T_52 + 5'h8; // @[Deserializer.scala 74:65]
  assign _GEN_743 = {{19'd0}, _T_134}; // @[Deserializer.scala 74:72]
  assign _T_136 = _GEN_743 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_8 = _T_136 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_137 = _GEN_8[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_350 = 5'h1 == _T_137 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_351 = 5'h2 == _T_137 ? commandDeserializer_io_inputData_2 : _GEN_350; // @[Deserializer.scala 75:21]
  assign _GEN_352 = 5'h3 == _T_137 ? commandDeserializer_io_inputData_3 : _GEN_351; // @[Deserializer.scala 75:21]
  assign _GEN_353 = 5'h4 == _T_137 ? commandDeserializer_io_inputData_4 : _GEN_352; // @[Deserializer.scala 75:21]
  assign _GEN_354 = 5'h5 == _T_137 ? commandDeserializer_io_inputData_5 : _GEN_353; // @[Deserializer.scala 75:21]
  assign _GEN_355 = 5'h6 == _T_137 ? commandDeserializer_io_inputData_6 : _GEN_354; // @[Deserializer.scala 75:21]
  assign _GEN_356 = 5'h7 == _T_137 ? commandDeserializer_io_inputData_7 : _GEN_355; // @[Deserializer.scala 75:21]
  assign _GEN_357 = 5'h8 == _T_137 ? commandDeserializer_io_inputData_8 : _GEN_356; // @[Deserializer.scala 75:21]
  assign _GEN_358 = 5'h9 == _T_137 ? commandDeserializer_io_inputData_9 : _GEN_357; // @[Deserializer.scala 75:21]
  assign _GEN_359 = 5'ha == _T_137 ? commandDeserializer_io_inputData_10 : _GEN_358; // @[Deserializer.scala 75:21]
  assign _GEN_360 = 5'hb == _T_137 ? commandDeserializer_io_inputData_11 : _GEN_359; // @[Deserializer.scala 75:21]
  assign _GEN_361 = 5'hc == _T_137 ? commandDeserializer_io_inputData_12 : _GEN_360; // @[Deserializer.scala 75:21]
  assign _GEN_362 = 5'hd == _T_137 ? commandDeserializer_io_inputData_13 : _GEN_361; // @[Deserializer.scala 75:21]
  assign _GEN_363 = 5'he == _T_137 ? commandDeserializer_io_inputData_14 : _GEN_362; // @[Deserializer.scala 75:21]
  assign _GEN_364 = 5'hf == _T_137 ? commandDeserializer_io_inputData_15 : _GEN_363; // @[Deserializer.scala 75:21]
  assign _GEN_365 = 5'h10 == _T_137 ? commandDeserializer_io_inputData_16 : _GEN_364; // @[Deserializer.scala 75:21]
  assign _GEN_366 = 5'h11 == _T_137 ? commandDeserializer_io_inputData_17 : _GEN_365; // @[Deserializer.scala 75:21]
  assign _GEN_367 = 5'h12 == _T_137 ? commandDeserializer_io_inputData_18 : _GEN_366; // @[Deserializer.scala 75:21]
  assign _GEN_368 = 5'h13 == _T_137 ? commandDeserializer_io_inputData_19 : _GEN_367; // @[Deserializer.scala 75:21]
  assign _GEN_369 = 5'h14 == _T_137 ? commandDeserializer_io_inputData_20 : _GEN_368; // @[Deserializer.scala 75:21]
  assign _GEN_370 = 5'h15 == _T_137 ? commandDeserializer_io_inputData_21 : _GEN_369; // @[Deserializer.scala 75:21]
  assign _GEN_371 = 5'h16 == _T_137 ? commandDeserializer_io_inputData_22 : _GEN_370; // @[Deserializer.scala 75:21]
  assign _GEN_372 = 5'h17 == _T_137 ? commandDeserializer_io_inputData_23 : _GEN_371; // @[Deserializer.scala 75:21]
  assign _T_140 = _GEN_372 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_144 = _T_52 + 5'h9; // @[Deserializer.scala 74:65]
  assign _GEN_744 = {{19'd0}, _T_144}; // @[Deserializer.scala 74:72]
  assign _T_146 = _GEN_744 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_9 = _T_146 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_147 = _GEN_9[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_374 = 5'h1 == _T_147 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_375 = 5'h2 == _T_147 ? commandDeserializer_io_inputData_2 : _GEN_374; // @[Deserializer.scala 75:21]
  assign _GEN_376 = 5'h3 == _T_147 ? commandDeserializer_io_inputData_3 : _GEN_375; // @[Deserializer.scala 75:21]
  assign _GEN_377 = 5'h4 == _T_147 ? commandDeserializer_io_inputData_4 : _GEN_376; // @[Deserializer.scala 75:21]
  assign _GEN_378 = 5'h5 == _T_147 ? commandDeserializer_io_inputData_5 : _GEN_377; // @[Deserializer.scala 75:21]
  assign _GEN_379 = 5'h6 == _T_147 ? commandDeserializer_io_inputData_6 : _GEN_378; // @[Deserializer.scala 75:21]
  assign _GEN_380 = 5'h7 == _T_147 ? commandDeserializer_io_inputData_7 : _GEN_379; // @[Deserializer.scala 75:21]
  assign _GEN_381 = 5'h8 == _T_147 ? commandDeserializer_io_inputData_8 : _GEN_380; // @[Deserializer.scala 75:21]
  assign _GEN_382 = 5'h9 == _T_147 ? commandDeserializer_io_inputData_9 : _GEN_381; // @[Deserializer.scala 75:21]
  assign _GEN_383 = 5'ha == _T_147 ? commandDeserializer_io_inputData_10 : _GEN_382; // @[Deserializer.scala 75:21]
  assign _GEN_384 = 5'hb == _T_147 ? commandDeserializer_io_inputData_11 : _GEN_383; // @[Deserializer.scala 75:21]
  assign _GEN_385 = 5'hc == _T_147 ? commandDeserializer_io_inputData_12 : _GEN_384; // @[Deserializer.scala 75:21]
  assign _GEN_386 = 5'hd == _T_147 ? commandDeserializer_io_inputData_13 : _GEN_385; // @[Deserializer.scala 75:21]
  assign _GEN_387 = 5'he == _T_147 ? commandDeserializer_io_inputData_14 : _GEN_386; // @[Deserializer.scala 75:21]
  assign _GEN_388 = 5'hf == _T_147 ? commandDeserializer_io_inputData_15 : _GEN_387; // @[Deserializer.scala 75:21]
  assign _GEN_389 = 5'h10 == _T_147 ? commandDeserializer_io_inputData_16 : _GEN_388; // @[Deserializer.scala 75:21]
  assign _GEN_390 = 5'h11 == _T_147 ? commandDeserializer_io_inputData_17 : _GEN_389; // @[Deserializer.scala 75:21]
  assign _GEN_391 = 5'h12 == _T_147 ? commandDeserializer_io_inputData_18 : _GEN_390; // @[Deserializer.scala 75:21]
  assign _GEN_392 = 5'h13 == _T_147 ? commandDeserializer_io_inputData_19 : _GEN_391; // @[Deserializer.scala 75:21]
  assign _GEN_393 = 5'h14 == _T_147 ? commandDeserializer_io_inputData_20 : _GEN_392; // @[Deserializer.scala 75:21]
  assign _GEN_394 = 5'h15 == _T_147 ? commandDeserializer_io_inputData_21 : _GEN_393; // @[Deserializer.scala 75:21]
  assign _GEN_395 = 5'h16 == _T_147 ? commandDeserializer_io_inputData_22 : _GEN_394; // @[Deserializer.scala 75:21]
  assign _GEN_396 = 5'h17 == _T_147 ? commandDeserializer_io_inputData_23 : _GEN_395; // @[Deserializer.scala 75:21]
  assign _T_150 = _GEN_396 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_154 = _T_52 + 5'ha; // @[Deserializer.scala 74:65]
  assign _GEN_745 = {{19'd0}, _T_154}; // @[Deserializer.scala 74:72]
  assign _T_156 = _GEN_745 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_10 = _T_156 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_157 = _GEN_10[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_398 = 5'h1 == _T_157 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_399 = 5'h2 == _T_157 ? commandDeserializer_io_inputData_2 : _GEN_398; // @[Deserializer.scala 75:21]
  assign _GEN_400 = 5'h3 == _T_157 ? commandDeserializer_io_inputData_3 : _GEN_399; // @[Deserializer.scala 75:21]
  assign _GEN_401 = 5'h4 == _T_157 ? commandDeserializer_io_inputData_4 : _GEN_400; // @[Deserializer.scala 75:21]
  assign _GEN_402 = 5'h5 == _T_157 ? commandDeserializer_io_inputData_5 : _GEN_401; // @[Deserializer.scala 75:21]
  assign _GEN_403 = 5'h6 == _T_157 ? commandDeserializer_io_inputData_6 : _GEN_402; // @[Deserializer.scala 75:21]
  assign _GEN_404 = 5'h7 == _T_157 ? commandDeserializer_io_inputData_7 : _GEN_403; // @[Deserializer.scala 75:21]
  assign _GEN_405 = 5'h8 == _T_157 ? commandDeserializer_io_inputData_8 : _GEN_404; // @[Deserializer.scala 75:21]
  assign _GEN_406 = 5'h9 == _T_157 ? commandDeserializer_io_inputData_9 : _GEN_405; // @[Deserializer.scala 75:21]
  assign _GEN_407 = 5'ha == _T_157 ? commandDeserializer_io_inputData_10 : _GEN_406; // @[Deserializer.scala 75:21]
  assign _GEN_408 = 5'hb == _T_157 ? commandDeserializer_io_inputData_11 : _GEN_407; // @[Deserializer.scala 75:21]
  assign _GEN_409 = 5'hc == _T_157 ? commandDeserializer_io_inputData_12 : _GEN_408; // @[Deserializer.scala 75:21]
  assign _GEN_410 = 5'hd == _T_157 ? commandDeserializer_io_inputData_13 : _GEN_409; // @[Deserializer.scala 75:21]
  assign _GEN_411 = 5'he == _T_157 ? commandDeserializer_io_inputData_14 : _GEN_410; // @[Deserializer.scala 75:21]
  assign _GEN_412 = 5'hf == _T_157 ? commandDeserializer_io_inputData_15 : _GEN_411; // @[Deserializer.scala 75:21]
  assign _GEN_413 = 5'h10 == _T_157 ? commandDeserializer_io_inputData_16 : _GEN_412; // @[Deserializer.scala 75:21]
  assign _GEN_414 = 5'h11 == _T_157 ? commandDeserializer_io_inputData_17 : _GEN_413; // @[Deserializer.scala 75:21]
  assign _GEN_415 = 5'h12 == _T_157 ? commandDeserializer_io_inputData_18 : _GEN_414; // @[Deserializer.scala 75:21]
  assign _GEN_416 = 5'h13 == _T_157 ? commandDeserializer_io_inputData_19 : _GEN_415; // @[Deserializer.scala 75:21]
  assign _GEN_417 = 5'h14 == _T_157 ? commandDeserializer_io_inputData_20 : _GEN_416; // @[Deserializer.scala 75:21]
  assign _GEN_418 = 5'h15 == _T_157 ? commandDeserializer_io_inputData_21 : _GEN_417; // @[Deserializer.scala 75:21]
  assign _GEN_419 = 5'h16 == _T_157 ? commandDeserializer_io_inputData_22 : _GEN_418; // @[Deserializer.scala 75:21]
  assign _GEN_420 = 5'h17 == _T_157 ? commandDeserializer_io_inputData_23 : _GEN_419; // @[Deserializer.scala 75:21]
  assign _T_160 = _GEN_420 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_164 = _T_52 + 5'hb; // @[Deserializer.scala 74:65]
  assign _GEN_746 = {{19'd0}, _T_164}; // @[Deserializer.scala 74:72]
  assign _T_166 = _GEN_746 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_11 = _T_166 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_167 = _GEN_11[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_422 = 5'h1 == _T_167 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_423 = 5'h2 == _T_167 ? commandDeserializer_io_inputData_2 : _GEN_422; // @[Deserializer.scala 75:21]
  assign _GEN_424 = 5'h3 == _T_167 ? commandDeserializer_io_inputData_3 : _GEN_423; // @[Deserializer.scala 75:21]
  assign _GEN_425 = 5'h4 == _T_167 ? commandDeserializer_io_inputData_4 : _GEN_424; // @[Deserializer.scala 75:21]
  assign _GEN_426 = 5'h5 == _T_167 ? commandDeserializer_io_inputData_5 : _GEN_425; // @[Deserializer.scala 75:21]
  assign _GEN_427 = 5'h6 == _T_167 ? commandDeserializer_io_inputData_6 : _GEN_426; // @[Deserializer.scala 75:21]
  assign _GEN_428 = 5'h7 == _T_167 ? commandDeserializer_io_inputData_7 : _GEN_427; // @[Deserializer.scala 75:21]
  assign _GEN_429 = 5'h8 == _T_167 ? commandDeserializer_io_inputData_8 : _GEN_428; // @[Deserializer.scala 75:21]
  assign _GEN_430 = 5'h9 == _T_167 ? commandDeserializer_io_inputData_9 : _GEN_429; // @[Deserializer.scala 75:21]
  assign _GEN_431 = 5'ha == _T_167 ? commandDeserializer_io_inputData_10 : _GEN_430; // @[Deserializer.scala 75:21]
  assign _GEN_432 = 5'hb == _T_167 ? commandDeserializer_io_inputData_11 : _GEN_431; // @[Deserializer.scala 75:21]
  assign _GEN_433 = 5'hc == _T_167 ? commandDeserializer_io_inputData_12 : _GEN_432; // @[Deserializer.scala 75:21]
  assign _GEN_434 = 5'hd == _T_167 ? commandDeserializer_io_inputData_13 : _GEN_433; // @[Deserializer.scala 75:21]
  assign _GEN_435 = 5'he == _T_167 ? commandDeserializer_io_inputData_14 : _GEN_434; // @[Deserializer.scala 75:21]
  assign _GEN_436 = 5'hf == _T_167 ? commandDeserializer_io_inputData_15 : _GEN_435; // @[Deserializer.scala 75:21]
  assign _GEN_437 = 5'h10 == _T_167 ? commandDeserializer_io_inputData_16 : _GEN_436; // @[Deserializer.scala 75:21]
  assign _GEN_438 = 5'h11 == _T_167 ? commandDeserializer_io_inputData_17 : _GEN_437; // @[Deserializer.scala 75:21]
  assign _GEN_439 = 5'h12 == _T_167 ? commandDeserializer_io_inputData_18 : _GEN_438; // @[Deserializer.scala 75:21]
  assign _GEN_440 = 5'h13 == _T_167 ? commandDeserializer_io_inputData_19 : _GEN_439; // @[Deserializer.scala 75:21]
  assign _GEN_441 = 5'h14 == _T_167 ? commandDeserializer_io_inputData_20 : _GEN_440; // @[Deserializer.scala 75:21]
  assign _GEN_442 = 5'h15 == _T_167 ? commandDeserializer_io_inputData_21 : _GEN_441; // @[Deserializer.scala 75:21]
  assign _GEN_443 = 5'h16 == _T_167 ? commandDeserializer_io_inputData_22 : _GEN_442; // @[Deserializer.scala 75:21]
  assign _GEN_444 = 5'h17 == _T_167 ? commandDeserializer_io_inputData_23 : _GEN_443; // @[Deserializer.scala 75:21]
  assign _T_170 = _GEN_444 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_174 = _T_52 + 5'hc; // @[Deserializer.scala 74:65]
  assign _GEN_747 = {{19'd0}, _T_174}; // @[Deserializer.scala 74:72]
  assign _T_176 = _GEN_747 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_12 = _T_176 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_177 = _GEN_12[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_446 = 5'h1 == _T_177 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_447 = 5'h2 == _T_177 ? commandDeserializer_io_inputData_2 : _GEN_446; // @[Deserializer.scala 75:21]
  assign _GEN_448 = 5'h3 == _T_177 ? commandDeserializer_io_inputData_3 : _GEN_447; // @[Deserializer.scala 75:21]
  assign _GEN_449 = 5'h4 == _T_177 ? commandDeserializer_io_inputData_4 : _GEN_448; // @[Deserializer.scala 75:21]
  assign _GEN_450 = 5'h5 == _T_177 ? commandDeserializer_io_inputData_5 : _GEN_449; // @[Deserializer.scala 75:21]
  assign _GEN_451 = 5'h6 == _T_177 ? commandDeserializer_io_inputData_6 : _GEN_450; // @[Deserializer.scala 75:21]
  assign _GEN_452 = 5'h7 == _T_177 ? commandDeserializer_io_inputData_7 : _GEN_451; // @[Deserializer.scala 75:21]
  assign _GEN_453 = 5'h8 == _T_177 ? commandDeserializer_io_inputData_8 : _GEN_452; // @[Deserializer.scala 75:21]
  assign _GEN_454 = 5'h9 == _T_177 ? commandDeserializer_io_inputData_9 : _GEN_453; // @[Deserializer.scala 75:21]
  assign _GEN_455 = 5'ha == _T_177 ? commandDeserializer_io_inputData_10 : _GEN_454; // @[Deserializer.scala 75:21]
  assign _GEN_456 = 5'hb == _T_177 ? commandDeserializer_io_inputData_11 : _GEN_455; // @[Deserializer.scala 75:21]
  assign _GEN_457 = 5'hc == _T_177 ? commandDeserializer_io_inputData_12 : _GEN_456; // @[Deserializer.scala 75:21]
  assign _GEN_458 = 5'hd == _T_177 ? commandDeserializer_io_inputData_13 : _GEN_457; // @[Deserializer.scala 75:21]
  assign _GEN_459 = 5'he == _T_177 ? commandDeserializer_io_inputData_14 : _GEN_458; // @[Deserializer.scala 75:21]
  assign _GEN_460 = 5'hf == _T_177 ? commandDeserializer_io_inputData_15 : _GEN_459; // @[Deserializer.scala 75:21]
  assign _GEN_461 = 5'h10 == _T_177 ? commandDeserializer_io_inputData_16 : _GEN_460; // @[Deserializer.scala 75:21]
  assign _GEN_462 = 5'h11 == _T_177 ? commandDeserializer_io_inputData_17 : _GEN_461; // @[Deserializer.scala 75:21]
  assign _GEN_463 = 5'h12 == _T_177 ? commandDeserializer_io_inputData_18 : _GEN_462; // @[Deserializer.scala 75:21]
  assign _GEN_464 = 5'h13 == _T_177 ? commandDeserializer_io_inputData_19 : _GEN_463; // @[Deserializer.scala 75:21]
  assign _GEN_465 = 5'h14 == _T_177 ? commandDeserializer_io_inputData_20 : _GEN_464; // @[Deserializer.scala 75:21]
  assign _GEN_466 = 5'h15 == _T_177 ? commandDeserializer_io_inputData_21 : _GEN_465; // @[Deserializer.scala 75:21]
  assign _GEN_467 = 5'h16 == _T_177 ? commandDeserializer_io_inputData_22 : _GEN_466; // @[Deserializer.scala 75:21]
  assign _GEN_468 = 5'h17 == _T_177 ? commandDeserializer_io_inputData_23 : _GEN_467; // @[Deserializer.scala 75:21]
  assign _T_180 = _GEN_468 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_184 = _T_52 + 5'hd; // @[Deserializer.scala 74:65]
  assign _GEN_748 = {{19'd0}, _T_184}; // @[Deserializer.scala 74:72]
  assign _T_186 = _GEN_748 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_13 = _T_186 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_187 = _GEN_13[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_470 = 5'h1 == _T_187 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_471 = 5'h2 == _T_187 ? commandDeserializer_io_inputData_2 : _GEN_470; // @[Deserializer.scala 75:21]
  assign _GEN_472 = 5'h3 == _T_187 ? commandDeserializer_io_inputData_3 : _GEN_471; // @[Deserializer.scala 75:21]
  assign _GEN_473 = 5'h4 == _T_187 ? commandDeserializer_io_inputData_4 : _GEN_472; // @[Deserializer.scala 75:21]
  assign _GEN_474 = 5'h5 == _T_187 ? commandDeserializer_io_inputData_5 : _GEN_473; // @[Deserializer.scala 75:21]
  assign _GEN_475 = 5'h6 == _T_187 ? commandDeserializer_io_inputData_6 : _GEN_474; // @[Deserializer.scala 75:21]
  assign _GEN_476 = 5'h7 == _T_187 ? commandDeserializer_io_inputData_7 : _GEN_475; // @[Deserializer.scala 75:21]
  assign _GEN_477 = 5'h8 == _T_187 ? commandDeserializer_io_inputData_8 : _GEN_476; // @[Deserializer.scala 75:21]
  assign _GEN_478 = 5'h9 == _T_187 ? commandDeserializer_io_inputData_9 : _GEN_477; // @[Deserializer.scala 75:21]
  assign _GEN_479 = 5'ha == _T_187 ? commandDeserializer_io_inputData_10 : _GEN_478; // @[Deserializer.scala 75:21]
  assign _GEN_480 = 5'hb == _T_187 ? commandDeserializer_io_inputData_11 : _GEN_479; // @[Deserializer.scala 75:21]
  assign _GEN_481 = 5'hc == _T_187 ? commandDeserializer_io_inputData_12 : _GEN_480; // @[Deserializer.scala 75:21]
  assign _GEN_482 = 5'hd == _T_187 ? commandDeserializer_io_inputData_13 : _GEN_481; // @[Deserializer.scala 75:21]
  assign _GEN_483 = 5'he == _T_187 ? commandDeserializer_io_inputData_14 : _GEN_482; // @[Deserializer.scala 75:21]
  assign _GEN_484 = 5'hf == _T_187 ? commandDeserializer_io_inputData_15 : _GEN_483; // @[Deserializer.scala 75:21]
  assign _GEN_485 = 5'h10 == _T_187 ? commandDeserializer_io_inputData_16 : _GEN_484; // @[Deserializer.scala 75:21]
  assign _GEN_486 = 5'h11 == _T_187 ? commandDeserializer_io_inputData_17 : _GEN_485; // @[Deserializer.scala 75:21]
  assign _GEN_487 = 5'h12 == _T_187 ? commandDeserializer_io_inputData_18 : _GEN_486; // @[Deserializer.scala 75:21]
  assign _GEN_488 = 5'h13 == _T_187 ? commandDeserializer_io_inputData_19 : _GEN_487; // @[Deserializer.scala 75:21]
  assign _GEN_489 = 5'h14 == _T_187 ? commandDeserializer_io_inputData_20 : _GEN_488; // @[Deserializer.scala 75:21]
  assign _GEN_490 = 5'h15 == _T_187 ? commandDeserializer_io_inputData_21 : _GEN_489; // @[Deserializer.scala 75:21]
  assign _GEN_491 = 5'h16 == _T_187 ? commandDeserializer_io_inputData_22 : _GEN_490; // @[Deserializer.scala 75:21]
  assign _GEN_492 = 5'h17 == _T_187 ? commandDeserializer_io_inputData_23 : _GEN_491; // @[Deserializer.scala 75:21]
  assign _T_190 = _GEN_492 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_194 = _T_52 + 5'he; // @[Deserializer.scala 74:65]
  assign _GEN_749 = {{19'd0}, _T_194}; // @[Deserializer.scala 74:72]
  assign _T_196 = _GEN_749 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_14 = _T_196 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_197 = _GEN_14[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_494 = 5'h1 == _T_197 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_495 = 5'h2 == _T_197 ? commandDeserializer_io_inputData_2 : _GEN_494; // @[Deserializer.scala 75:21]
  assign _GEN_496 = 5'h3 == _T_197 ? commandDeserializer_io_inputData_3 : _GEN_495; // @[Deserializer.scala 75:21]
  assign _GEN_497 = 5'h4 == _T_197 ? commandDeserializer_io_inputData_4 : _GEN_496; // @[Deserializer.scala 75:21]
  assign _GEN_498 = 5'h5 == _T_197 ? commandDeserializer_io_inputData_5 : _GEN_497; // @[Deserializer.scala 75:21]
  assign _GEN_499 = 5'h6 == _T_197 ? commandDeserializer_io_inputData_6 : _GEN_498; // @[Deserializer.scala 75:21]
  assign _GEN_500 = 5'h7 == _T_197 ? commandDeserializer_io_inputData_7 : _GEN_499; // @[Deserializer.scala 75:21]
  assign _GEN_501 = 5'h8 == _T_197 ? commandDeserializer_io_inputData_8 : _GEN_500; // @[Deserializer.scala 75:21]
  assign _GEN_502 = 5'h9 == _T_197 ? commandDeserializer_io_inputData_9 : _GEN_501; // @[Deserializer.scala 75:21]
  assign _GEN_503 = 5'ha == _T_197 ? commandDeserializer_io_inputData_10 : _GEN_502; // @[Deserializer.scala 75:21]
  assign _GEN_504 = 5'hb == _T_197 ? commandDeserializer_io_inputData_11 : _GEN_503; // @[Deserializer.scala 75:21]
  assign _GEN_505 = 5'hc == _T_197 ? commandDeserializer_io_inputData_12 : _GEN_504; // @[Deserializer.scala 75:21]
  assign _GEN_506 = 5'hd == _T_197 ? commandDeserializer_io_inputData_13 : _GEN_505; // @[Deserializer.scala 75:21]
  assign _GEN_507 = 5'he == _T_197 ? commandDeserializer_io_inputData_14 : _GEN_506; // @[Deserializer.scala 75:21]
  assign _GEN_508 = 5'hf == _T_197 ? commandDeserializer_io_inputData_15 : _GEN_507; // @[Deserializer.scala 75:21]
  assign _GEN_509 = 5'h10 == _T_197 ? commandDeserializer_io_inputData_16 : _GEN_508; // @[Deserializer.scala 75:21]
  assign _GEN_510 = 5'h11 == _T_197 ? commandDeserializer_io_inputData_17 : _GEN_509; // @[Deserializer.scala 75:21]
  assign _GEN_511 = 5'h12 == _T_197 ? commandDeserializer_io_inputData_18 : _GEN_510; // @[Deserializer.scala 75:21]
  assign _GEN_512 = 5'h13 == _T_197 ? commandDeserializer_io_inputData_19 : _GEN_511; // @[Deserializer.scala 75:21]
  assign _GEN_513 = 5'h14 == _T_197 ? commandDeserializer_io_inputData_20 : _GEN_512; // @[Deserializer.scala 75:21]
  assign _GEN_514 = 5'h15 == _T_197 ? commandDeserializer_io_inputData_21 : _GEN_513; // @[Deserializer.scala 75:21]
  assign _GEN_515 = 5'h16 == _T_197 ? commandDeserializer_io_inputData_22 : _GEN_514; // @[Deserializer.scala 75:21]
  assign _GEN_516 = 5'h17 == _T_197 ? commandDeserializer_io_inputData_23 : _GEN_515; // @[Deserializer.scala 75:21]
  assign _T_199 = _GEN_516 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_200 = _T_199 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_204 = _T_52 + 5'hf; // @[Deserializer.scala 74:65]
  assign _GEN_750 = {{19'd0}, _T_204}; // @[Deserializer.scala 74:72]
  assign _T_206 = _GEN_750 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_15 = _T_206 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_207 = _GEN_15[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_518 = 5'h1 == _T_207 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_519 = 5'h2 == _T_207 ? commandDeserializer_io_inputData_2 : _GEN_518; // @[Deserializer.scala 75:21]
  assign _GEN_520 = 5'h3 == _T_207 ? commandDeserializer_io_inputData_3 : _GEN_519; // @[Deserializer.scala 75:21]
  assign _GEN_521 = 5'h4 == _T_207 ? commandDeserializer_io_inputData_4 : _GEN_520; // @[Deserializer.scala 75:21]
  assign _GEN_522 = 5'h5 == _T_207 ? commandDeserializer_io_inputData_5 : _GEN_521; // @[Deserializer.scala 75:21]
  assign _GEN_523 = 5'h6 == _T_207 ? commandDeserializer_io_inputData_6 : _GEN_522; // @[Deserializer.scala 75:21]
  assign _GEN_524 = 5'h7 == _T_207 ? commandDeserializer_io_inputData_7 : _GEN_523; // @[Deserializer.scala 75:21]
  assign _GEN_525 = 5'h8 == _T_207 ? commandDeserializer_io_inputData_8 : _GEN_524; // @[Deserializer.scala 75:21]
  assign _GEN_526 = 5'h9 == _T_207 ? commandDeserializer_io_inputData_9 : _GEN_525; // @[Deserializer.scala 75:21]
  assign _GEN_527 = 5'ha == _T_207 ? commandDeserializer_io_inputData_10 : _GEN_526; // @[Deserializer.scala 75:21]
  assign _GEN_528 = 5'hb == _T_207 ? commandDeserializer_io_inputData_11 : _GEN_527; // @[Deserializer.scala 75:21]
  assign _GEN_529 = 5'hc == _T_207 ? commandDeserializer_io_inputData_12 : _GEN_528; // @[Deserializer.scala 75:21]
  assign _GEN_530 = 5'hd == _T_207 ? commandDeserializer_io_inputData_13 : _GEN_529; // @[Deserializer.scala 75:21]
  assign _GEN_531 = 5'he == _T_207 ? commandDeserializer_io_inputData_14 : _GEN_530; // @[Deserializer.scala 75:21]
  assign _GEN_532 = 5'hf == _T_207 ? commandDeserializer_io_inputData_15 : _GEN_531; // @[Deserializer.scala 75:21]
  assign _GEN_533 = 5'h10 == _T_207 ? commandDeserializer_io_inputData_16 : _GEN_532; // @[Deserializer.scala 75:21]
  assign _GEN_534 = 5'h11 == _T_207 ? commandDeserializer_io_inputData_17 : _GEN_533; // @[Deserializer.scala 75:21]
  assign _GEN_535 = 5'h12 == _T_207 ? commandDeserializer_io_inputData_18 : _GEN_534; // @[Deserializer.scala 75:21]
  assign _GEN_536 = 5'h13 == _T_207 ? commandDeserializer_io_inputData_19 : _GEN_535; // @[Deserializer.scala 75:21]
  assign _GEN_537 = 5'h14 == _T_207 ? commandDeserializer_io_inputData_20 : _GEN_536; // @[Deserializer.scala 75:21]
  assign _GEN_538 = 5'h15 == _T_207 ? commandDeserializer_io_inputData_21 : _GEN_537; // @[Deserializer.scala 75:21]
  assign _GEN_539 = 5'h16 == _T_207 ? commandDeserializer_io_inputData_22 : _GEN_538; // @[Deserializer.scala 75:21]
  assign _GEN_540 = 5'h17 == _T_207 ? commandDeserializer_io_inputData_23 : _GEN_539; // @[Deserializer.scala 75:21]
  assign _T_209 = _GEN_540 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_210 = _T_209 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_214 = _T_52 + 5'h10; // @[Deserializer.scala 74:65]
  assign _GEN_751 = {{19'd0}, _T_214}; // @[Deserializer.scala 74:72]
  assign _T_216 = _GEN_751 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_16 = _T_216 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_217 = _GEN_16[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_542 = 5'h1 == _T_217 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_543 = 5'h2 == _T_217 ? commandDeserializer_io_inputData_2 : _GEN_542; // @[Deserializer.scala 75:21]
  assign _GEN_544 = 5'h3 == _T_217 ? commandDeserializer_io_inputData_3 : _GEN_543; // @[Deserializer.scala 75:21]
  assign _GEN_545 = 5'h4 == _T_217 ? commandDeserializer_io_inputData_4 : _GEN_544; // @[Deserializer.scala 75:21]
  assign _GEN_546 = 5'h5 == _T_217 ? commandDeserializer_io_inputData_5 : _GEN_545; // @[Deserializer.scala 75:21]
  assign _GEN_547 = 5'h6 == _T_217 ? commandDeserializer_io_inputData_6 : _GEN_546; // @[Deserializer.scala 75:21]
  assign _GEN_548 = 5'h7 == _T_217 ? commandDeserializer_io_inputData_7 : _GEN_547; // @[Deserializer.scala 75:21]
  assign _GEN_549 = 5'h8 == _T_217 ? commandDeserializer_io_inputData_8 : _GEN_548; // @[Deserializer.scala 75:21]
  assign _GEN_550 = 5'h9 == _T_217 ? commandDeserializer_io_inputData_9 : _GEN_549; // @[Deserializer.scala 75:21]
  assign _GEN_551 = 5'ha == _T_217 ? commandDeserializer_io_inputData_10 : _GEN_550; // @[Deserializer.scala 75:21]
  assign _GEN_552 = 5'hb == _T_217 ? commandDeserializer_io_inputData_11 : _GEN_551; // @[Deserializer.scala 75:21]
  assign _GEN_553 = 5'hc == _T_217 ? commandDeserializer_io_inputData_12 : _GEN_552; // @[Deserializer.scala 75:21]
  assign _GEN_554 = 5'hd == _T_217 ? commandDeserializer_io_inputData_13 : _GEN_553; // @[Deserializer.scala 75:21]
  assign _GEN_555 = 5'he == _T_217 ? commandDeserializer_io_inputData_14 : _GEN_554; // @[Deserializer.scala 75:21]
  assign _GEN_556 = 5'hf == _T_217 ? commandDeserializer_io_inputData_15 : _GEN_555; // @[Deserializer.scala 75:21]
  assign _GEN_557 = 5'h10 == _T_217 ? commandDeserializer_io_inputData_16 : _GEN_556; // @[Deserializer.scala 75:21]
  assign _GEN_558 = 5'h11 == _T_217 ? commandDeserializer_io_inputData_17 : _GEN_557; // @[Deserializer.scala 75:21]
  assign _GEN_559 = 5'h12 == _T_217 ? commandDeserializer_io_inputData_18 : _GEN_558; // @[Deserializer.scala 75:21]
  assign _GEN_560 = 5'h13 == _T_217 ? commandDeserializer_io_inputData_19 : _GEN_559; // @[Deserializer.scala 75:21]
  assign _GEN_561 = 5'h14 == _T_217 ? commandDeserializer_io_inputData_20 : _GEN_560; // @[Deserializer.scala 75:21]
  assign _GEN_562 = 5'h15 == _T_217 ? commandDeserializer_io_inputData_21 : _GEN_561; // @[Deserializer.scala 75:21]
  assign _GEN_563 = 5'h16 == _T_217 ? commandDeserializer_io_inputData_22 : _GEN_562; // @[Deserializer.scala 75:21]
  assign _GEN_564 = 5'h17 == _T_217 ? commandDeserializer_io_inputData_23 : _GEN_563; // @[Deserializer.scala 75:21]
  assign _T_220 = _GEN_564 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_224 = _T_52 + 5'h11; // @[Deserializer.scala 74:65]
  assign _GEN_752 = {{19'd0}, _T_224}; // @[Deserializer.scala 74:72]
  assign _T_226 = _GEN_752 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_17 = _T_226 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_227 = _GEN_17[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_566 = 5'h1 == _T_227 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_567 = 5'h2 == _T_227 ? commandDeserializer_io_inputData_2 : _GEN_566; // @[Deserializer.scala 75:21]
  assign _GEN_568 = 5'h3 == _T_227 ? commandDeserializer_io_inputData_3 : _GEN_567; // @[Deserializer.scala 75:21]
  assign _GEN_569 = 5'h4 == _T_227 ? commandDeserializer_io_inputData_4 : _GEN_568; // @[Deserializer.scala 75:21]
  assign _GEN_570 = 5'h5 == _T_227 ? commandDeserializer_io_inputData_5 : _GEN_569; // @[Deserializer.scala 75:21]
  assign _GEN_571 = 5'h6 == _T_227 ? commandDeserializer_io_inputData_6 : _GEN_570; // @[Deserializer.scala 75:21]
  assign _GEN_572 = 5'h7 == _T_227 ? commandDeserializer_io_inputData_7 : _GEN_571; // @[Deserializer.scala 75:21]
  assign _GEN_573 = 5'h8 == _T_227 ? commandDeserializer_io_inputData_8 : _GEN_572; // @[Deserializer.scala 75:21]
  assign _GEN_574 = 5'h9 == _T_227 ? commandDeserializer_io_inputData_9 : _GEN_573; // @[Deserializer.scala 75:21]
  assign _GEN_575 = 5'ha == _T_227 ? commandDeserializer_io_inputData_10 : _GEN_574; // @[Deserializer.scala 75:21]
  assign _GEN_576 = 5'hb == _T_227 ? commandDeserializer_io_inputData_11 : _GEN_575; // @[Deserializer.scala 75:21]
  assign _GEN_577 = 5'hc == _T_227 ? commandDeserializer_io_inputData_12 : _GEN_576; // @[Deserializer.scala 75:21]
  assign _GEN_578 = 5'hd == _T_227 ? commandDeserializer_io_inputData_13 : _GEN_577; // @[Deserializer.scala 75:21]
  assign _GEN_579 = 5'he == _T_227 ? commandDeserializer_io_inputData_14 : _GEN_578; // @[Deserializer.scala 75:21]
  assign _GEN_580 = 5'hf == _T_227 ? commandDeserializer_io_inputData_15 : _GEN_579; // @[Deserializer.scala 75:21]
  assign _GEN_581 = 5'h10 == _T_227 ? commandDeserializer_io_inputData_16 : _GEN_580; // @[Deserializer.scala 75:21]
  assign _GEN_582 = 5'h11 == _T_227 ? commandDeserializer_io_inputData_17 : _GEN_581; // @[Deserializer.scala 75:21]
  assign _GEN_583 = 5'h12 == _T_227 ? commandDeserializer_io_inputData_18 : _GEN_582; // @[Deserializer.scala 75:21]
  assign _GEN_584 = 5'h13 == _T_227 ? commandDeserializer_io_inputData_19 : _GEN_583; // @[Deserializer.scala 75:21]
  assign _GEN_585 = 5'h14 == _T_227 ? commandDeserializer_io_inputData_20 : _GEN_584; // @[Deserializer.scala 75:21]
  assign _GEN_586 = 5'h15 == _T_227 ? commandDeserializer_io_inputData_21 : _GEN_585; // @[Deserializer.scala 75:21]
  assign _GEN_587 = 5'h16 == _T_227 ? commandDeserializer_io_inputData_22 : _GEN_586; // @[Deserializer.scala 75:21]
  assign _GEN_588 = 5'h17 == _T_227 ? commandDeserializer_io_inputData_23 : _GEN_587; // @[Deserializer.scala 75:21]
  assign _T_230 = _GEN_588 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_234 = _T_52 + 5'h12; // @[Deserializer.scala 74:65]
  assign _GEN_753 = {{19'd0}, _T_234}; // @[Deserializer.scala 74:72]
  assign _T_236 = _GEN_753 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_18 = _T_236 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_237 = _GEN_18[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_590 = 5'h1 == _T_237 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_591 = 5'h2 == _T_237 ? commandDeserializer_io_inputData_2 : _GEN_590; // @[Deserializer.scala 75:21]
  assign _GEN_592 = 5'h3 == _T_237 ? commandDeserializer_io_inputData_3 : _GEN_591; // @[Deserializer.scala 75:21]
  assign _GEN_593 = 5'h4 == _T_237 ? commandDeserializer_io_inputData_4 : _GEN_592; // @[Deserializer.scala 75:21]
  assign _GEN_594 = 5'h5 == _T_237 ? commandDeserializer_io_inputData_5 : _GEN_593; // @[Deserializer.scala 75:21]
  assign _GEN_595 = 5'h6 == _T_237 ? commandDeserializer_io_inputData_6 : _GEN_594; // @[Deserializer.scala 75:21]
  assign _GEN_596 = 5'h7 == _T_237 ? commandDeserializer_io_inputData_7 : _GEN_595; // @[Deserializer.scala 75:21]
  assign _GEN_597 = 5'h8 == _T_237 ? commandDeserializer_io_inputData_8 : _GEN_596; // @[Deserializer.scala 75:21]
  assign _GEN_598 = 5'h9 == _T_237 ? commandDeserializer_io_inputData_9 : _GEN_597; // @[Deserializer.scala 75:21]
  assign _GEN_599 = 5'ha == _T_237 ? commandDeserializer_io_inputData_10 : _GEN_598; // @[Deserializer.scala 75:21]
  assign _GEN_600 = 5'hb == _T_237 ? commandDeserializer_io_inputData_11 : _GEN_599; // @[Deserializer.scala 75:21]
  assign _GEN_601 = 5'hc == _T_237 ? commandDeserializer_io_inputData_12 : _GEN_600; // @[Deserializer.scala 75:21]
  assign _GEN_602 = 5'hd == _T_237 ? commandDeserializer_io_inputData_13 : _GEN_601; // @[Deserializer.scala 75:21]
  assign _GEN_603 = 5'he == _T_237 ? commandDeserializer_io_inputData_14 : _GEN_602; // @[Deserializer.scala 75:21]
  assign _GEN_604 = 5'hf == _T_237 ? commandDeserializer_io_inputData_15 : _GEN_603; // @[Deserializer.scala 75:21]
  assign _GEN_605 = 5'h10 == _T_237 ? commandDeserializer_io_inputData_16 : _GEN_604; // @[Deserializer.scala 75:21]
  assign _GEN_606 = 5'h11 == _T_237 ? commandDeserializer_io_inputData_17 : _GEN_605; // @[Deserializer.scala 75:21]
  assign _GEN_607 = 5'h12 == _T_237 ? commandDeserializer_io_inputData_18 : _GEN_606; // @[Deserializer.scala 75:21]
  assign _GEN_608 = 5'h13 == _T_237 ? commandDeserializer_io_inputData_19 : _GEN_607; // @[Deserializer.scala 75:21]
  assign _GEN_609 = 5'h14 == _T_237 ? commandDeserializer_io_inputData_20 : _GEN_608; // @[Deserializer.scala 75:21]
  assign _GEN_610 = 5'h15 == _T_237 ? commandDeserializer_io_inputData_21 : _GEN_609; // @[Deserializer.scala 75:21]
  assign _GEN_611 = 5'h16 == _T_237 ? commandDeserializer_io_inputData_22 : _GEN_610; // @[Deserializer.scala 75:21]
  assign _GEN_612 = 5'h17 == _T_237 ? commandDeserializer_io_inputData_23 : _GEN_611; // @[Deserializer.scala 75:21]
  assign _T_240 = _GEN_612 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_244 = _T_52 + 5'h13; // @[Deserializer.scala 74:65]
  assign _GEN_754 = {{19'd0}, _T_244}; // @[Deserializer.scala 74:72]
  assign _T_246 = _GEN_754 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_19 = _T_246 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_247 = _GEN_19[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_614 = 5'h1 == _T_247 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_615 = 5'h2 == _T_247 ? commandDeserializer_io_inputData_2 : _GEN_614; // @[Deserializer.scala 75:21]
  assign _GEN_616 = 5'h3 == _T_247 ? commandDeserializer_io_inputData_3 : _GEN_615; // @[Deserializer.scala 75:21]
  assign _GEN_617 = 5'h4 == _T_247 ? commandDeserializer_io_inputData_4 : _GEN_616; // @[Deserializer.scala 75:21]
  assign _GEN_618 = 5'h5 == _T_247 ? commandDeserializer_io_inputData_5 : _GEN_617; // @[Deserializer.scala 75:21]
  assign _GEN_619 = 5'h6 == _T_247 ? commandDeserializer_io_inputData_6 : _GEN_618; // @[Deserializer.scala 75:21]
  assign _GEN_620 = 5'h7 == _T_247 ? commandDeserializer_io_inputData_7 : _GEN_619; // @[Deserializer.scala 75:21]
  assign _GEN_621 = 5'h8 == _T_247 ? commandDeserializer_io_inputData_8 : _GEN_620; // @[Deserializer.scala 75:21]
  assign _GEN_622 = 5'h9 == _T_247 ? commandDeserializer_io_inputData_9 : _GEN_621; // @[Deserializer.scala 75:21]
  assign _GEN_623 = 5'ha == _T_247 ? commandDeserializer_io_inputData_10 : _GEN_622; // @[Deserializer.scala 75:21]
  assign _GEN_624 = 5'hb == _T_247 ? commandDeserializer_io_inputData_11 : _GEN_623; // @[Deserializer.scala 75:21]
  assign _GEN_625 = 5'hc == _T_247 ? commandDeserializer_io_inputData_12 : _GEN_624; // @[Deserializer.scala 75:21]
  assign _GEN_626 = 5'hd == _T_247 ? commandDeserializer_io_inputData_13 : _GEN_625; // @[Deserializer.scala 75:21]
  assign _GEN_627 = 5'he == _T_247 ? commandDeserializer_io_inputData_14 : _GEN_626; // @[Deserializer.scala 75:21]
  assign _GEN_628 = 5'hf == _T_247 ? commandDeserializer_io_inputData_15 : _GEN_627; // @[Deserializer.scala 75:21]
  assign _GEN_629 = 5'h10 == _T_247 ? commandDeserializer_io_inputData_16 : _GEN_628; // @[Deserializer.scala 75:21]
  assign _GEN_630 = 5'h11 == _T_247 ? commandDeserializer_io_inputData_17 : _GEN_629; // @[Deserializer.scala 75:21]
  assign _GEN_631 = 5'h12 == _T_247 ? commandDeserializer_io_inputData_18 : _GEN_630; // @[Deserializer.scala 75:21]
  assign _GEN_632 = 5'h13 == _T_247 ? commandDeserializer_io_inputData_19 : _GEN_631; // @[Deserializer.scala 75:21]
  assign _GEN_633 = 5'h14 == _T_247 ? commandDeserializer_io_inputData_20 : _GEN_632; // @[Deserializer.scala 75:21]
  assign _GEN_634 = 5'h15 == _T_247 ? commandDeserializer_io_inputData_21 : _GEN_633; // @[Deserializer.scala 75:21]
  assign _GEN_635 = 5'h16 == _T_247 ? commandDeserializer_io_inputData_22 : _GEN_634; // @[Deserializer.scala 75:21]
  assign _GEN_636 = 5'h17 == _T_247 ? commandDeserializer_io_inputData_23 : _GEN_635; // @[Deserializer.scala 75:21]
  assign _T_250 = _GEN_636 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_254 = _T_52 + 5'h14; // @[Deserializer.scala 74:65]
  assign _GEN_755 = {{19'd0}, _T_254}; // @[Deserializer.scala 74:72]
  assign _T_256 = _GEN_755 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_20 = _T_256 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_257 = _GEN_20[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_638 = 5'h1 == _T_257 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_639 = 5'h2 == _T_257 ? commandDeserializer_io_inputData_2 : _GEN_638; // @[Deserializer.scala 75:21]
  assign _GEN_640 = 5'h3 == _T_257 ? commandDeserializer_io_inputData_3 : _GEN_639; // @[Deserializer.scala 75:21]
  assign _GEN_641 = 5'h4 == _T_257 ? commandDeserializer_io_inputData_4 : _GEN_640; // @[Deserializer.scala 75:21]
  assign _GEN_642 = 5'h5 == _T_257 ? commandDeserializer_io_inputData_5 : _GEN_641; // @[Deserializer.scala 75:21]
  assign _GEN_643 = 5'h6 == _T_257 ? commandDeserializer_io_inputData_6 : _GEN_642; // @[Deserializer.scala 75:21]
  assign _GEN_644 = 5'h7 == _T_257 ? commandDeserializer_io_inputData_7 : _GEN_643; // @[Deserializer.scala 75:21]
  assign _GEN_645 = 5'h8 == _T_257 ? commandDeserializer_io_inputData_8 : _GEN_644; // @[Deserializer.scala 75:21]
  assign _GEN_646 = 5'h9 == _T_257 ? commandDeserializer_io_inputData_9 : _GEN_645; // @[Deserializer.scala 75:21]
  assign _GEN_647 = 5'ha == _T_257 ? commandDeserializer_io_inputData_10 : _GEN_646; // @[Deserializer.scala 75:21]
  assign _GEN_648 = 5'hb == _T_257 ? commandDeserializer_io_inputData_11 : _GEN_647; // @[Deserializer.scala 75:21]
  assign _GEN_649 = 5'hc == _T_257 ? commandDeserializer_io_inputData_12 : _GEN_648; // @[Deserializer.scala 75:21]
  assign _GEN_650 = 5'hd == _T_257 ? commandDeserializer_io_inputData_13 : _GEN_649; // @[Deserializer.scala 75:21]
  assign _GEN_651 = 5'he == _T_257 ? commandDeserializer_io_inputData_14 : _GEN_650; // @[Deserializer.scala 75:21]
  assign _GEN_652 = 5'hf == _T_257 ? commandDeserializer_io_inputData_15 : _GEN_651; // @[Deserializer.scala 75:21]
  assign _GEN_653 = 5'h10 == _T_257 ? commandDeserializer_io_inputData_16 : _GEN_652; // @[Deserializer.scala 75:21]
  assign _GEN_654 = 5'h11 == _T_257 ? commandDeserializer_io_inputData_17 : _GEN_653; // @[Deserializer.scala 75:21]
  assign _GEN_655 = 5'h12 == _T_257 ? commandDeserializer_io_inputData_18 : _GEN_654; // @[Deserializer.scala 75:21]
  assign _GEN_656 = 5'h13 == _T_257 ? commandDeserializer_io_inputData_19 : _GEN_655; // @[Deserializer.scala 75:21]
  assign _GEN_657 = 5'h14 == _T_257 ? commandDeserializer_io_inputData_20 : _GEN_656; // @[Deserializer.scala 75:21]
  assign _GEN_658 = 5'h15 == _T_257 ? commandDeserializer_io_inputData_21 : _GEN_657; // @[Deserializer.scala 75:21]
  assign _GEN_659 = 5'h16 == _T_257 ? commandDeserializer_io_inputData_22 : _GEN_658; // @[Deserializer.scala 75:21]
  assign _GEN_660 = 5'h17 == _T_257 ? commandDeserializer_io_inputData_23 : _GEN_659; // @[Deserializer.scala 75:21]
  assign _T_260 = _GEN_660 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_264 = _T_52 + 5'h15; // @[Deserializer.scala 74:65]
  assign _GEN_756 = {{19'd0}, _T_264}; // @[Deserializer.scala 74:72]
  assign _T_266 = _GEN_756 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_21 = _T_266 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_267 = _GEN_21[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_662 = 5'h1 == _T_267 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_663 = 5'h2 == _T_267 ? commandDeserializer_io_inputData_2 : _GEN_662; // @[Deserializer.scala 75:21]
  assign _GEN_664 = 5'h3 == _T_267 ? commandDeserializer_io_inputData_3 : _GEN_663; // @[Deserializer.scala 75:21]
  assign _GEN_665 = 5'h4 == _T_267 ? commandDeserializer_io_inputData_4 : _GEN_664; // @[Deserializer.scala 75:21]
  assign _GEN_666 = 5'h5 == _T_267 ? commandDeserializer_io_inputData_5 : _GEN_665; // @[Deserializer.scala 75:21]
  assign _GEN_667 = 5'h6 == _T_267 ? commandDeserializer_io_inputData_6 : _GEN_666; // @[Deserializer.scala 75:21]
  assign _GEN_668 = 5'h7 == _T_267 ? commandDeserializer_io_inputData_7 : _GEN_667; // @[Deserializer.scala 75:21]
  assign _GEN_669 = 5'h8 == _T_267 ? commandDeserializer_io_inputData_8 : _GEN_668; // @[Deserializer.scala 75:21]
  assign _GEN_670 = 5'h9 == _T_267 ? commandDeserializer_io_inputData_9 : _GEN_669; // @[Deserializer.scala 75:21]
  assign _GEN_671 = 5'ha == _T_267 ? commandDeserializer_io_inputData_10 : _GEN_670; // @[Deserializer.scala 75:21]
  assign _GEN_672 = 5'hb == _T_267 ? commandDeserializer_io_inputData_11 : _GEN_671; // @[Deserializer.scala 75:21]
  assign _GEN_673 = 5'hc == _T_267 ? commandDeserializer_io_inputData_12 : _GEN_672; // @[Deserializer.scala 75:21]
  assign _GEN_674 = 5'hd == _T_267 ? commandDeserializer_io_inputData_13 : _GEN_673; // @[Deserializer.scala 75:21]
  assign _GEN_675 = 5'he == _T_267 ? commandDeserializer_io_inputData_14 : _GEN_674; // @[Deserializer.scala 75:21]
  assign _GEN_676 = 5'hf == _T_267 ? commandDeserializer_io_inputData_15 : _GEN_675; // @[Deserializer.scala 75:21]
  assign _GEN_677 = 5'h10 == _T_267 ? commandDeserializer_io_inputData_16 : _GEN_676; // @[Deserializer.scala 75:21]
  assign _GEN_678 = 5'h11 == _T_267 ? commandDeserializer_io_inputData_17 : _GEN_677; // @[Deserializer.scala 75:21]
  assign _GEN_679 = 5'h12 == _T_267 ? commandDeserializer_io_inputData_18 : _GEN_678; // @[Deserializer.scala 75:21]
  assign _GEN_680 = 5'h13 == _T_267 ? commandDeserializer_io_inputData_19 : _GEN_679; // @[Deserializer.scala 75:21]
  assign _GEN_681 = 5'h14 == _T_267 ? commandDeserializer_io_inputData_20 : _GEN_680; // @[Deserializer.scala 75:21]
  assign _GEN_682 = 5'h15 == _T_267 ? commandDeserializer_io_inputData_21 : _GEN_681; // @[Deserializer.scala 75:21]
  assign _GEN_683 = 5'h16 == _T_267 ? commandDeserializer_io_inputData_22 : _GEN_682; // @[Deserializer.scala 75:21]
  assign _GEN_684 = 5'h17 == _T_267 ? commandDeserializer_io_inputData_23 : _GEN_683; // @[Deserializer.scala 75:21]
  assign _T_270 = _GEN_684 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_274 = _T_52 + 5'h16; // @[Deserializer.scala 74:65]
  assign _GEN_757 = {{19'd0}, _T_274}; // @[Deserializer.scala 74:72]
  assign _T_276 = _GEN_757 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_22 = _T_276 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_277 = _GEN_22[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_686 = 5'h1 == _T_277 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_687 = 5'h2 == _T_277 ? commandDeserializer_io_inputData_2 : _GEN_686; // @[Deserializer.scala 75:21]
  assign _GEN_688 = 5'h3 == _T_277 ? commandDeserializer_io_inputData_3 : _GEN_687; // @[Deserializer.scala 75:21]
  assign _GEN_689 = 5'h4 == _T_277 ? commandDeserializer_io_inputData_4 : _GEN_688; // @[Deserializer.scala 75:21]
  assign _GEN_690 = 5'h5 == _T_277 ? commandDeserializer_io_inputData_5 : _GEN_689; // @[Deserializer.scala 75:21]
  assign _GEN_691 = 5'h6 == _T_277 ? commandDeserializer_io_inputData_6 : _GEN_690; // @[Deserializer.scala 75:21]
  assign _GEN_692 = 5'h7 == _T_277 ? commandDeserializer_io_inputData_7 : _GEN_691; // @[Deserializer.scala 75:21]
  assign _GEN_693 = 5'h8 == _T_277 ? commandDeserializer_io_inputData_8 : _GEN_692; // @[Deserializer.scala 75:21]
  assign _GEN_694 = 5'h9 == _T_277 ? commandDeserializer_io_inputData_9 : _GEN_693; // @[Deserializer.scala 75:21]
  assign _GEN_695 = 5'ha == _T_277 ? commandDeserializer_io_inputData_10 : _GEN_694; // @[Deserializer.scala 75:21]
  assign _GEN_696 = 5'hb == _T_277 ? commandDeserializer_io_inputData_11 : _GEN_695; // @[Deserializer.scala 75:21]
  assign _GEN_697 = 5'hc == _T_277 ? commandDeserializer_io_inputData_12 : _GEN_696; // @[Deserializer.scala 75:21]
  assign _GEN_698 = 5'hd == _T_277 ? commandDeserializer_io_inputData_13 : _GEN_697; // @[Deserializer.scala 75:21]
  assign _GEN_699 = 5'he == _T_277 ? commandDeserializer_io_inputData_14 : _GEN_698; // @[Deserializer.scala 75:21]
  assign _GEN_700 = 5'hf == _T_277 ? commandDeserializer_io_inputData_15 : _GEN_699; // @[Deserializer.scala 75:21]
  assign _GEN_701 = 5'h10 == _T_277 ? commandDeserializer_io_inputData_16 : _GEN_700; // @[Deserializer.scala 75:21]
  assign _GEN_702 = 5'h11 == _T_277 ? commandDeserializer_io_inputData_17 : _GEN_701; // @[Deserializer.scala 75:21]
  assign _GEN_703 = 5'h12 == _T_277 ? commandDeserializer_io_inputData_18 : _GEN_702; // @[Deserializer.scala 75:21]
  assign _GEN_704 = 5'h13 == _T_277 ? commandDeserializer_io_inputData_19 : _GEN_703; // @[Deserializer.scala 75:21]
  assign _GEN_705 = 5'h14 == _T_277 ? commandDeserializer_io_inputData_20 : _GEN_704; // @[Deserializer.scala 75:21]
  assign _GEN_706 = 5'h15 == _T_277 ? commandDeserializer_io_inputData_21 : _GEN_705; // @[Deserializer.scala 75:21]
  assign _GEN_707 = 5'h16 == _T_277 ? commandDeserializer_io_inputData_22 : _GEN_706; // @[Deserializer.scala 75:21]
  assign _GEN_708 = 5'h17 == _T_277 ? commandDeserializer_io_inputData_23 : _GEN_707; // @[Deserializer.scala 75:21]
  assign _T_279 = _GEN_708 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_280 = _T_279 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_284 = _T_52 + 5'h17; // @[Deserializer.scala 74:65]
  assign _GEN_758 = {{19'd0}, _T_284}; // @[Deserializer.scala 74:72]
  assign _T_286 = _GEN_758 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_23 = _T_286 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_287 = _GEN_23[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_710 = 5'h1 == _T_287 ? commandDeserializer_io_inputData_1 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_711 = 5'h2 == _T_287 ? commandDeserializer_io_inputData_2 : _GEN_710; // @[Deserializer.scala 75:21]
  assign _GEN_712 = 5'h3 == _T_287 ? commandDeserializer_io_inputData_3 : _GEN_711; // @[Deserializer.scala 75:21]
  assign _GEN_713 = 5'h4 == _T_287 ? commandDeserializer_io_inputData_4 : _GEN_712; // @[Deserializer.scala 75:21]
  assign _GEN_714 = 5'h5 == _T_287 ? commandDeserializer_io_inputData_5 : _GEN_713; // @[Deserializer.scala 75:21]
  assign _GEN_715 = 5'h6 == _T_287 ? commandDeserializer_io_inputData_6 : _GEN_714; // @[Deserializer.scala 75:21]
  assign _GEN_716 = 5'h7 == _T_287 ? commandDeserializer_io_inputData_7 : _GEN_715; // @[Deserializer.scala 75:21]
  assign _GEN_717 = 5'h8 == _T_287 ? commandDeserializer_io_inputData_8 : _GEN_716; // @[Deserializer.scala 75:21]
  assign _GEN_718 = 5'h9 == _T_287 ? commandDeserializer_io_inputData_9 : _GEN_717; // @[Deserializer.scala 75:21]
  assign _GEN_719 = 5'ha == _T_287 ? commandDeserializer_io_inputData_10 : _GEN_718; // @[Deserializer.scala 75:21]
  assign _GEN_720 = 5'hb == _T_287 ? commandDeserializer_io_inputData_11 : _GEN_719; // @[Deserializer.scala 75:21]
  assign _GEN_721 = 5'hc == _T_287 ? commandDeserializer_io_inputData_12 : _GEN_720; // @[Deserializer.scala 75:21]
  assign _GEN_722 = 5'hd == _T_287 ? commandDeserializer_io_inputData_13 : _GEN_721; // @[Deserializer.scala 75:21]
  assign _GEN_723 = 5'he == _T_287 ? commandDeserializer_io_inputData_14 : _GEN_722; // @[Deserializer.scala 75:21]
  assign _GEN_724 = 5'hf == _T_287 ? commandDeserializer_io_inputData_15 : _GEN_723; // @[Deserializer.scala 75:21]
  assign _GEN_725 = 5'h10 == _T_287 ? commandDeserializer_io_inputData_16 : _GEN_724; // @[Deserializer.scala 75:21]
  assign _GEN_726 = 5'h11 == _T_287 ? commandDeserializer_io_inputData_17 : _GEN_725; // @[Deserializer.scala 75:21]
  assign _GEN_727 = 5'h12 == _T_287 ? commandDeserializer_io_inputData_18 : _GEN_726; // @[Deserializer.scala 75:21]
  assign _GEN_728 = 5'h13 == _T_287 ? commandDeserializer_io_inputData_19 : _GEN_727; // @[Deserializer.scala 75:21]
  assign _GEN_729 = 5'h14 == _T_287 ? commandDeserializer_io_inputData_20 : _GEN_728; // @[Deserializer.scala 75:21]
  assign _GEN_730 = 5'h15 == _T_287 ? commandDeserializer_io_inputData_21 : _GEN_729; // @[Deserializer.scala 75:21]
  assign _GEN_731 = 5'h16 == _T_287 ? commandDeserializer_io_inputData_22 : _GEN_730; // @[Deserializer.scala 75:21]
  assign _GEN_732 = 5'h17 == _T_287 ? commandDeserializer_io_inputData_23 : _GEN_731; // @[Deserializer.scala 75:21]
  assign _T_290 = _GEN_732 == 1'h0; // @[Deserializer.scala 75:9]
  assign _T_292 = _T_60 & _T_70; // @[Deserializer.scala 76:26]
  assign _T_293 = _T_292 & _T_80; // @[Deserializer.scala 76:26]
  assign _T_294 = _T_293 & _T_90; // @[Deserializer.scala 76:26]
  assign _T_295 = _T_294 & _T_100; // @[Deserializer.scala 76:26]
  assign _T_296 = _T_295 & _T_110; // @[Deserializer.scala 76:26]
  assign _T_297 = _T_296 & _T_120; // @[Deserializer.scala 76:26]
  assign _T_298 = _T_297 & _T_130; // @[Deserializer.scala 76:26]
  assign _T_299 = _T_298 & _T_140; // @[Deserializer.scala 76:26]
  assign _T_300 = _T_299 & _T_150; // @[Deserializer.scala 76:26]
  assign _T_301 = _T_300 & _T_160; // @[Deserializer.scala 76:26]
  assign _T_302 = _T_301 & _T_170; // @[Deserializer.scala 76:26]
  assign _T_303 = _T_302 & _T_180; // @[Deserializer.scala 76:26]
  assign _T_304 = _T_303 & _T_190; // @[Deserializer.scala 76:26]
  assign _T_305 = _T_304 & _T_200; // @[Deserializer.scala 76:26]
  assign _T_306 = _T_305 & _T_210; // @[Deserializer.scala 76:26]
  assign _T_307 = _T_306 & _T_220; // @[Deserializer.scala 76:26]
  assign _T_308 = _T_307 & _T_230; // @[Deserializer.scala 76:26]
  assign _T_309 = _T_308 & _T_240; // @[Deserializer.scala 76:26]
  assign _T_310 = _T_309 & _T_250; // @[Deserializer.scala 76:26]
  assign _T_311 = _T_310 & _T_260; // @[Deserializer.scala 76:26]
  assign _T_312 = _T_311 & _T_270; // @[Deserializer.scala 76:26]
  assign _T_313 = _T_312 & _T_280; // @[Deserializer.scala 76:26]
  assign _T_314 = _T_313 & _T_290; // @[Deserializer.scala 76:26]
  assign _T_315 = toldToSerialize == 1'h0; // @[Bgec.scala 120:55]
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
  assign controllerDataSerializer_io_startSerialization = _T_314 & _T_315; // @[Bgec.scala 120:52 Bgec.scala 123:52]
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
      toldToSerialize <= _T_314;
    end
  end
endmodule
