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
module ParallelADC(
  input        clock,
  input        reset,
  input        io_notEndOfConv,
  output       io_notChipSel,
  output       io_notRead,
  input  [7:0] io_dataBus,
  output [7:0] io_outData
);
  reg [7:0] dataReg; // @[ParallelADC.scala 19:20]
  reg [31:0] _RAND_0;
  reg  selectAndRead; // @[ParallelADC.scala 32:30]
  reg [31:0] _RAND_1;
  wire  _GEN_3; // @[ParallelADC.scala 36:23]
  wire  _GEN_5; // @[ParallelADC.scala 42:26]
  assign _GEN_3 = selectAndRead ? 1'h0 : selectAndRead; // @[ParallelADC.scala 36:23]
  assign _GEN_5 = ~io_notEndOfConv | _GEN_3; // @[ParallelADC.scala 42:26]
  assign io_notChipSel = ~selectAndRead; // @[ParallelADC.scala 33:17]
  assign io_notRead = selectAndRead; // @[ParallelADC.scala 34:14]
  assign io_outData = dataReg; // @[ParallelADC.scala 21:14]
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
  dataReg = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  selectAndRead = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (selectAndRead) begin
      dataReg <= io_dataBus;
    end
    if (reset) begin
      selectAndRead <= 1'h0;
    end else begin
      selectAndRead <= _GEN_5;
    end
  end
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
  wire  _T_1; // @[Serializer.scala 26:30]
  wire  _GEN_0; // @[Serializer.scala 26:45]
  wire  _T_2; // @[Serializer.scala 32:29]
  wire  _T_3; // @[Serializer.scala 34:35]
  wire [63:0] _T_4; // @[Serializer.scala 37:36]
  wire  _GEN_1; // @[Serializer.scala 34:44]
  wire  _GEN_2; // @[Serializer.scala 32:38]
  wire  _T_6; // @[Serializer.scala 39:23]
  wire  _T_8; // @[Serializer.scala 41:29]
  wire [5:0] _T_10; // @[Serializer.scala 44:42]
  wire [1:0] _T_12; // @[Serializer.scala 46:48]
  wire [3:0] _T_14; // @[Serializer.scala 48:34]
  assign _T_1 = io_startSerialization & ~serialize; // @[Serializer.scala 26:30]
  assign _GEN_0 = _T_1 | serialize; // @[Serializer.scala 26:45]
  assign _T_2 = microsecondCounter == 2'h0; // @[Serializer.scala 32:29]
  assign _T_3 = microsecondCounter == 2'h3; // @[Serializer.scala 34:35]
  assign _T_4 = io_outputData >> serializeIndex; // @[Serializer.scala 37:36]
  assign _GEN_1 = _T_3 | _T_4[0]; // @[Serializer.scala 34:44]
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
  wire  _T_3; // @[Deserializer.scala 34:35]
  wire  _T_4; // @[Deserializer.scala 34:52]
  wire  _GEN_24; // @[Deserializer.scala 35:37]
  wire [5:0] _T_6; // @[Deserializer.scala 39:38]
  wire [5:0] _T_8; // @[Deserializer.scala 41:36]
  wire [5:0] _T_10; // @[Deserializer.scala 42:27]
  wire  _T_11; // @[Deserializer.scala 42:43]
  wire  _T_12; // @[Deserializer.scala 43:40]
  wire [23:0] _T_15; // @[Deserializer.scala 68:32]
  wire  _GEN_75; // @[Deserializer.scala 42:51]
  wire  _T_17; // @[Deserializer.scala 52:22]
  wire  _T_18; // @[Deserializer.scala 53:25]
  wire  _T_19; // @[Deserializer.scala 54:33]
  wire [1:0] _T_24; // @[Deserializer.scala 57:50]
  wire [3:0] _T_26; // @[Deserializer.scala 59:36]
  assign _GEN_0 = reset ? 1'h0 : dataBuffer_0; // @[Deserializer.scala 25:24]
  assign _GEN_1 = reset ? 1'h0 : dataBuffer_1; // @[Deserializer.scala 25:24]
  assign _GEN_2 = reset ? 1'h0 : dataBuffer_2; // @[Deserializer.scala 25:24]
  assign _GEN_3 = reset ? 1'h0 : dataBuffer_3; // @[Deserializer.scala 25:24]
  assign _GEN_4 = reset ? 1'h0 : dataBuffer_4; // @[Deserializer.scala 25:24]
  assign _GEN_5 = reset ? 1'h0 : dataBuffer_5; // @[Deserializer.scala 25:24]
  assign _GEN_6 = reset ? 1'h0 : dataBuffer_6; // @[Deserializer.scala 25:24]
  assign _GEN_7 = reset ? 1'h0 : dataBuffer_7; // @[Deserializer.scala 25:24]
  assign _GEN_8 = reset ? 1'h0 : dataBuffer_8; // @[Deserializer.scala 25:24]
  assign _GEN_9 = reset ? 1'h0 : dataBuffer_9; // @[Deserializer.scala 25:24]
  assign _GEN_10 = reset ? 1'h0 : dataBuffer_10; // @[Deserializer.scala 25:24]
  assign _GEN_11 = reset ? 1'h0 : dataBuffer_11; // @[Deserializer.scala 25:24]
  assign _GEN_12 = reset ? 1'h0 : dataBuffer_12; // @[Deserializer.scala 25:24]
  assign _GEN_13 = reset ? 1'h0 : dataBuffer_13; // @[Deserializer.scala 25:24]
  assign _GEN_14 = reset ? 1'h0 : dataBuffer_14; // @[Deserializer.scala 25:24]
  assign _GEN_15 = reset ? 1'h0 : dataBuffer_15; // @[Deserializer.scala 25:24]
  assign _GEN_16 = reset ? 1'h0 : dataBuffer_16; // @[Deserializer.scala 25:24]
  assign _GEN_17 = reset ? 1'h0 : dataBuffer_17; // @[Deserializer.scala 25:24]
  assign _GEN_18 = reset ? 1'h0 : dataBuffer_18; // @[Deserializer.scala 25:24]
  assign _GEN_19 = reset ? 1'h0 : dataBuffer_19; // @[Deserializer.scala 25:24]
  assign _GEN_20 = reset ? 1'h0 : dataBuffer_20; // @[Deserializer.scala 25:24]
  assign _GEN_21 = reset ? 1'h0 : dataBuffer_21; // @[Deserializer.scala 25:24]
  assign _GEN_22 = reset ? 1'h0 : dataBuffer_22; // @[Deserializer.scala 25:24]
  assign _GEN_23 = reset ? 1'h0 : dataBuffer_23; // @[Deserializer.scala 25:24]
  assign _T_3 = io_startDeserialization & ~deserialize; // @[Deserializer.scala 34:35]
  assign _T_4 = _T_3 | guessingPhase; // @[Deserializer.scala 34:52]
  assign _GEN_24 = io_startDeserialization | guessingPhase; // @[Deserializer.scala 35:37]
  assign _T_6 = cyclesOfHigh + 6'h1; // @[Deserializer.scala 39:38]
  assign _T_8 = cyclesOfLow + 6'h1; // @[Deserializer.scala 41:36]
  assign _T_10 = cyclesOfLow + cyclesOfHigh; // @[Deserializer.scala 42:27]
  assign _T_11 = _T_10 > 6'h38; // @[Deserializer.scala 42:43]
  assign _T_12 = cyclesOfHigh > cyclesOfLow; // @[Deserializer.scala 43:40]
  assign _T_15 = bitsReadReg + 24'h1; // @[Deserializer.scala 68:32]
  assign _GEN_75 = _T_11 | deserialize; // @[Deserializer.scala 42:51]
  assign _T_17 = deserialize & ~guessingPhase; // @[Deserializer.scala 52:22]
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h0 == bitsReadReg[4:0]) begin
              dataBuffer_0 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_0 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h0 == bitsReadReg[4:0]) begin
                  dataBuffer_0 <= _T_12;
                end else if (reset) begin
                  dataBuffer_0 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_0 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_0 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_0 <= _GEN_0;
            end else if (_T_11) begin
              if (5'h0 == bitsReadReg[4:0]) begin
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
            if (5'h0 == bitsReadReg[4:0]) begin
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
          if (5'h0 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h1 == bitsReadReg[4:0]) begin
              dataBuffer_1 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_1 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h1 == bitsReadReg[4:0]) begin
                  dataBuffer_1 <= _T_12;
                end else if (reset) begin
                  dataBuffer_1 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_1 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_1 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_1 <= _GEN_1;
            end else if (_T_11) begin
              if (5'h1 == bitsReadReg[4:0]) begin
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
            if (5'h1 == bitsReadReg[4:0]) begin
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
          if (5'h1 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h2 == bitsReadReg[4:0]) begin
              dataBuffer_2 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_2 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h2 == bitsReadReg[4:0]) begin
                  dataBuffer_2 <= _T_12;
                end else if (reset) begin
                  dataBuffer_2 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_2 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_2 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_2 <= _GEN_2;
            end else if (_T_11) begin
              if (5'h2 == bitsReadReg[4:0]) begin
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
            if (5'h2 == bitsReadReg[4:0]) begin
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
          if (5'h2 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h3 == bitsReadReg[4:0]) begin
              dataBuffer_3 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_3 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h3 == bitsReadReg[4:0]) begin
                  dataBuffer_3 <= _T_12;
                end else if (reset) begin
                  dataBuffer_3 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_3 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_3 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_3 <= _GEN_3;
            end else if (_T_11) begin
              if (5'h3 == bitsReadReg[4:0]) begin
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
            if (5'h3 == bitsReadReg[4:0]) begin
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
          if (5'h3 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h4 == bitsReadReg[4:0]) begin
              dataBuffer_4 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_4 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h4 == bitsReadReg[4:0]) begin
                  dataBuffer_4 <= _T_12;
                end else if (reset) begin
                  dataBuffer_4 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_4 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_4 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_4 <= _GEN_4;
            end else if (_T_11) begin
              if (5'h4 == bitsReadReg[4:0]) begin
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
            if (5'h4 == bitsReadReg[4:0]) begin
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
          if (5'h4 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h5 == bitsReadReg[4:0]) begin
              dataBuffer_5 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_5 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h5 == bitsReadReg[4:0]) begin
                  dataBuffer_5 <= _T_12;
                end else if (reset) begin
                  dataBuffer_5 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_5 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_5 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_5 <= _GEN_5;
            end else if (_T_11) begin
              if (5'h5 == bitsReadReg[4:0]) begin
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
            if (5'h5 == bitsReadReg[4:0]) begin
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
          if (5'h5 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h6 == bitsReadReg[4:0]) begin
              dataBuffer_6 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_6 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h6 == bitsReadReg[4:0]) begin
                  dataBuffer_6 <= _T_12;
                end else if (reset) begin
                  dataBuffer_6 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_6 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_6 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_6 <= _GEN_6;
            end else if (_T_11) begin
              if (5'h6 == bitsReadReg[4:0]) begin
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
            if (5'h6 == bitsReadReg[4:0]) begin
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
          if (5'h6 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h7 == bitsReadReg[4:0]) begin
              dataBuffer_7 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_7 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h7 == bitsReadReg[4:0]) begin
                  dataBuffer_7 <= _T_12;
                end else if (reset) begin
                  dataBuffer_7 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_7 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_7 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_7 <= _GEN_7;
            end else if (_T_11) begin
              if (5'h7 == bitsReadReg[4:0]) begin
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
            if (5'h7 == bitsReadReg[4:0]) begin
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
          if (5'h7 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h8 == bitsReadReg[4:0]) begin
              dataBuffer_8 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_8 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h8 == bitsReadReg[4:0]) begin
                  dataBuffer_8 <= _T_12;
                end else if (reset) begin
                  dataBuffer_8 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_8 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_8 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_8 <= _GEN_8;
            end else if (_T_11) begin
              if (5'h8 == bitsReadReg[4:0]) begin
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
            if (5'h8 == bitsReadReg[4:0]) begin
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
          if (5'h8 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h9 == bitsReadReg[4:0]) begin
              dataBuffer_9 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_9 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h9 == bitsReadReg[4:0]) begin
                  dataBuffer_9 <= _T_12;
                end else if (reset) begin
                  dataBuffer_9 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_9 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_9 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_9 <= _GEN_9;
            end else if (_T_11) begin
              if (5'h9 == bitsReadReg[4:0]) begin
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
            if (5'h9 == bitsReadReg[4:0]) begin
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
          if (5'h9 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'ha == bitsReadReg[4:0]) begin
              dataBuffer_10 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_10 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'ha == bitsReadReg[4:0]) begin
                  dataBuffer_10 <= _T_12;
                end else if (reset) begin
                  dataBuffer_10 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_10 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_10 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_10 <= _GEN_10;
            end else if (_T_11) begin
              if (5'ha == bitsReadReg[4:0]) begin
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
            if (5'ha == bitsReadReg[4:0]) begin
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
          if (5'ha == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hb == bitsReadReg[4:0]) begin
              dataBuffer_11 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_11 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hb == bitsReadReg[4:0]) begin
                  dataBuffer_11 <= _T_12;
                end else if (reset) begin
                  dataBuffer_11 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_11 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_11 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_11 <= _GEN_11;
            end else if (_T_11) begin
              if (5'hb == bitsReadReg[4:0]) begin
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
            if (5'hb == bitsReadReg[4:0]) begin
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
          if (5'hb == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hc == bitsReadReg[4:0]) begin
              dataBuffer_12 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_12 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hc == bitsReadReg[4:0]) begin
                  dataBuffer_12 <= _T_12;
                end else if (reset) begin
                  dataBuffer_12 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_12 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_12 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_12 <= _GEN_12;
            end else if (_T_11) begin
              if (5'hc == bitsReadReg[4:0]) begin
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
            if (5'hc == bitsReadReg[4:0]) begin
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
          if (5'hc == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hd == bitsReadReg[4:0]) begin
              dataBuffer_13 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_13 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hd == bitsReadReg[4:0]) begin
                  dataBuffer_13 <= _T_12;
                end else if (reset) begin
                  dataBuffer_13 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_13 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_13 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_13 <= _GEN_13;
            end else if (_T_11) begin
              if (5'hd == bitsReadReg[4:0]) begin
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
            if (5'hd == bitsReadReg[4:0]) begin
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
          if (5'hd == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'he == bitsReadReg[4:0]) begin
              dataBuffer_14 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_14 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'he == bitsReadReg[4:0]) begin
                  dataBuffer_14 <= _T_12;
                end else if (reset) begin
                  dataBuffer_14 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_14 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_14 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_14 <= _GEN_14;
            end else if (_T_11) begin
              if (5'he == bitsReadReg[4:0]) begin
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
            if (5'he == bitsReadReg[4:0]) begin
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
          if (5'he == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'hf == bitsReadReg[4:0]) begin
              dataBuffer_15 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_15 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'hf == bitsReadReg[4:0]) begin
                  dataBuffer_15 <= _T_12;
                end else if (reset) begin
                  dataBuffer_15 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_15 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_15 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_15 <= _GEN_15;
            end else if (_T_11) begin
              if (5'hf == bitsReadReg[4:0]) begin
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
            if (5'hf == bitsReadReg[4:0]) begin
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
          if (5'hf == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h10 == bitsReadReg[4:0]) begin
              dataBuffer_16 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_16 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h10 == bitsReadReg[4:0]) begin
                  dataBuffer_16 <= _T_12;
                end else if (reset) begin
                  dataBuffer_16 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_16 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_16 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_16 <= _GEN_16;
            end else if (_T_11) begin
              if (5'h10 == bitsReadReg[4:0]) begin
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
            if (5'h10 == bitsReadReg[4:0]) begin
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
          if (5'h10 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h11 == bitsReadReg[4:0]) begin
              dataBuffer_17 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_17 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h11 == bitsReadReg[4:0]) begin
                  dataBuffer_17 <= _T_12;
                end else if (reset) begin
                  dataBuffer_17 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_17 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_17 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_17 <= _GEN_17;
            end else if (_T_11) begin
              if (5'h11 == bitsReadReg[4:0]) begin
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
            if (5'h11 == bitsReadReg[4:0]) begin
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
          if (5'h11 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h12 == bitsReadReg[4:0]) begin
              dataBuffer_18 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_18 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h12 == bitsReadReg[4:0]) begin
                  dataBuffer_18 <= _T_12;
                end else if (reset) begin
                  dataBuffer_18 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_18 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_18 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_18 <= _GEN_18;
            end else if (_T_11) begin
              if (5'h12 == bitsReadReg[4:0]) begin
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
            if (5'h12 == bitsReadReg[4:0]) begin
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
          if (5'h12 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h13 == bitsReadReg[4:0]) begin
              dataBuffer_19 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_19 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h13 == bitsReadReg[4:0]) begin
                  dataBuffer_19 <= _T_12;
                end else if (reset) begin
                  dataBuffer_19 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_19 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_19 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_19 <= _GEN_19;
            end else if (_T_11) begin
              if (5'h13 == bitsReadReg[4:0]) begin
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
            if (5'h13 == bitsReadReg[4:0]) begin
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
          if (5'h13 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h14 == bitsReadReg[4:0]) begin
              dataBuffer_20 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_20 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h14 == bitsReadReg[4:0]) begin
                  dataBuffer_20 <= _T_12;
                end else if (reset) begin
                  dataBuffer_20 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_20 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_20 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_20 <= _GEN_20;
            end else if (_T_11) begin
              if (5'h14 == bitsReadReg[4:0]) begin
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
            if (5'h14 == bitsReadReg[4:0]) begin
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
          if (5'h14 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h15 == bitsReadReg[4:0]) begin
              dataBuffer_21 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_21 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h15 == bitsReadReg[4:0]) begin
                  dataBuffer_21 <= _T_12;
                end else if (reset) begin
                  dataBuffer_21 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_21 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_21 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_21 <= _GEN_21;
            end else if (_T_11) begin
              if (5'h15 == bitsReadReg[4:0]) begin
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
            if (5'h15 == bitsReadReg[4:0]) begin
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
          if (5'h15 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h16 == bitsReadReg[4:0]) begin
              dataBuffer_22 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_22 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h16 == bitsReadReg[4:0]) begin
                  dataBuffer_22 <= _T_12;
                end else if (reset) begin
                  dataBuffer_22 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_22 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_22 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_22 <= _GEN_22;
            end else if (_T_11) begin
              if (5'h16 == bitsReadReg[4:0]) begin
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
            if (5'h16 == bitsReadReg[4:0]) begin
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
          if (5'h16 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
      if (_T_17) begin
        if (_T_18) begin
          if (_T_19) begin
            if (5'h17 == bitsReadReg[4:0]) begin
              dataBuffer_23 <= io_readData;
            end else if (_T_4) begin
              if (io_readData) begin
                if (reset) begin
                  dataBuffer_23 <= 1'h0;
                end
              end else if (_T_11) begin
                if (5'h17 == bitsReadReg[4:0]) begin
                  dataBuffer_23 <= _T_12;
                end else if (reset) begin
                  dataBuffer_23 <= 1'h0;
                end
              end else if (reset) begin
                dataBuffer_23 <= 1'h0;
              end
            end else if (reset) begin
              dataBuffer_23 <= 1'h0;
            end
          end else if (_T_4) begin
            if (io_readData) begin
              dataBuffer_23 <= _GEN_23;
            end else if (_T_11) begin
              if (5'h17 == bitsReadReg[4:0]) begin
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
            if (5'h17 == bitsReadReg[4:0]) begin
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
          if (5'h17 == bitsReadReg[4:0]) begin
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
    if (~io_pauseDeserialization) begin
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
    end else if (~io_pauseDeserialization) begin
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
    end else if (~io_pauseDeserialization) begin
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
    end else if (~io_pauseDeserialization) begin
      if (_T_4) begin
        if (!(io_readData)) begin
          deserialize <= _GEN_75;
        end
      end
    end
    if (reset) begin
      guessingPhase <= 1'h0;
    end else if (~io_pauseDeserialization) begin
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
    end else if (~io_pauseDeserialization) begin
      if (_T_4) begin
        if (!(io_readData)) begin
          cyclesOfLow <= _T_8;
        end
      end
    end
    if (reset) begin
      cyclesOfHigh <= 6'h0;
    end else if (~io_pauseDeserialization) begin
      if (_T_4) begin
        if (io_readData) begin
          cyclesOfHigh <= _T_6;
        end
      end
    end
  end
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
  output       io_outJoystickXNotConvSt,
  input        io_inJoystickXNotEndOfConv,
  output       io_outJoystickXNotChipSel,
  output       io_outJoystickXNotRead,
  input  [7:0] io_inJoystickXData,
  output       io_outJoystickYNotConvSt,
  input        io_inJoystickYNotEndOfConv,
  output       io_outJoystickYNotChipSel,
  output       io_outJoystickYNotRead,
  input  [7:0] io_inJoystickYData,
  output       io_outCStickXNotConvSt,
  input        io_inCStickXNotEndOfConv,
  output       io_outCStickXNotChipSel,
  output       io_outCStickXNotRead,
  input  [7:0] io_inCStickXData,
  output       io_outCStickYNotConvSt,
  input        io_inCStickYNotEndOfConv,
  output       io_outCStickYNotChipSel,
  output       io_outCStickYNotRead,
  input  [7:0] io_inCStickYData,
  output       io_outTriggerLNotConvSt,
  input        io_inTriggerLNotEndOfConv,
  output       io_outTriggerLNotChipSel,
  output       io_outTriggerLNotRead,
  input  [7:0] io_inTriggerLData,
  output       io_outTriggerRNotConvSt,
  input        io_inTriggerRNotEndOfConv,
  output       io_outTriggerRNotChipSel,
  output       io_outTriggerRNotRead,
  input  [7:0] io_inTriggerRData,
  inout        io_gcData
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
  wire  joystickXADC_clock; // @[Bgec.scala 64:28]
  wire  joystickXADC_reset; // @[Bgec.scala 64:28]
  wire  joystickXADC_io_notEndOfConv; // @[Bgec.scala 64:28]
  wire  joystickXADC_io_notChipSel; // @[Bgec.scala 64:28]
  wire  joystickXADC_io_notRead; // @[Bgec.scala 64:28]
  wire [7:0] joystickXADC_io_dataBus; // @[Bgec.scala 64:28]
  wire [7:0] joystickXADC_io_outData; // @[Bgec.scala 64:28]
  wire  joystickYADC_clock; // @[Bgec.scala 71:28]
  wire  joystickYADC_reset; // @[Bgec.scala 71:28]
  wire  joystickYADC_io_notEndOfConv; // @[Bgec.scala 71:28]
  wire  joystickYADC_io_notChipSel; // @[Bgec.scala 71:28]
  wire  joystickYADC_io_notRead; // @[Bgec.scala 71:28]
  wire [7:0] joystickYADC_io_dataBus; // @[Bgec.scala 71:28]
  wire [7:0] joystickYADC_io_outData; // @[Bgec.scala 71:28]
  wire  cStickXADC_clock; // @[Bgec.scala 78:26]
  wire  cStickXADC_reset; // @[Bgec.scala 78:26]
  wire  cStickXADC_io_notEndOfConv; // @[Bgec.scala 78:26]
  wire  cStickXADC_io_notChipSel; // @[Bgec.scala 78:26]
  wire  cStickXADC_io_notRead; // @[Bgec.scala 78:26]
  wire [7:0] cStickXADC_io_dataBus; // @[Bgec.scala 78:26]
  wire [7:0] cStickXADC_io_outData; // @[Bgec.scala 78:26]
  wire  cStickYADC_clock; // @[Bgec.scala 85:26]
  wire  cStickYADC_reset; // @[Bgec.scala 85:26]
  wire  cStickYADC_io_notEndOfConv; // @[Bgec.scala 85:26]
  wire  cStickYADC_io_notChipSel; // @[Bgec.scala 85:26]
  wire  cStickYADC_io_notRead; // @[Bgec.scala 85:26]
  wire [7:0] cStickYADC_io_dataBus; // @[Bgec.scala 85:26]
  wire [7:0] cStickYADC_io_outData; // @[Bgec.scala 85:26]
  wire  triggerLADC_clock; // @[Bgec.scala 92:27]
  wire  triggerLADC_reset; // @[Bgec.scala 92:27]
  wire  triggerLADC_io_notEndOfConv; // @[Bgec.scala 92:27]
  wire  triggerLADC_io_notChipSel; // @[Bgec.scala 92:27]
  wire  triggerLADC_io_notRead; // @[Bgec.scala 92:27]
  wire [7:0] triggerLADC_io_dataBus; // @[Bgec.scala 92:27]
  wire [7:0] triggerLADC_io_outData; // @[Bgec.scala 92:27]
  wire  triggerRADC_clock; // @[Bgec.scala 99:27]
  wire  triggerRADC_reset; // @[Bgec.scala 99:27]
  wire  triggerRADC_io_notEndOfConv; // @[Bgec.scala 99:27]
  wire  triggerRADC_io_notChipSel; // @[Bgec.scala 99:27]
  wire  triggerRADC_io_notRead; // @[Bgec.scala 99:27]
  wire [7:0] triggerRADC_io_dataBus; // @[Bgec.scala 99:27]
  wire [7:0] triggerRADC_io_outData; // @[Bgec.scala 99:27]
  wire  dataLine_write; // @[Bgec.scala 125:24]
  wire  dataLine_writeData; // @[Bgec.scala 125:24]
  wire  dataLine_readData; // @[Bgec.scala 125:24]
  wire  controllerDataSerializer_clock; // @[Bgec.scala 128:40]
  wire  controllerDataSerializer_reset; // @[Bgec.scala 128:40]
  wire  controllerDataSerializer_io_startSerialization; // @[Bgec.scala 128:40]
  wire [63:0] controllerDataSerializer_io_outputData; // @[Bgec.scala 128:40]
  wire  controllerDataSerializer_io_write; // @[Bgec.scala 128:40]
  wire  controllerDataSerializer_io_writeData; // @[Bgec.scala 128:40]
  wire  commandDeserializer_clock; // @[Bgec.scala 134:35]
  wire  commandDeserializer_reset; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_startDeserialization; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_pauseDeserialization; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_readData; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_0; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_1; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_2; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_3; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_4; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_5; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_6; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_7; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_8; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_9; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_10; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_11; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_12; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_13; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_14; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_15; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_16; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_17; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_18; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_19; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_20; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_21; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_22; // @[Bgec.scala 134:35]
  wire  commandDeserializer_io_inputData_23; // @[Bgec.scala 134:35]
  wire [23:0] commandDeserializer_io_bitsRead; // @[Bgec.scala 134:35]
  reg  toldToSerialize; // @[Bgec.scala 149:32]
  reg [31:0] _RAND_0;
  wire [24:0] _T_5; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_0; // @[Deserializer.scala 74:87]
  wire [4:0] _T_7; // @[Deserializer.scala 74:87]
  wire  _GEN_1; // @[Deserializer.scala 75:21]
  wire  _GEN_2; // @[Deserializer.scala 75:21]
  wire  _GEN_3; // @[Deserializer.scala 75:21]
  wire  _GEN_4; // @[Deserializer.scala 75:21]
  wire  _GEN_5; // @[Deserializer.scala 75:21]
  wire  _GEN_6; // @[Deserializer.scala 75:21]
  wire  _GEN_7; // @[Deserializer.scala 75:21]
  wire  _GEN_8; // @[Deserializer.scala 75:21]
  wire  _GEN_9; // @[Deserializer.scala 75:21]
  wire  _GEN_10; // @[Deserializer.scala 75:21]
  wire  _GEN_11; // @[Deserializer.scala 75:21]
  wire  _GEN_12; // @[Deserializer.scala 75:21]
  wire  _GEN_13; // @[Deserializer.scala 75:21]
  wire  _GEN_14; // @[Deserializer.scala 75:21]
  wire  _GEN_15; // @[Deserializer.scala 75:21]
  wire  _GEN_16; // @[Deserializer.scala 75:21]
  wire  _GEN_17; // @[Deserializer.scala 75:21]
  wire  _GEN_18; // @[Deserializer.scala 75:21]
  wire  _GEN_19; // @[Deserializer.scala 75:21]
  wire  _GEN_20; // @[Deserializer.scala 75:21]
  wire  _GEN_21; // @[Deserializer.scala 75:21]
  wire  _GEN_22; // @[Deserializer.scala 75:21]
  wire  _GEN_23; // @[Deserializer.scala 75:21]
  wire  _GEN_24; // @[Deserializer.scala 75:21]
  wire [23:0] _T_16; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_25; // @[Deserializer.scala 74:87]
  wire [4:0] _T_17; // @[Deserializer.scala 74:87]
  wire  _GEN_26; // @[Deserializer.scala 75:21]
  wire  _GEN_27; // @[Deserializer.scala 75:21]
  wire  _GEN_28; // @[Deserializer.scala 75:21]
  wire  _GEN_29; // @[Deserializer.scala 75:21]
  wire  _GEN_30; // @[Deserializer.scala 75:21]
  wire  _GEN_31; // @[Deserializer.scala 75:21]
  wire  _GEN_32; // @[Deserializer.scala 75:21]
  wire  _GEN_33; // @[Deserializer.scala 75:21]
  wire  _GEN_34; // @[Deserializer.scala 75:21]
  wire  _GEN_35; // @[Deserializer.scala 75:21]
  wire  _GEN_36; // @[Deserializer.scala 75:21]
  wire  _GEN_37; // @[Deserializer.scala 75:21]
  wire  _GEN_38; // @[Deserializer.scala 75:21]
  wire  _GEN_39; // @[Deserializer.scala 75:21]
  wire  _GEN_40; // @[Deserializer.scala 75:21]
  wire  _GEN_41; // @[Deserializer.scala 75:21]
  wire  _GEN_42; // @[Deserializer.scala 75:21]
  wire  _GEN_43; // @[Deserializer.scala 75:21]
  wire  _GEN_44; // @[Deserializer.scala 75:21]
  wire  _GEN_45; // @[Deserializer.scala 75:21]
  wire  _GEN_46; // @[Deserializer.scala 75:21]
  wire  _GEN_47; // @[Deserializer.scala 75:21]
  wire  _GEN_48; // @[Deserializer.scala 75:21]
  wire  _T_19; // @[Deserializer.scala 75:21]
  wire [23:0] _T_26; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_49; // @[Deserializer.scala 74:87]
  wire [4:0] _T_27; // @[Deserializer.scala 74:87]
  wire  _GEN_50; // @[Deserializer.scala 75:21]
  wire  _GEN_51; // @[Deserializer.scala 75:21]
  wire  _GEN_52; // @[Deserializer.scala 75:21]
  wire  _GEN_53; // @[Deserializer.scala 75:21]
  wire  _GEN_54; // @[Deserializer.scala 75:21]
  wire  _GEN_55; // @[Deserializer.scala 75:21]
  wire  _GEN_56; // @[Deserializer.scala 75:21]
  wire  _GEN_57; // @[Deserializer.scala 75:21]
  wire  _GEN_58; // @[Deserializer.scala 75:21]
  wire  _GEN_59; // @[Deserializer.scala 75:21]
  wire  _GEN_60; // @[Deserializer.scala 75:21]
  wire  _GEN_61; // @[Deserializer.scala 75:21]
  wire  _GEN_62; // @[Deserializer.scala 75:21]
  wire  _GEN_63; // @[Deserializer.scala 75:21]
  wire  _GEN_64; // @[Deserializer.scala 75:21]
  wire  _GEN_65; // @[Deserializer.scala 75:21]
  wire  _GEN_66; // @[Deserializer.scala 75:21]
  wire  _GEN_67; // @[Deserializer.scala 75:21]
  wire  _GEN_68; // @[Deserializer.scala 75:21]
  wire  _GEN_69; // @[Deserializer.scala 75:21]
  wire  _GEN_70; // @[Deserializer.scala 75:21]
  wire  _GEN_71; // @[Deserializer.scala 75:21]
  wire  _GEN_72; // @[Deserializer.scala 75:21]
  wire [23:0] _T_36; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_73; // @[Deserializer.scala 74:87]
  wire [4:0] _T_37; // @[Deserializer.scala 74:87]
  wire  _GEN_74; // @[Deserializer.scala 75:21]
  wire  _GEN_75; // @[Deserializer.scala 75:21]
  wire  _GEN_76; // @[Deserializer.scala 75:21]
  wire  _GEN_77; // @[Deserializer.scala 75:21]
  wire  _GEN_78; // @[Deserializer.scala 75:21]
  wire  _GEN_79; // @[Deserializer.scala 75:21]
  wire  _GEN_80; // @[Deserializer.scala 75:21]
  wire  _GEN_81; // @[Deserializer.scala 75:21]
  wire  _GEN_82; // @[Deserializer.scala 75:21]
  wire  _GEN_83; // @[Deserializer.scala 75:21]
  wire  _GEN_84; // @[Deserializer.scala 75:21]
  wire  _GEN_85; // @[Deserializer.scala 75:21]
  wire  _GEN_86; // @[Deserializer.scala 75:21]
  wire  _GEN_87; // @[Deserializer.scala 75:21]
  wire  _GEN_88; // @[Deserializer.scala 75:21]
  wire  _GEN_89; // @[Deserializer.scala 75:21]
  wire  _GEN_90; // @[Deserializer.scala 75:21]
  wire  _GEN_91; // @[Deserializer.scala 75:21]
  wire  _GEN_92; // @[Deserializer.scala 75:21]
  wire  _GEN_93; // @[Deserializer.scala 75:21]
  wire  _GEN_94; // @[Deserializer.scala 75:21]
  wire  _GEN_95; // @[Deserializer.scala 75:21]
  wire  _GEN_96; // @[Deserializer.scala 75:21]
  wire [23:0] _T_46; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_97; // @[Deserializer.scala 74:87]
  wire [4:0] _T_47; // @[Deserializer.scala 74:87]
  wire  _GEN_98; // @[Deserializer.scala 75:21]
  wire  _GEN_99; // @[Deserializer.scala 75:21]
  wire  _GEN_100; // @[Deserializer.scala 75:21]
  wire  _GEN_101; // @[Deserializer.scala 75:21]
  wire  _GEN_102; // @[Deserializer.scala 75:21]
  wire  _GEN_103; // @[Deserializer.scala 75:21]
  wire  _GEN_104; // @[Deserializer.scala 75:21]
  wire  _GEN_105; // @[Deserializer.scala 75:21]
  wire  _GEN_106; // @[Deserializer.scala 75:21]
  wire  _GEN_107; // @[Deserializer.scala 75:21]
  wire  _GEN_108; // @[Deserializer.scala 75:21]
  wire  _GEN_109; // @[Deserializer.scala 75:21]
  wire  _GEN_110; // @[Deserializer.scala 75:21]
  wire  _GEN_111; // @[Deserializer.scala 75:21]
  wire  _GEN_112; // @[Deserializer.scala 75:21]
  wire  _GEN_113; // @[Deserializer.scala 75:21]
  wire  _GEN_114; // @[Deserializer.scala 75:21]
  wire  _GEN_115; // @[Deserializer.scala 75:21]
  wire  _GEN_116; // @[Deserializer.scala 75:21]
  wire  _GEN_117; // @[Deserializer.scala 75:21]
  wire  _GEN_118; // @[Deserializer.scala 75:21]
  wire  _GEN_119; // @[Deserializer.scala 75:21]
  wire  _GEN_120; // @[Deserializer.scala 75:21]
  wire [23:0] _T_56; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_121; // @[Deserializer.scala 74:87]
  wire [4:0] _T_57; // @[Deserializer.scala 74:87]
  wire  _GEN_122; // @[Deserializer.scala 75:21]
  wire  _GEN_123; // @[Deserializer.scala 75:21]
  wire  _GEN_124; // @[Deserializer.scala 75:21]
  wire  _GEN_125; // @[Deserializer.scala 75:21]
  wire  _GEN_126; // @[Deserializer.scala 75:21]
  wire  _GEN_127; // @[Deserializer.scala 75:21]
  wire  _GEN_128; // @[Deserializer.scala 75:21]
  wire  _GEN_129; // @[Deserializer.scala 75:21]
  wire  _GEN_130; // @[Deserializer.scala 75:21]
  wire  _GEN_131; // @[Deserializer.scala 75:21]
  wire  _GEN_132; // @[Deserializer.scala 75:21]
  wire  _GEN_133; // @[Deserializer.scala 75:21]
  wire  _GEN_134; // @[Deserializer.scala 75:21]
  wire  _GEN_135; // @[Deserializer.scala 75:21]
  wire  _GEN_136; // @[Deserializer.scala 75:21]
  wire  _GEN_137; // @[Deserializer.scala 75:21]
  wire  _GEN_138; // @[Deserializer.scala 75:21]
  wire  _GEN_139; // @[Deserializer.scala 75:21]
  wire  _GEN_140; // @[Deserializer.scala 75:21]
  wire  _GEN_141; // @[Deserializer.scala 75:21]
  wire  _GEN_142; // @[Deserializer.scala 75:21]
  wire  _GEN_143; // @[Deserializer.scala 75:21]
  wire  _GEN_144; // @[Deserializer.scala 75:21]
  wire [23:0] _T_66; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_145; // @[Deserializer.scala 74:87]
  wire [4:0] _T_67; // @[Deserializer.scala 74:87]
  wire  _GEN_146; // @[Deserializer.scala 75:21]
  wire  _GEN_147; // @[Deserializer.scala 75:21]
  wire  _GEN_148; // @[Deserializer.scala 75:21]
  wire  _GEN_149; // @[Deserializer.scala 75:21]
  wire  _GEN_150; // @[Deserializer.scala 75:21]
  wire  _GEN_151; // @[Deserializer.scala 75:21]
  wire  _GEN_152; // @[Deserializer.scala 75:21]
  wire  _GEN_153; // @[Deserializer.scala 75:21]
  wire  _GEN_154; // @[Deserializer.scala 75:21]
  wire  _GEN_155; // @[Deserializer.scala 75:21]
  wire  _GEN_156; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_76; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_169; // @[Deserializer.scala 74:87]
  wire [4:0] _T_77; // @[Deserializer.scala 74:87]
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
  wire  _GEN_181; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_86; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_193; // @[Deserializer.scala 74:87]
  wire [4:0] _T_87; // @[Deserializer.scala 74:87]
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
  wire  _GEN_205; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_96; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_217; // @[Deserializer.scala 74:87]
  wire [4:0] _T_97; // @[Deserializer.scala 74:87]
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
  wire  _GEN_229; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_106; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_241; // @[Deserializer.scala 74:87]
  wire [4:0] _T_107; // @[Deserializer.scala 74:87]
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
  wire  _GEN_253; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_116; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_265; // @[Deserializer.scala 74:87]
  wire [4:0] _T_117; // @[Deserializer.scala 74:87]
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
  wire  _GEN_277; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_126; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_289; // @[Deserializer.scala 74:87]
  wire [4:0] _T_127; // @[Deserializer.scala 74:87]
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
  wire  _GEN_301; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_136; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_313; // @[Deserializer.scala 74:87]
  wire [4:0] _T_137; // @[Deserializer.scala 74:87]
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
  wire  _GEN_325; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_146; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_337; // @[Deserializer.scala 74:87]
  wire [4:0] _T_147; // @[Deserializer.scala 74:87]
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
  wire  _GEN_349; // @[Deserializer.scala 75:21]
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
  wire  _T_149; // @[Deserializer.scala 75:21]
  wire [23:0] _T_156; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_361; // @[Deserializer.scala 74:87]
  wire [4:0] _T_157; // @[Deserializer.scala 74:87]
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
  wire  _GEN_373; // @[Deserializer.scala 75:21]
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
  wire  _T_159; // @[Deserializer.scala 75:21]
  wire [23:0] _T_166; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_385; // @[Deserializer.scala 74:87]
  wire [4:0] _T_167; // @[Deserializer.scala 74:87]
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
  wire  _GEN_397; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_176; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_409; // @[Deserializer.scala 74:87]
  wire [4:0] _T_177; // @[Deserializer.scala 74:87]
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
  wire  _GEN_421; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_186; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_433; // @[Deserializer.scala 74:87]
  wire [4:0] _T_187; // @[Deserializer.scala 74:87]
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
  wire  _GEN_445; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_196; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_457; // @[Deserializer.scala 74:87]
  wire [4:0] _T_197; // @[Deserializer.scala 74:87]
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
  wire  _GEN_469; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_206; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_481; // @[Deserializer.scala 74:87]
  wire [4:0] _T_207; // @[Deserializer.scala 74:87]
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
  wire  _GEN_493; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_216; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_505; // @[Deserializer.scala 74:87]
  wire [4:0] _T_217; // @[Deserializer.scala 74:87]
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
  wire  _GEN_517; // @[Deserializer.scala 75:21]
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
  wire [23:0] _T_226; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_529; // @[Deserializer.scala 74:87]
  wire [4:0] _T_227; // @[Deserializer.scala 74:87]
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
  wire  _GEN_541; // @[Deserializer.scala 75:21]
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
  wire  _T_229; // @[Deserializer.scala 75:21]
  wire [23:0] _T_236; // @[Deserializer.scala 74:72]
  wire [23:0] _GEN_553; // @[Deserializer.scala 74:87]
  wire [4:0] _T_237; // @[Deserializer.scala 74:87]
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
  wire  _GEN_565; // @[Deserializer.scala 75:21]
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
  wire  _T_242; // @[Deserializer.scala 76:26]
  wire  _T_243; // @[Deserializer.scala 76:26]
  wire  _T_244; // @[Deserializer.scala 76:26]
  wire  _T_245; // @[Deserializer.scala 76:26]
  wire  _T_246; // @[Deserializer.scala 76:26]
  wire  _T_247; // @[Deserializer.scala 76:26]
  wire  _T_248; // @[Deserializer.scala 76:26]
  wire  _T_249; // @[Deserializer.scala 76:26]
  wire  _T_250; // @[Deserializer.scala 76:26]
  wire  _T_251; // @[Deserializer.scala 76:26]
  wire  _T_252; // @[Deserializer.scala 76:26]
  wire  _T_253; // @[Deserializer.scala 76:26]
  wire  _T_254; // @[Deserializer.scala 76:26]
  wire  _T_255; // @[Deserializer.scala 76:26]
  wire  _T_256; // @[Deserializer.scala 76:26]
  wire  _T_257; // @[Deserializer.scala 76:26]
  wire  _T_258; // @[Deserializer.scala 76:26]
  wire  _T_259; // @[Deserializer.scala 76:26]
  wire  _T_260; // @[Deserializer.scala 76:26]
  wire  _T_261; // @[Deserializer.scala 76:26]
  wire  _T_262; // @[Deserializer.scala 76:26]
  wire  _T_263; // @[Deserializer.scala 76:26]
  wire  _T_264; // @[Deserializer.scala 76:26]
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
  ParallelADC joystickXADC ( // @[Bgec.scala 64:28]
    .clock(joystickXADC_clock),
    .reset(joystickXADC_reset),
    .io_notEndOfConv(joystickXADC_io_notEndOfConv),
    .io_notChipSel(joystickXADC_io_notChipSel),
    .io_notRead(joystickXADC_io_notRead),
    .io_dataBus(joystickXADC_io_dataBus),
    .io_outData(joystickXADC_io_outData)
  );
  ParallelADC joystickYADC ( // @[Bgec.scala 71:28]
    .clock(joystickYADC_clock),
    .reset(joystickYADC_reset),
    .io_notEndOfConv(joystickYADC_io_notEndOfConv),
    .io_notChipSel(joystickYADC_io_notChipSel),
    .io_notRead(joystickYADC_io_notRead),
    .io_dataBus(joystickYADC_io_dataBus),
    .io_outData(joystickYADC_io_outData)
  );
  ParallelADC cStickXADC ( // @[Bgec.scala 78:26]
    .clock(cStickXADC_clock),
    .reset(cStickXADC_reset),
    .io_notEndOfConv(cStickXADC_io_notEndOfConv),
    .io_notChipSel(cStickXADC_io_notChipSel),
    .io_notRead(cStickXADC_io_notRead),
    .io_dataBus(cStickXADC_io_dataBus),
    .io_outData(cStickXADC_io_outData)
  );
  ParallelADC cStickYADC ( // @[Bgec.scala 85:26]
    .clock(cStickYADC_clock),
    .reset(cStickYADC_reset),
    .io_notEndOfConv(cStickYADC_io_notEndOfConv),
    .io_notChipSel(cStickYADC_io_notChipSel),
    .io_notRead(cStickYADC_io_notRead),
    .io_dataBus(cStickYADC_io_dataBus),
    .io_outData(cStickYADC_io_outData)
  );
  ParallelADC triggerLADC ( // @[Bgec.scala 92:27]
    .clock(triggerLADC_clock),
    .reset(triggerLADC_reset),
    .io_notEndOfConv(triggerLADC_io_notEndOfConv),
    .io_notChipSel(triggerLADC_io_notChipSel),
    .io_notRead(triggerLADC_io_notRead),
    .io_dataBus(triggerLADC_io_dataBus),
    .io_outData(triggerLADC_io_outData)
  );
  ParallelADC triggerRADC ( // @[Bgec.scala 99:27]
    .clock(triggerRADC_clock),
    .reset(triggerRADC_reset),
    .io_notEndOfConv(triggerRADC_io_notEndOfConv),
    .io_notChipSel(triggerRADC_io_notChipSel),
    .io_notRead(triggerRADC_io_notRead),
    .io_dataBus(triggerRADC_io_dataBus),
    .io_outData(triggerRADC_io_outData)
  );
  DataLine dataLine ( // @[Bgec.scala 125:24]
    .line(io_gcData),
    .write(dataLine_write),
    .writeData(dataLine_writeData),
    .readData(dataLine_readData)
  );
  Serializer controllerDataSerializer ( // @[Bgec.scala 128:40]
    .clock(controllerDataSerializer_clock),
    .reset(controllerDataSerializer_reset),
    .io_startSerialization(controllerDataSerializer_io_startSerialization),
    .io_outputData(controllerDataSerializer_io_outputData),
    .io_write(controllerDataSerializer_io_write),
    .io_writeData(controllerDataSerializer_io_writeData)
  );
  Deserializer commandDeserializer ( // @[Bgec.scala 134:35]
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
  assign _T_5 = {{1'd0}, commandDeserializer_io_bitsRead}; // @[Deserializer.scala 74:72]
  assign _GEN_0 = _T_5[23:0] % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_7 = _GEN_0[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_1 = commandDeserializer_io_inputData_0; // @[Deserializer.scala 75:21]
  assign _GEN_2 = 5'h1 == _T_7 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_3 = 5'h2 == _T_7 ? commandDeserializer_io_inputData_2 : _GEN_2; // @[Deserializer.scala 75:21]
  assign _GEN_4 = 5'h3 == _T_7 ? commandDeserializer_io_inputData_3 : _GEN_3; // @[Deserializer.scala 75:21]
  assign _GEN_5 = 5'h4 == _T_7 ? commandDeserializer_io_inputData_4 : _GEN_4; // @[Deserializer.scala 75:21]
  assign _GEN_6 = 5'h5 == _T_7 ? commandDeserializer_io_inputData_5 : _GEN_5; // @[Deserializer.scala 75:21]
  assign _GEN_7 = 5'h6 == _T_7 ? commandDeserializer_io_inputData_6 : _GEN_6; // @[Deserializer.scala 75:21]
  assign _GEN_8 = 5'h7 == _T_7 ? commandDeserializer_io_inputData_7 : _GEN_7; // @[Deserializer.scala 75:21]
  assign _GEN_9 = 5'h8 == _T_7 ? commandDeserializer_io_inputData_8 : _GEN_8; // @[Deserializer.scala 75:21]
  assign _GEN_10 = 5'h9 == _T_7 ? commandDeserializer_io_inputData_9 : _GEN_9; // @[Deserializer.scala 75:21]
  assign _GEN_11 = 5'ha == _T_7 ? commandDeserializer_io_inputData_10 : _GEN_10; // @[Deserializer.scala 75:21]
  assign _GEN_12 = 5'hb == _T_7 ? commandDeserializer_io_inputData_11 : _GEN_11; // @[Deserializer.scala 75:21]
  assign _GEN_13 = 5'hc == _T_7 ? commandDeserializer_io_inputData_12 : _GEN_12; // @[Deserializer.scala 75:21]
  assign _GEN_14 = 5'hd == _T_7 ? commandDeserializer_io_inputData_13 : _GEN_13; // @[Deserializer.scala 75:21]
  assign _GEN_15 = 5'he == _T_7 ? commandDeserializer_io_inputData_14 : _GEN_14; // @[Deserializer.scala 75:21]
  assign _GEN_16 = 5'hf == _T_7 ? commandDeserializer_io_inputData_15 : _GEN_15; // @[Deserializer.scala 75:21]
  assign _GEN_17 = 5'h10 == _T_7 ? commandDeserializer_io_inputData_16 : _GEN_16; // @[Deserializer.scala 75:21]
  assign _GEN_18 = 5'h11 == _T_7 ? commandDeserializer_io_inputData_17 : _GEN_17; // @[Deserializer.scala 75:21]
  assign _GEN_19 = 5'h12 == _T_7 ? commandDeserializer_io_inputData_18 : _GEN_18; // @[Deserializer.scala 75:21]
  assign _GEN_20 = 5'h13 == _T_7 ? commandDeserializer_io_inputData_19 : _GEN_19; // @[Deserializer.scala 75:21]
  assign _GEN_21 = 5'h14 == _T_7 ? commandDeserializer_io_inputData_20 : _GEN_20; // @[Deserializer.scala 75:21]
  assign _GEN_22 = 5'h15 == _T_7 ? commandDeserializer_io_inputData_21 : _GEN_21; // @[Deserializer.scala 75:21]
  assign _GEN_23 = 5'h16 == _T_7 ? commandDeserializer_io_inputData_22 : _GEN_22; // @[Deserializer.scala 75:21]
  assign _GEN_24 = 5'h17 == _T_7 ? commandDeserializer_io_inputData_23 : _GEN_23; // @[Deserializer.scala 75:21]
  assign _T_16 = 24'h1 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_25 = _T_16 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_17 = _GEN_25[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_26 = 5'h1 == _T_17 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_27 = 5'h2 == _T_17 ? commandDeserializer_io_inputData_2 : _GEN_26; // @[Deserializer.scala 75:21]
  assign _GEN_28 = 5'h3 == _T_17 ? commandDeserializer_io_inputData_3 : _GEN_27; // @[Deserializer.scala 75:21]
  assign _GEN_29 = 5'h4 == _T_17 ? commandDeserializer_io_inputData_4 : _GEN_28; // @[Deserializer.scala 75:21]
  assign _GEN_30 = 5'h5 == _T_17 ? commandDeserializer_io_inputData_5 : _GEN_29; // @[Deserializer.scala 75:21]
  assign _GEN_31 = 5'h6 == _T_17 ? commandDeserializer_io_inputData_6 : _GEN_30; // @[Deserializer.scala 75:21]
  assign _GEN_32 = 5'h7 == _T_17 ? commandDeserializer_io_inputData_7 : _GEN_31; // @[Deserializer.scala 75:21]
  assign _GEN_33 = 5'h8 == _T_17 ? commandDeserializer_io_inputData_8 : _GEN_32; // @[Deserializer.scala 75:21]
  assign _GEN_34 = 5'h9 == _T_17 ? commandDeserializer_io_inputData_9 : _GEN_33; // @[Deserializer.scala 75:21]
  assign _GEN_35 = 5'ha == _T_17 ? commandDeserializer_io_inputData_10 : _GEN_34; // @[Deserializer.scala 75:21]
  assign _GEN_36 = 5'hb == _T_17 ? commandDeserializer_io_inputData_11 : _GEN_35; // @[Deserializer.scala 75:21]
  assign _GEN_37 = 5'hc == _T_17 ? commandDeserializer_io_inputData_12 : _GEN_36; // @[Deserializer.scala 75:21]
  assign _GEN_38 = 5'hd == _T_17 ? commandDeserializer_io_inputData_13 : _GEN_37; // @[Deserializer.scala 75:21]
  assign _GEN_39 = 5'he == _T_17 ? commandDeserializer_io_inputData_14 : _GEN_38; // @[Deserializer.scala 75:21]
  assign _GEN_40 = 5'hf == _T_17 ? commandDeserializer_io_inputData_15 : _GEN_39; // @[Deserializer.scala 75:21]
  assign _GEN_41 = 5'h10 == _T_17 ? commandDeserializer_io_inputData_16 : _GEN_40; // @[Deserializer.scala 75:21]
  assign _GEN_42 = 5'h11 == _T_17 ? commandDeserializer_io_inputData_17 : _GEN_41; // @[Deserializer.scala 75:21]
  assign _GEN_43 = 5'h12 == _T_17 ? commandDeserializer_io_inputData_18 : _GEN_42; // @[Deserializer.scala 75:21]
  assign _GEN_44 = 5'h13 == _T_17 ? commandDeserializer_io_inputData_19 : _GEN_43; // @[Deserializer.scala 75:21]
  assign _GEN_45 = 5'h14 == _T_17 ? commandDeserializer_io_inputData_20 : _GEN_44; // @[Deserializer.scala 75:21]
  assign _GEN_46 = 5'h15 == _T_17 ? commandDeserializer_io_inputData_21 : _GEN_45; // @[Deserializer.scala 75:21]
  assign _GEN_47 = 5'h16 == _T_17 ? commandDeserializer_io_inputData_22 : _GEN_46; // @[Deserializer.scala 75:21]
  assign _GEN_48 = 5'h17 == _T_17 ? commandDeserializer_io_inputData_23 : _GEN_47; // @[Deserializer.scala 75:21]
  assign _T_19 = _GEN_48 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_26 = 24'h2 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_49 = _T_26 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_27 = _GEN_49[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_50 = 5'h1 == _T_27 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_51 = 5'h2 == _T_27 ? commandDeserializer_io_inputData_2 : _GEN_50; // @[Deserializer.scala 75:21]
  assign _GEN_52 = 5'h3 == _T_27 ? commandDeserializer_io_inputData_3 : _GEN_51; // @[Deserializer.scala 75:21]
  assign _GEN_53 = 5'h4 == _T_27 ? commandDeserializer_io_inputData_4 : _GEN_52; // @[Deserializer.scala 75:21]
  assign _GEN_54 = 5'h5 == _T_27 ? commandDeserializer_io_inputData_5 : _GEN_53; // @[Deserializer.scala 75:21]
  assign _GEN_55 = 5'h6 == _T_27 ? commandDeserializer_io_inputData_6 : _GEN_54; // @[Deserializer.scala 75:21]
  assign _GEN_56 = 5'h7 == _T_27 ? commandDeserializer_io_inputData_7 : _GEN_55; // @[Deserializer.scala 75:21]
  assign _GEN_57 = 5'h8 == _T_27 ? commandDeserializer_io_inputData_8 : _GEN_56; // @[Deserializer.scala 75:21]
  assign _GEN_58 = 5'h9 == _T_27 ? commandDeserializer_io_inputData_9 : _GEN_57; // @[Deserializer.scala 75:21]
  assign _GEN_59 = 5'ha == _T_27 ? commandDeserializer_io_inputData_10 : _GEN_58; // @[Deserializer.scala 75:21]
  assign _GEN_60 = 5'hb == _T_27 ? commandDeserializer_io_inputData_11 : _GEN_59; // @[Deserializer.scala 75:21]
  assign _GEN_61 = 5'hc == _T_27 ? commandDeserializer_io_inputData_12 : _GEN_60; // @[Deserializer.scala 75:21]
  assign _GEN_62 = 5'hd == _T_27 ? commandDeserializer_io_inputData_13 : _GEN_61; // @[Deserializer.scala 75:21]
  assign _GEN_63 = 5'he == _T_27 ? commandDeserializer_io_inputData_14 : _GEN_62; // @[Deserializer.scala 75:21]
  assign _GEN_64 = 5'hf == _T_27 ? commandDeserializer_io_inputData_15 : _GEN_63; // @[Deserializer.scala 75:21]
  assign _GEN_65 = 5'h10 == _T_27 ? commandDeserializer_io_inputData_16 : _GEN_64; // @[Deserializer.scala 75:21]
  assign _GEN_66 = 5'h11 == _T_27 ? commandDeserializer_io_inputData_17 : _GEN_65; // @[Deserializer.scala 75:21]
  assign _GEN_67 = 5'h12 == _T_27 ? commandDeserializer_io_inputData_18 : _GEN_66; // @[Deserializer.scala 75:21]
  assign _GEN_68 = 5'h13 == _T_27 ? commandDeserializer_io_inputData_19 : _GEN_67; // @[Deserializer.scala 75:21]
  assign _GEN_69 = 5'h14 == _T_27 ? commandDeserializer_io_inputData_20 : _GEN_68; // @[Deserializer.scala 75:21]
  assign _GEN_70 = 5'h15 == _T_27 ? commandDeserializer_io_inputData_21 : _GEN_69; // @[Deserializer.scala 75:21]
  assign _GEN_71 = 5'h16 == _T_27 ? commandDeserializer_io_inputData_22 : _GEN_70; // @[Deserializer.scala 75:21]
  assign _GEN_72 = 5'h17 == _T_27 ? commandDeserializer_io_inputData_23 : _GEN_71; // @[Deserializer.scala 75:21]
  assign _T_36 = 24'h3 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_73 = _T_36 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_37 = _GEN_73[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_74 = 5'h1 == _T_37 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_75 = 5'h2 == _T_37 ? commandDeserializer_io_inputData_2 : _GEN_74; // @[Deserializer.scala 75:21]
  assign _GEN_76 = 5'h3 == _T_37 ? commandDeserializer_io_inputData_3 : _GEN_75; // @[Deserializer.scala 75:21]
  assign _GEN_77 = 5'h4 == _T_37 ? commandDeserializer_io_inputData_4 : _GEN_76; // @[Deserializer.scala 75:21]
  assign _GEN_78 = 5'h5 == _T_37 ? commandDeserializer_io_inputData_5 : _GEN_77; // @[Deserializer.scala 75:21]
  assign _GEN_79 = 5'h6 == _T_37 ? commandDeserializer_io_inputData_6 : _GEN_78; // @[Deserializer.scala 75:21]
  assign _GEN_80 = 5'h7 == _T_37 ? commandDeserializer_io_inputData_7 : _GEN_79; // @[Deserializer.scala 75:21]
  assign _GEN_81 = 5'h8 == _T_37 ? commandDeserializer_io_inputData_8 : _GEN_80; // @[Deserializer.scala 75:21]
  assign _GEN_82 = 5'h9 == _T_37 ? commandDeserializer_io_inputData_9 : _GEN_81; // @[Deserializer.scala 75:21]
  assign _GEN_83 = 5'ha == _T_37 ? commandDeserializer_io_inputData_10 : _GEN_82; // @[Deserializer.scala 75:21]
  assign _GEN_84 = 5'hb == _T_37 ? commandDeserializer_io_inputData_11 : _GEN_83; // @[Deserializer.scala 75:21]
  assign _GEN_85 = 5'hc == _T_37 ? commandDeserializer_io_inputData_12 : _GEN_84; // @[Deserializer.scala 75:21]
  assign _GEN_86 = 5'hd == _T_37 ? commandDeserializer_io_inputData_13 : _GEN_85; // @[Deserializer.scala 75:21]
  assign _GEN_87 = 5'he == _T_37 ? commandDeserializer_io_inputData_14 : _GEN_86; // @[Deserializer.scala 75:21]
  assign _GEN_88 = 5'hf == _T_37 ? commandDeserializer_io_inputData_15 : _GEN_87; // @[Deserializer.scala 75:21]
  assign _GEN_89 = 5'h10 == _T_37 ? commandDeserializer_io_inputData_16 : _GEN_88; // @[Deserializer.scala 75:21]
  assign _GEN_90 = 5'h11 == _T_37 ? commandDeserializer_io_inputData_17 : _GEN_89; // @[Deserializer.scala 75:21]
  assign _GEN_91 = 5'h12 == _T_37 ? commandDeserializer_io_inputData_18 : _GEN_90; // @[Deserializer.scala 75:21]
  assign _GEN_92 = 5'h13 == _T_37 ? commandDeserializer_io_inputData_19 : _GEN_91; // @[Deserializer.scala 75:21]
  assign _GEN_93 = 5'h14 == _T_37 ? commandDeserializer_io_inputData_20 : _GEN_92; // @[Deserializer.scala 75:21]
  assign _GEN_94 = 5'h15 == _T_37 ? commandDeserializer_io_inputData_21 : _GEN_93; // @[Deserializer.scala 75:21]
  assign _GEN_95 = 5'h16 == _T_37 ? commandDeserializer_io_inputData_22 : _GEN_94; // @[Deserializer.scala 75:21]
  assign _GEN_96 = 5'h17 == _T_37 ? commandDeserializer_io_inputData_23 : _GEN_95; // @[Deserializer.scala 75:21]
  assign _T_46 = 24'h4 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_97 = _T_46 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_47 = _GEN_97[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_98 = 5'h1 == _T_47 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_99 = 5'h2 == _T_47 ? commandDeserializer_io_inputData_2 : _GEN_98; // @[Deserializer.scala 75:21]
  assign _GEN_100 = 5'h3 == _T_47 ? commandDeserializer_io_inputData_3 : _GEN_99; // @[Deserializer.scala 75:21]
  assign _GEN_101 = 5'h4 == _T_47 ? commandDeserializer_io_inputData_4 : _GEN_100; // @[Deserializer.scala 75:21]
  assign _GEN_102 = 5'h5 == _T_47 ? commandDeserializer_io_inputData_5 : _GEN_101; // @[Deserializer.scala 75:21]
  assign _GEN_103 = 5'h6 == _T_47 ? commandDeserializer_io_inputData_6 : _GEN_102; // @[Deserializer.scala 75:21]
  assign _GEN_104 = 5'h7 == _T_47 ? commandDeserializer_io_inputData_7 : _GEN_103; // @[Deserializer.scala 75:21]
  assign _GEN_105 = 5'h8 == _T_47 ? commandDeserializer_io_inputData_8 : _GEN_104; // @[Deserializer.scala 75:21]
  assign _GEN_106 = 5'h9 == _T_47 ? commandDeserializer_io_inputData_9 : _GEN_105; // @[Deserializer.scala 75:21]
  assign _GEN_107 = 5'ha == _T_47 ? commandDeserializer_io_inputData_10 : _GEN_106; // @[Deserializer.scala 75:21]
  assign _GEN_108 = 5'hb == _T_47 ? commandDeserializer_io_inputData_11 : _GEN_107; // @[Deserializer.scala 75:21]
  assign _GEN_109 = 5'hc == _T_47 ? commandDeserializer_io_inputData_12 : _GEN_108; // @[Deserializer.scala 75:21]
  assign _GEN_110 = 5'hd == _T_47 ? commandDeserializer_io_inputData_13 : _GEN_109; // @[Deserializer.scala 75:21]
  assign _GEN_111 = 5'he == _T_47 ? commandDeserializer_io_inputData_14 : _GEN_110; // @[Deserializer.scala 75:21]
  assign _GEN_112 = 5'hf == _T_47 ? commandDeserializer_io_inputData_15 : _GEN_111; // @[Deserializer.scala 75:21]
  assign _GEN_113 = 5'h10 == _T_47 ? commandDeserializer_io_inputData_16 : _GEN_112; // @[Deserializer.scala 75:21]
  assign _GEN_114 = 5'h11 == _T_47 ? commandDeserializer_io_inputData_17 : _GEN_113; // @[Deserializer.scala 75:21]
  assign _GEN_115 = 5'h12 == _T_47 ? commandDeserializer_io_inputData_18 : _GEN_114; // @[Deserializer.scala 75:21]
  assign _GEN_116 = 5'h13 == _T_47 ? commandDeserializer_io_inputData_19 : _GEN_115; // @[Deserializer.scala 75:21]
  assign _GEN_117 = 5'h14 == _T_47 ? commandDeserializer_io_inputData_20 : _GEN_116; // @[Deserializer.scala 75:21]
  assign _GEN_118 = 5'h15 == _T_47 ? commandDeserializer_io_inputData_21 : _GEN_117; // @[Deserializer.scala 75:21]
  assign _GEN_119 = 5'h16 == _T_47 ? commandDeserializer_io_inputData_22 : _GEN_118; // @[Deserializer.scala 75:21]
  assign _GEN_120 = 5'h17 == _T_47 ? commandDeserializer_io_inputData_23 : _GEN_119; // @[Deserializer.scala 75:21]
  assign _T_56 = 24'h5 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_121 = _T_56 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_57 = _GEN_121[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_122 = 5'h1 == _T_57 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_123 = 5'h2 == _T_57 ? commandDeserializer_io_inputData_2 : _GEN_122; // @[Deserializer.scala 75:21]
  assign _GEN_124 = 5'h3 == _T_57 ? commandDeserializer_io_inputData_3 : _GEN_123; // @[Deserializer.scala 75:21]
  assign _GEN_125 = 5'h4 == _T_57 ? commandDeserializer_io_inputData_4 : _GEN_124; // @[Deserializer.scala 75:21]
  assign _GEN_126 = 5'h5 == _T_57 ? commandDeserializer_io_inputData_5 : _GEN_125; // @[Deserializer.scala 75:21]
  assign _GEN_127 = 5'h6 == _T_57 ? commandDeserializer_io_inputData_6 : _GEN_126; // @[Deserializer.scala 75:21]
  assign _GEN_128 = 5'h7 == _T_57 ? commandDeserializer_io_inputData_7 : _GEN_127; // @[Deserializer.scala 75:21]
  assign _GEN_129 = 5'h8 == _T_57 ? commandDeserializer_io_inputData_8 : _GEN_128; // @[Deserializer.scala 75:21]
  assign _GEN_130 = 5'h9 == _T_57 ? commandDeserializer_io_inputData_9 : _GEN_129; // @[Deserializer.scala 75:21]
  assign _GEN_131 = 5'ha == _T_57 ? commandDeserializer_io_inputData_10 : _GEN_130; // @[Deserializer.scala 75:21]
  assign _GEN_132 = 5'hb == _T_57 ? commandDeserializer_io_inputData_11 : _GEN_131; // @[Deserializer.scala 75:21]
  assign _GEN_133 = 5'hc == _T_57 ? commandDeserializer_io_inputData_12 : _GEN_132; // @[Deserializer.scala 75:21]
  assign _GEN_134 = 5'hd == _T_57 ? commandDeserializer_io_inputData_13 : _GEN_133; // @[Deserializer.scala 75:21]
  assign _GEN_135 = 5'he == _T_57 ? commandDeserializer_io_inputData_14 : _GEN_134; // @[Deserializer.scala 75:21]
  assign _GEN_136 = 5'hf == _T_57 ? commandDeserializer_io_inputData_15 : _GEN_135; // @[Deserializer.scala 75:21]
  assign _GEN_137 = 5'h10 == _T_57 ? commandDeserializer_io_inputData_16 : _GEN_136; // @[Deserializer.scala 75:21]
  assign _GEN_138 = 5'h11 == _T_57 ? commandDeserializer_io_inputData_17 : _GEN_137; // @[Deserializer.scala 75:21]
  assign _GEN_139 = 5'h12 == _T_57 ? commandDeserializer_io_inputData_18 : _GEN_138; // @[Deserializer.scala 75:21]
  assign _GEN_140 = 5'h13 == _T_57 ? commandDeserializer_io_inputData_19 : _GEN_139; // @[Deserializer.scala 75:21]
  assign _GEN_141 = 5'h14 == _T_57 ? commandDeserializer_io_inputData_20 : _GEN_140; // @[Deserializer.scala 75:21]
  assign _GEN_142 = 5'h15 == _T_57 ? commandDeserializer_io_inputData_21 : _GEN_141; // @[Deserializer.scala 75:21]
  assign _GEN_143 = 5'h16 == _T_57 ? commandDeserializer_io_inputData_22 : _GEN_142; // @[Deserializer.scala 75:21]
  assign _GEN_144 = 5'h17 == _T_57 ? commandDeserializer_io_inputData_23 : _GEN_143; // @[Deserializer.scala 75:21]
  assign _T_66 = 24'h6 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_145 = _T_66 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_67 = _GEN_145[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_146 = 5'h1 == _T_67 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_147 = 5'h2 == _T_67 ? commandDeserializer_io_inputData_2 : _GEN_146; // @[Deserializer.scala 75:21]
  assign _GEN_148 = 5'h3 == _T_67 ? commandDeserializer_io_inputData_3 : _GEN_147; // @[Deserializer.scala 75:21]
  assign _GEN_149 = 5'h4 == _T_67 ? commandDeserializer_io_inputData_4 : _GEN_148; // @[Deserializer.scala 75:21]
  assign _GEN_150 = 5'h5 == _T_67 ? commandDeserializer_io_inputData_5 : _GEN_149; // @[Deserializer.scala 75:21]
  assign _GEN_151 = 5'h6 == _T_67 ? commandDeserializer_io_inputData_6 : _GEN_150; // @[Deserializer.scala 75:21]
  assign _GEN_152 = 5'h7 == _T_67 ? commandDeserializer_io_inputData_7 : _GEN_151; // @[Deserializer.scala 75:21]
  assign _GEN_153 = 5'h8 == _T_67 ? commandDeserializer_io_inputData_8 : _GEN_152; // @[Deserializer.scala 75:21]
  assign _GEN_154 = 5'h9 == _T_67 ? commandDeserializer_io_inputData_9 : _GEN_153; // @[Deserializer.scala 75:21]
  assign _GEN_155 = 5'ha == _T_67 ? commandDeserializer_io_inputData_10 : _GEN_154; // @[Deserializer.scala 75:21]
  assign _GEN_156 = 5'hb == _T_67 ? commandDeserializer_io_inputData_11 : _GEN_155; // @[Deserializer.scala 75:21]
  assign _GEN_157 = 5'hc == _T_67 ? commandDeserializer_io_inputData_12 : _GEN_156; // @[Deserializer.scala 75:21]
  assign _GEN_158 = 5'hd == _T_67 ? commandDeserializer_io_inputData_13 : _GEN_157; // @[Deserializer.scala 75:21]
  assign _GEN_159 = 5'he == _T_67 ? commandDeserializer_io_inputData_14 : _GEN_158; // @[Deserializer.scala 75:21]
  assign _GEN_160 = 5'hf == _T_67 ? commandDeserializer_io_inputData_15 : _GEN_159; // @[Deserializer.scala 75:21]
  assign _GEN_161 = 5'h10 == _T_67 ? commandDeserializer_io_inputData_16 : _GEN_160; // @[Deserializer.scala 75:21]
  assign _GEN_162 = 5'h11 == _T_67 ? commandDeserializer_io_inputData_17 : _GEN_161; // @[Deserializer.scala 75:21]
  assign _GEN_163 = 5'h12 == _T_67 ? commandDeserializer_io_inputData_18 : _GEN_162; // @[Deserializer.scala 75:21]
  assign _GEN_164 = 5'h13 == _T_67 ? commandDeserializer_io_inputData_19 : _GEN_163; // @[Deserializer.scala 75:21]
  assign _GEN_165 = 5'h14 == _T_67 ? commandDeserializer_io_inputData_20 : _GEN_164; // @[Deserializer.scala 75:21]
  assign _GEN_166 = 5'h15 == _T_67 ? commandDeserializer_io_inputData_21 : _GEN_165; // @[Deserializer.scala 75:21]
  assign _GEN_167 = 5'h16 == _T_67 ? commandDeserializer_io_inputData_22 : _GEN_166; // @[Deserializer.scala 75:21]
  assign _GEN_168 = 5'h17 == _T_67 ? commandDeserializer_io_inputData_23 : _GEN_167; // @[Deserializer.scala 75:21]
  assign _T_76 = 24'h7 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_169 = _T_76 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_77 = _GEN_169[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_170 = 5'h1 == _T_77 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_171 = 5'h2 == _T_77 ? commandDeserializer_io_inputData_2 : _GEN_170; // @[Deserializer.scala 75:21]
  assign _GEN_172 = 5'h3 == _T_77 ? commandDeserializer_io_inputData_3 : _GEN_171; // @[Deserializer.scala 75:21]
  assign _GEN_173 = 5'h4 == _T_77 ? commandDeserializer_io_inputData_4 : _GEN_172; // @[Deserializer.scala 75:21]
  assign _GEN_174 = 5'h5 == _T_77 ? commandDeserializer_io_inputData_5 : _GEN_173; // @[Deserializer.scala 75:21]
  assign _GEN_175 = 5'h6 == _T_77 ? commandDeserializer_io_inputData_6 : _GEN_174; // @[Deserializer.scala 75:21]
  assign _GEN_176 = 5'h7 == _T_77 ? commandDeserializer_io_inputData_7 : _GEN_175; // @[Deserializer.scala 75:21]
  assign _GEN_177 = 5'h8 == _T_77 ? commandDeserializer_io_inputData_8 : _GEN_176; // @[Deserializer.scala 75:21]
  assign _GEN_178 = 5'h9 == _T_77 ? commandDeserializer_io_inputData_9 : _GEN_177; // @[Deserializer.scala 75:21]
  assign _GEN_179 = 5'ha == _T_77 ? commandDeserializer_io_inputData_10 : _GEN_178; // @[Deserializer.scala 75:21]
  assign _GEN_180 = 5'hb == _T_77 ? commandDeserializer_io_inputData_11 : _GEN_179; // @[Deserializer.scala 75:21]
  assign _GEN_181 = 5'hc == _T_77 ? commandDeserializer_io_inputData_12 : _GEN_180; // @[Deserializer.scala 75:21]
  assign _GEN_182 = 5'hd == _T_77 ? commandDeserializer_io_inputData_13 : _GEN_181; // @[Deserializer.scala 75:21]
  assign _GEN_183 = 5'he == _T_77 ? commandDeserializer_io_inputData_14 : _GEN_182; // @[Deserializer.scala 75:21]
  assign _GEN_184 = 5'hf == _T_77 ? commandDeserializer_io_inputData_15 : _GEN_183; // @[Deserializer.scala 75:21]
  assign _GEN_185 = 5'h10 == _T_77 ? commandDeserializer_io_inputData_16 : _GEN_184; // @[Deserializer.scala 75:21]
  assign _GEN_186 = 5'h11 == _T_77 ? commandDeserializer_io_inputData_17 : _GEN_185; // @[Deserializer.scala 75:21]
  assign _GEN_187 = 5'h12 == _T_77 ? commandDeserializer_io_inputData_18 : _GEN_186; // @[Deserializer.scala 75:21]
  assign _GEN_188 = 5'h13 == _T_77 ? commandDeserializer_io_inputData_19 : _GEN_187; // @[Deserializer.scala 75:21]
  assign _GEN_189 = 5'h14 == _T_77 ? commandDeserializer_io_inputData_20 : _GEN_188; // @[Deserializer.scala 75:21]
  assign _GEN_190 = 5'h15 == _T_77 ? commandDeserializer_io_inputData_21 : _GEN_189; // @[Deserializer.scala 75:21]
  assign _GEN_191 = 5'h16 == _T_77 ? commandDeserializer_io_inputData_22 : _GEN_190; // @[Deserializer.scala 75:21]
  assign _GEN_192 = 5'h17 == _T_77 ? commandDeserializer_io_inputData_23 : _GEN_191; // @[Deserializer.scala 75:21]
  assign _T_86 = 24'h8 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_193 = _T_86 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_87 = _GEN_193[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_194 = 5'h1 == _T_87 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_195 = 5'h2 == _T_87 ? commandDeserializer_io_inputData_2 : _GEN_194; // @[Deserializer.scala 75:21]
  assign _GEN_196 = 5'h3 == _T_87 ? commandDeserializer_io_inputData_3 : _GEN_195; // @[Deserializer.scala 75:21]
  assign _GEN_197 = 5'h4 == _T_87 ? commandDeserializer_io_inputData_4 : _GEN_196; // @[Deserializer.scala 75:21]
  assign _GEN_198 = 5'h5 == _T_87 ? commandDeserializer_io_inputData_5 : _GEN_197; // @[Deserializer.scala 75:21]
  assign _GEN_199 = 5'h6 == _T_87 ? commandDeserializer_io_inputData_6 : _GEN_198; // @[Deserializer.scala 75:21]
  assign _GEN_200 = 5'h7 == _T_87 ? commandDeserializer_io_inputData_7 : _GEN_199; // @[Deserializer.scala 75:21]
  assign _GEN_201 = 5'h8 == _T_87 ? commandDeserializer_io_inputData_8 : _GEN_200; // @[Deserializer.scala 75:21]
  assign _GEN_202 = 5'h9 == _T_87 ? commandDeserializer_io_inputData_9 : _GEN_201; // @[Deserializer.scala 75:21]
  assign _GEN_203 = 5'ha == _T_87 ? commandDeserializer_io_inputData_10 : _GEN_202; // @[Deserializer.scala 75:21]
  assign _GEN_204 = 5'hb == _T_87 ? commandDeserializer_io_inputData_11 : _GEN_203; // @[Deserializer.scala 75:21]
  assign _GEN_205 = 5'hc == _T_87 ? commandDeserializer_io_inputData_12 : _GEN_204; // @[Deserializer.scala 75:21]
  assign _GEN_206 = 5'hd == _T_87 ? commandDeserializer_io_inputData_13 : _GEN_205; // @[Deserializer.scala 75:21]
  assign _GEN_207 = 5'he == _T_87 ? commandDeserializer_io_inputData_14 : _GEN_206; // @[Deserializer.scala 75:21]
  assign _GEN_208 = 5'hf == _T_87 ? commandDeserializer_io_inputData_15 : _GEN_207; // @[Deserializer.scala 75:21]
  assign _GEN_209 = 5'h10 == _T_87 ? commandDeserializer_io_inputData_16 : _GEN_208; // @[Deserializer.scala 75:21]
  assign _GEN_210 = 5'h11 == _T_87 ? commandDeserializer_io_inputData_17 : _GEN_209; // @[Deserializer.scala 75:21]
  assign _GEN_211 = 5'h12 == _T_87 ? commandDeserializer_io_inputData_18 : _GEN_210; // @[Deserializer.scala 75:21]
  assign _GEN_212 = 5'h13 == _T_87 ? commandDeserializer_io_inputData_19 : _GEN_211; // @[Deserializer.scala 75:21]
  assign _GEN_213 = 5'h14 == _T_87 ? commandDeserializer_io_inputData_20 : _GEN_212; // @[Deserializer.scala 75:21]
  assign _GEN_214 = 5'h15 == _T_87 ? commandDeserializer_io_inputData_21 : _GEN_213; // @[Deserializer.scala 75:21]
  assign _GEN_215 = 5'h16 == _T_87 ? commandDeserializer_io_inputData_22 : _GEN_214; // @[Deserializer.scala 75:21]
  assign _GEN_216 = 5'h17 == _T_87 ? commandDeserializer_io_inputData_23 : _GEN_215; // @[Deserializer.scala 75:21]
  assign _T_96 = 24'h9 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_217 = _T_96 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_97 = _GEN_217[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_218 = 5'h1 == _T_97 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_219 = 5'h2 == _T_97 ? commandDeserializer_io_inputData_2 : _GEN_218; // @[Deserializer.scala 75:21]
  assign _GEN_220 = 5'h3 == _T_97 ? commandDeserializer_io_inputData_3 : _GEN_219; // @[Deserializer.scala 75:21]
  assign _GEN_221 = 5'h4 == _T_97 ? commandDeserializer_io_inputData_4 : _GEN_220; // @[Deserializer.scala 75:21]
  assign _GEN_222 = 5'h5 == _T_97 ? commandDeserializer_io_inputData_5 : _GEN_221; // @[Deserializer.scala 75:21]
  assign _GEN_223 = 5'h6 == _T_97 ? commandDeserializer_io_inputData_6 : _GEN_222; // @[Deserializer.scala 75:21]
  assign _GEN_224 = 5'h7 == _T_97 ? commandDeserializer_io_inputData_7 : _GEN_223; // @[Deserializer.scala 75:21]
  assign _GEN_225 = 5'h8 == _T_97 ? commandDeserializer_io_inputData_8 : _GEN_224; // @[Deserializer.scala 75:21]
  assign _GEN_226 = 5'h9 == _T_97 ? commandDeserializer_io_inputData_9 : _GEN_225; // @[Deserializer.scala 75:21]
  assign _GEN_227 = 5'ha == _T_97 ? commandDeserializer_io_inputData_10 : _GEN_226; // @[Deserializer.scala 75:21]
  assign _GEN_228 = 5'hb == _T_97 ? commandDeserializer_io_inputData_11 : _GEN_227; // @[Deserializer.scala 75:21]
  assign _GEN_229 = 5'hc == _T_97 ? commandDeserializer_io_inputData_12 : _GEN_228; // @[Deserializer.scala 75:21]
  assign _GEN_230 = 5'hd == _T_97 ? commandDeserializer_io_inputData_13 : _GEN_229; // @[Deserializer.scala 75:21]
  assign _GEN_231 = 5'he == _T_97 ? commandDeserializer_io_inputData_14 : _GEN_230; // @[Deserializer.scala 75:21]
  assign _GEN_232 = 5'hf == _T_97 ? commandDeserializer_io_inputData_15 : _GEN_231; // @[Deserializer.scala 75:21]
  assign _GEN_233 = 5'h10 == _T_97 ? commandDeserializer_io_inputData_16 : _GEN_232; // @[Deserializer.scala 75:21]
  assign _GEN_234 = 5'h11 == _T_97 ? commandDeserializer_io_inputData_17 : _GEN_233; // @[Deserializer.scala 75:21]
  assign _GEN_235 = 5'h12 == _T_97 ? commandDeserializer_io_inputData_18 : _GEN_234; // @[Deserializer.scala 75:21]
  assign _GEN_236 = 5'h13 == _T_97 ? commandDeserializer_io_inputData_19 : _GEN_235; // @[Deserializer.scala 75:21]
  assign _GEN_237 = 5'h14 == _T_97 ? commandDeserializer_io_inputData_20 : _GEN_236; // @[Deserializer.scala 75:21]
  assign _GEN_238 = 5'h15 == _T_97 ? commandDeserializer_io_inputData_21 : _GEN_237; // @[Deserializer.scala 75:21]
  assign _GEN_239 = 5'h16 == _T_97 ? commandDeserializer_io_inputData_22 : _GEN_238; // @[Deserializer.scala 75:21]
  assign _GEN_240 = 5'h17 == _T_97 ? commandDeserializer_io_inputData_23 : _GEN_239; // @[Deserializer.scala 75:21]
  assign _T_106 = 24'ha + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_241 = _T_106 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_107 = _GEN_241[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_242 = 5'h1 == _T_107 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_243 = 5'h2 == _T_107 ? commandDeserializer_io_inputData_2 : _GEN_242; // @[Deserializer.scala 75:21]
  assign _GEN_244 = 5'h3 == _T_107 ? commandDeserializer_io_inputData_3 : _GEN_243; // @[Deserializer.scala 75:21]
  assign _GEN_245 = 5'h4 == _T_107 ? commandDeserializer_io_inputData_4 : _GEN_244; // @[Deserializer.scala 75:21]
  assign _GEN_246 = 5'h5 == _T_107 ? commandDeserializer_io_inputData_5 : _GEN_245; // @[Deserializer.scala 75:21]
  assign _GEN_247 = 5'h6 == _T_107 ? commandDeserializer_io_inputData_6 : _GEN_246; // @[Deserializer.scala 75:21]
  assign _GEN_248 = 5'h7 == _T_107 ? commandDeserializer_io_inputData_7 : _GEN_247; // @[Deserializer.scala 75:21]
  assign _GEN_249 = 5'h8 == _T_107 ? commandDeserializer_io_inputData_8 : _GEN_248; // @[Deserializer.scala 75:21]
  assign _GEN_250 = 5'h9 == _T_107 ? commandDeserializer_io_inputData_9 : _GEN_249; // @[Deserializer.scala 75:21]
  assign _GEN_251 = 5'ha == _T_107 ? commandDeserializer_io_inputData_10 : _GEN_250; // @[Deserializer.scala 75:21]
  assign _GEN_252 = 5'hb == _T_107 ? commandDeserializer_io_inputData_11 : _GEN_251; // @[Deserializer.scala 75:21]
  assign _GEN_253 = 5'hc == _T_107 ? commandDeserializer_io_inputData_12 : _GEN_252; // @[Deserializer.scala 75:21]
  assign _GEN_254 = 5'hd == _T_107 ? commandDeserializer_io_inputData_13 : _GEN_253; // @[Deserializer.scala 75:21]
  assign _GEN_255 = 5'he == _T_107 ? commandDeserializer_io_inputData_14 : _GEN_254; // @[Deserializer.scala 75:21]
  assign _GEN_256 = 5'hf == _T_107 ? commandDeserializer_io_inputData_15 : _GEN_255; // @[Deserializer.scala 75:21]
  assign _GEN_257 = 5'h10 == _T_107 ? commandDeserializer_io_inputData_16 : _GEN_256; // @[Deserializer.scala 75:21]
  assign _GEN_258 = 5'h11 == _T_107 ? commandDeserializer_io_inputData_17 : _GEN_257; // @[Deserializer.scala 75:21]
  assign _GEN_259 = 5'h12 == _T_107 ? commandDeserializer_io_inputData_18 : _GEN_258; // @[Deserializer.scala 75:21]
  assign _GEN_260 = 5'h13 == _T_107 ? commandDeserializer_io_inputData_19 : _GEN_259; // @[Deserializer.scala 75:21]
  assign _GEN_261 = 5'h14 == _T_107 ? commandDeserializer_io_inputData_20 : _GEN_260; // @[Deserializer.scala 75:21]
  assign _GEN_262 = 5'h15 == _T_107 ? commandDeserializer_io_inputData_21 : _GEN_261; // @[Deserializer.scala 75:21]
  assign _GEN_263 = 5'h16 == _T_107 ? commandDeserializer_io_inputData_22 : _GEN_262; // @[Deserializer.scala 75:21]
  assign _GEN_264 = 5'h17 == _T_107 ? commandDeserializer_io_inputData_23 : _GEN_263; // @[Deserializer.scala 75:21]
  assign _T_116 = 24'hb + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_265 = _T_116 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_117 = _GEN_265[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_266 = 5'h1 == _T_117 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_267 = 5'h2 == _T_117 ? commandDeserializer_io_inputData_2 : _GEN_266; // @[Deserializer.scala 75:21]
  assign _GEN_268 = 5'h3 == _T_117 ? commandDeserializer_io_inputData_3 : _GEN_267; // @[Deserializer.scala 75:21]
  assign _GEN_269 = 5'h4 == _T_117 ? commandDeserializer_io_inputData_4 : _GEN_268; // @[Deserializer.scala 75:21]
  assign _GEN_270 = 5'h5 == _T_117 ? commandDeserializer_io_inputData_5 : _GEN_269; // @[Deserializer.scala 75:21]
  assign _GEN_271 = 5'h6 == _T_117 ? commandDeserializer_io_inputData_6 : _GEN_270; // @[Deserializer.scala 75:21]
  assign _GEN_272 = 5'h7 == _T_117 ? commandDeserializer_io_inputData_7 : _GEN_271; // @[Deserializer.scala 75:21]
  assign _GEN_273 = 5'h8 == _T_117 ? commandDeserializer_io_inputData_8 : _GEN_272; // @[Deserializer.scala 75:21]
  assign _GEN_274 = 5'h9 == _T_117 ? commandDeserializer_io_inputData_9 : _GEN_273; // @[Deserializer.scala 75:21]
  assign _GEN_275 = 5'ha == _T_117 ? commandDeserializer_io_inputData_10 : _GEN_274; // @[Deserializer.scala 75:21]
  assign _GEN_276 = 5'hb == _T_117 ? commandDeserializer_io_inputData_11 : _GEN_275; // @[Deserializer.scala 75:21]
  assign _GEN_277 = 5'hc == _T_117 ? commandDeserializer_io_inputData_12 : _GEN_276; // @[Deserializer.scala 75:21]
  assign _GEN_278 = 5'hd == _T_117 ? commandDeserializer_io_inputData_13 : _GEN_277; // @[Deserializer.scala 75:21]
  assign _GEN_279 = 5'he == _T_117 ? commandDeserializer_io_inputData_14 : _GEN_278; // @[Deserializer.scala 75:21]
  assign _GEN_280 = 5'hf == _T_117 ? commandDeserializer_io_inputData_15 : _GEN_279; // @[Deserializer.scala 75:21]
  assign _GEN_281 = 5'h10 == _T_117 ? commandDeserializer_io_inputData_16 : _GEN_280; // @[Deserializer.scala 75:21]
  assign _GEN_282 = 5'h11 == _T_117 ? commandDeserializer_io_inputData_17 : _GEN_281; // @[Deserializer.scala 75:21]
  assign _GEN_283 = 5'h12 == _T_117 ? commandDeserializer_io_inputData_18 : _GEN_282; // @[Deserializer.scala 75:21]
  assign _GEN_284 = 5'h13 == _T_117 ? commandDeserializer_io_inputData_19 : _GEN_283; // @[Deserializer.scala 75:21]
  assign _GEN_285 = 5'h14 == _T_117 ? commandDeserializer_io_inputData_20 : _GEN_284; // @[Deserializer.scala 75:21]
  assign _GEN_286 = 5'h15 == _T_117 ? commandDeserializer_io_inputData_21 : _GEN_285; // @[Deserializer.scala 75:21]
  assign _GEN_287 = 5'h16 == _T_117 ? commandDeserializer_io_inputData_22 : _GEN_286; // @[Deserializer.scala 75:21]
  assign _GEN_288 = 5'h17 == _T_117 ? commandDeserializer_io_inputData_23 : _GEN_287; // @[Deserializer.scala 75:21]
  assign _T_126 = 24'hc + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_289 = _T_126 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_127 = _GEN_289[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_290 = 5'h1 == _T_127 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_291 = 5'h2 == _T_127 ? commandDeserializer_io_inputData_2 : _GEN_290; // @[Deserializer.scala 75:21]
  assign _GEN_292 = 5'h3 == _T_127 ? commandDeserializer_io_inputData_3 : _GEN_291; // @[Deserializer.scala 75:21]
  assign _GEN_293 = 5'h4 == _T_127 ? commandDeserializer_io_inputData_4 : _GEN_292; // @[Deserializer.scala 75:21]
  assign _GEN_294 = 5'h5 == _T_127 ? commandDeserializer_io_inputData_5 : _GEN_293; // @[Deserializer.scala 75:21]
  assign _GEN_295 = 5'h6 == _T_127 ? commandDeserializer_io_inputData_6 : _GEN_294; // @[Deserializer.scala 75:21]
  assign _GEN_296 = 5'h7 == _T_127 ? commandDeserializer_io_inputData_7 : _GEN_295; // @[Deserializer.scala 75:21]
  assign _GEN_297 = 5'h8 == _T_127 ? commandDeserializer_io_inputData_8 : _GEN_296; // @[Deserializer.scala 75:21]
  assign _GEN_298 = 5'h9 == _T_127 ? commandDeserializer_io_inputData_9 : _GEN_297; // @[Deserializer.scala 75:21]
  assign _GEN_299 = 5'ha == _T_127 ? commandDeserializer_io_inputData_10 : _GEN_298; // @[Deserializer.scala 75:21]
  assign _GEN_300 = 5'hb == _T_127 ? commandDeserializer_io_inputData_11 : _GEN_299; // @[Deserializer.scala 75:21]
  assign _GEN_301 = 5'hc == _T_127 ? commandDeserializer_io_inputData_12 : _GEN_300; // @[Deserializer.scala 75:21]
  assign _GEN_302 = 5'hd == _T_127 ? commandDeserializer_io_inputData_13 : _GEN_301; // @[Deserializer.scala 75:21]
  assign _GEN_303 = 5'he == _T_127 ? commandDeserializer_io_inputData_14 : _GEN_302; // @[Deserializer.scala 75:21]
  assign _GEN_304 = 5'hf == _T_127 ? commandDeserializer_io_inputData_15 : _GEN_303; // @[Deserializer.scala 75:21]
  assign _GEN_305 = 5'h10 == _T_127 ? commandDeserializer_io_inputData_16 : _GEN_304; // @[Deserializer.scala 75:21]
  assign _GEN_306 = 5'h11 == _T_127 ? commandDeserializer_io_inputData_17 : _GEN_305; // @[Deserializer.scala 75:21]
  assign _GEN_307 = 5'h12 == _T_127 ? commandDeserializer_io_inputData_18 : _GEN_306; // @[Deserializer.scala 75:21]
  assign _GEN_308 = 5'h13 == _T_127 ? commandDeserializer_io_inputData_19 : _GEN_307; // @[Deserializer.scala 75:21]
  assign _GEN_309 = 5'h14 == _T_127 ? commandDeserializer_io_inputData_20 : _GEN_308; // @[Deserializer.scala 75:21]
  assign _GEN_310 = 5'h15 == _T_127 ? commandDeserializer_io_inputData_21 : _GEN_309; // @[Deserializer.scala 75:21]
  assign _GEN_311 = 5'h16 == _T_127 ? commandDeserializer_io_inputData_22 : _GEN_310; // @[Deserializer.scala 75:21]
  assign _GEN_312 = 5'h17 == _T_127 ? commandDeserializer_io_inputData_23 : _GEN_311; // @[Deserializer.scala 75:21]
  assign _T_136 = 24'hd + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_313 = _T_136 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_137 = _GEN_313[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_314 = 5'h1 == _T_137 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_315 = 5'h2 == _T_137 ? commandDeserializer_io_inputData_2 : _GEN_314; // @[Deserializer.scala 75:21]
  assign _GEN_316 = 5'h3 == _T_137 ? commandDeserializer_io_inputData_3 : _GEN_315; // @[Deserializer.scala 75:21]
  assign _GEN_317 = 5'h4 == _T_137 ? commandDeserializer_io_inputData_4 : _GEN_316; // @[Deserializer.scala 75:21]
  assign _GEN_318 = 5'h5 == _T_137 ? commandDeserializer_io_inputData_5 : _GEN_317; // @[Deserializer.scala 75:21]
  assign _GEN_319 = 5'h6 == _T_137 ? commandDeserializer_io_inputData_6 : _GEN_318; // @[Deserializer.scala 75:21]
  assign _GEN_320 = 5'h7 == _T_137 ? commandDeserializer_io_inputData_7 : _GEN_319; // @[Deserializer.scala 75:21]
  assign _GEN_321 = 5'h8 == _T_137 ? commandDeserializer_io_inputData_8 : _GEN_320; // @[Deserializer.scala 75:21]
  assign _GEN_322 = 5'h9 == _T_137 ? commandDeserializer_io_inputData_9 : _GEN_321; // @[Deserializer.scala 75:21]
  assign _GEN_323 = 5'ha == _T_137 ? commandDeserializer_io_inputData_10 : _GEN_322; // @[Deserializer.scala 75:21]
  assign _GEN_324 = 5'hb == _T_137 ? commandDeserializer_io_inputData_11 : _GEN_323; // @[Deserializer.scala 75:21]
  assign _GEN_325 = 5'hc == _T_137 ? commandDeserializer_io_inputData_12 : _GEN_324; // @[Deserializer.scala 75:21]
  assign _GEN_326 = 5'hd == _T_137 ? commandDeserializer_io_inputData_13 : _GEN_325; // @[Deserializer.scala 75:21]
  assign _GEN_327 = 5'he == _T_137 ? commandDeserializer_io_inputData_14 : _GEN_326; // @[Deserializer.scala 75:21]
  assign _GEN_328 = 5'hf == _T_137 ? commandDeserializer_io_inputData_15 : _GEN_327; // @[Deserializer.scala 75:21]
  assign _GEN_329 = 5'h10 == _T_137 ? commandDeserializer_io_inputData_16 : _GEN_328; // @[Deserializer.scala 75:21]
  assign _GEN_330 = 5'h11 == _T_137 ? commandDeserializer_io_inputData_17 : _GEN_329; // @[Deserializer.scala 75:21]
  assign _GEN_331 = 5'h12 == _T_137 ? commandDeserializer_io_inputData_18 : _GEN_330; // @[Deserializer.scala 75:21]
  assign _GEN_332 = 5'h13 == _T_137 ? commandDeserializer_io_inputData_19 : _GEN_331; // @[Deserializer.scala 75:21]
  assign _GEN_333 = 5'h14 == _T_137 ? commandDeserializer_io_inputData_20 : _GEN_332; // @[Deserializer.scala 75:21]
  assign _GEN_334 = 5'h15 == _T_137 ? commandDeserializer_io_inputData_21 : _GEN_333; // @[Deserializer.scala 75:21]
  assign _GEN_335 = 5'h16 == _T_137 ? commandDeserializer_io_inputData_22 : _GEN_334; // @[Deserializer.scala 75:21]
  assign _GEN_336 = 5'h17 == _T_137 ? commandDeserializer_io_inputData_23 : _GEN_335; // @[Deserializer.scala 75:21]
  assign _T_146 = 24'he + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_337 = _T_146 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_147 = _GEN_337[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_338 = 5'h1 == _T_147 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_339 = 5'h2 == _T_147 ? commandDeserializer_io_inputData_2 : _GEN_338; // @[Deserializer.scala 75:21]
  assign _GEN_340 = 5'h3 == _T_147 ? commandDeserializer_io_inputData_3 : _GEN_339; // @[Deserializer.scala 75:21]
  assign _GEN_341 = 5'h4 == _T_147 ? commandDeserializer_io_inputData_4 : _GEN_340; // @[Deserializer.scala 75:21]
  assign _GEN_342 = 5'h5 == _T_147 ? commandDeserializer_io_inputData_5 : _GEN_341; // @[Deserializer.scala 75:21]
  assign _GEN_343 = 5'h6 == _T_147 ? commandDeserializer_io_inputData_6 : _GEN_342; // @[Deserializer.scala 75:21]
  assign _GEN_344 = 5'h7 == _T_147 ? commandDeserializer_io_inputData_7 : _GEN_343; // @[Deserializer.scala 75:21]
  assign _GEN_345 = 5'h8 == _T_147 ? commandDeserializer_io_inputData_8 : _GEN_344; // @[Deserializer.scala 75:21]
  assign _GEN_346 = 5'h9 == _T_147 ? commandDeserializer_io_inputData_9 : _GEN_345; // @[Deserializer.scala 75:21]
  assign _GEN_347 = 5'ha == _T_147 ? commandDeserializer_io_inputData_10 : _GEN_346; // @[Deserializer.scala 75:21]
  assign _GEN_348 = 5'hb == _T_147 ? commandDeserializer_io_inputData_11 : _GEN_347; // @[Deserializer.scala 75:21]
  assign _GEN_349 = 5'hc == _T_147 ? commandDeserializer_io_inputData_12 : _GEN_348; // @[Deserializer.scala 75:21]
  assign _GEN_350 = 5'hd == _T_147 ? commandDeserializer_io_inputData_13 : _GEN_349; // @[Deserializer.scala 75:21]
  assign _GEN_351 = 5'he == _T_147 ? commandDeserializer_io_inputData_14 : _GEN_350; // @[Deserializer.scala 75:21]
  assign _GEN_352 = 5'hf == _T_147 ? commandDeserializer_io_inputData_15 : _GEN_351; // @[Deserializer.scala 75:21]
  assign _GEN_353 = 5'h10 == _T_147 ? commandDeserializer_io_inputData_16 : _GEN_352; // @[Deserializer.scala 75:21]
  assign _GEN_354 = 5'h11 == _T_147 ? commandDeserializer_io_inputData_17 : _GEN_353; // @[Deserializer.scala 75:21]
  assign _GEN_355 = 5'h12 == _T_147 ? commandDeserializer_io_inputData_18 : _GEN_354; // @[Deserializer.scala 75:21]
  assign _GEN_356 = 5'h13 == _T_147 ? commandDeserializer_io_inputData_19 : _GEN_355; // @[Deserializer.scala 75:21]
  assign _GEN_357 = 5'h14 == _T_147 ? commandDeserializer_io_inputData_20 : _GEN_356; // @[Deserializer.scala 75:21]
  assign _GEN_358 = 5'h15 == _T_147 ? commandDeserializer_io_inputData_21 : _GEN_357; // @[Deserializer.scala 75:21]
  assign _GEN_359 = 5'h16 == _T_147 ? commandDeserializer_io_inputData_22 : _GEN_358; // @[Deserializer.scala 75:21]
  assign _GEN_360 = 5'h17 == _T_147 ? commandDeserializer_io_inputData_23 : _GEN_359; // @[Deserializer.scala 75:21]
  assign _T_149 = _GEN_360 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_156 = 24'hf + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_361 = _T_156 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_157 = _GEN_361[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_362 = 5'h1 == _T_157 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_363 = 5'h2 == _T_157 ? commandDeserializer_io_inputData_2 : _GEN_362; // @[Deserializer.scala 75:21]
  assign _GEN_364 = 5'h3 == _T_157 ? commandDeserializer_io_inputData_3 : _GEN_363; // @[Deserializer.scala 75:21]
  assign _GEN_365 = 5'h4 == _T_157 ? commandDeserializer_io_inputData_4 : _GEN_364; // @[Deserializer.scala 75:21]
  assign _GEN_366 = 5'h5 == _T_157 ? commandDeserializer_io_inputData_5 : _GEN_365; // @[Deserializer.scala 75:21]
  assign _GEN_367 = 5'h6 == _T_157 ? commandDeserializer_io_inputData_6 : _GEN_366; // @[Deserializer.scala 75:21]
  assign _GEN_368 = 5'h7 == _T_157 ? commandDeserializer_io_inputData_7 : _GEN_367; // @[Deserializer.scala 75:21]
  assign _GEN_369 = 5'h8 == _T_157 ? commandDeserializer_io_inputData_8 : _GEN_368; // @[Deserializer.scala 75:21]
  assign _GEN_370 = 5'h9 == _T_157 ? commandDeserializer_io_inputData_9 : _GEN_369; // @[Deserializer.scala 75:21]
  assign _GEN_371 = 5'ha == _T_157 ? commandDeserializer_io_inputData_10 : _GEN_370; // @[Deserializer.scala 75:21]
  assign _GEN_372 = 5'hb == _T_157 ? commandDeserializer_io_inputData_11 : _GEN_371; // @[Deserializer.scala 75:21]
  assign _GEN_373 = 5'hc == _T_157 ? commandDeserializer_io_inputData_12 : _GEN_372; // @[Deserializer.scala 75:21]
  assign _GEN_374 = 5'hd == _T_157 ? commandDeserializer_io_inputData_13 : _GEN_373; // @[Deserializer.scala 75:21]
  assign _GEN_375 = 5'he == _T_157 ? commandDeserializer_io_inputData_14 : _GEN_374; // @[Deserializer.scala 75:21]
  assign _GEN_376 = 5'hf == _T_157 ? commandDeserializer_io_inputData_15 : _GEN_375; // @[Deserializer.scala 75:21]
  assign _GEN_377 = 5'h10 == _T_157 ? commandDeserializer_io_inputData_16 : _GEN_376; // @[Deserializer.scala 75:21]
  assign _GEN_378 = 5'h11 == _T_157 ? commandDeserializer_io_inputData_17 : _GEN_377; // @[Deserializer.scala 75:21]
  assign _GEN_379 = 5'h12 == _T_157 ? commandDeserializer_io_inputData_18 : _GEN_378; // @[Deserializer.scala 75:21]
  assign _GEN_380 = 5'h13 == _T_157 ? commandDeserializer_io_inputData_19 : _GEN_379; // @[Deserializer.scala 75:21]
  assign _GEN_381 = 5'h14 == _T_157 ? commandDeserializer_io_inputData_20 : _GEN_380; // @[Deserializer.scala 75:21]
  assign _GEN_382 = 5'h15 == _T_157 ? commandDeserializer_io_inputData_21 : _GEN_381; // @[Deserializer.scala 75:21]
  assign _GEN_383 = 5'h16 == _T_157 ? commandDeserializer_io_inputData_22 : _GEN_382; // @[Deserializer.scala 75:21]
  assign _GEN_384 = 5'h17 == _T_157 ? commandDeserializer_io_inputData_23 : _GEN_383; // @[Deserializer.scala 75:21]
  assign _T_159 = _GEN_384 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_166 = 24'h10 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_385 = _T_166 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_167 = _GEN_385[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_386 = 5'h1 == _T_167 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_387 = 5'h2 == _T_167 ? commandDeserializer_io_inputData_2 : _GEN_386; // @[Deserializer.scala 75:21]
  assign _GEN_388 = 5'h3 == _T_167 ? commandDeserializer_io_inputData_3 : _GEN_387; // @[Deserializer.scala 75:21]
  assign _GEN_389 = 5'h4 == _T_167 ? commandDeserializer_io_inputData_4 : _GEN_388; // @[Deserializer.scala 75:21]
  assign _GEN_390 = 5'h5 == _T_167 ? commandDeserializer_io_inputData_5 : _GEN_389; // @[Deserializer.scala 75:21]
  assign _GEN_391 = 5'h6 == _T_167 ? commandDeserializer_io_inputData_6 : _GEN_390; // @[Deserializer.scala 75:21]
  assign _GEN_392 = 5'h7 == _T_167 ? commandDeserializer_io_inputData_7 : _GEN_391; // @[Deserializer.scala 75:21]
  assign _GEN_393 = 5'h8 == _T_167 ? commandDeserializer_io_inputData_8 : _GEN_392; // @[Deserializer.scala 75:21]
  assign _GEN_394 = 5'h9 == _T_167 ? commandDeserializer_io_inputData_9 : _GEN_393; // @[Deserializer.scala 75:21]
  assign _GEN_395 = 5'ha == _T_167 ? commandDeserializer_io_inputData_10 : _GEN_394; // @[Deserializer.scala 75:21]
  assign _GEN_396 = 5'hb == _T_167 ? commandDeserializer_io_inputData_11 : _GEN_395; // @[Deserializer.scala 75:21]
  assign _GEN_397 = 5'hc == _T_167 ? commandDeserializer_io_inputData_12 : _GEN_396; // @[Deserializer.scala 75:21]
  assign _GEN_398 = 5'hd == _T_167 ? commandDeserializer_io_inputData_13 : _GEN_397; // @[Deserializer.scala 75:21]
  assign _GEN_399 = 5'he == _T_167 ? commandDeserializer_io_inputData_14 : _GEN_398; // @[Deserializer.scala 75:21]
  assign _GEN_400 = 5'hf == _T_167 ? commandDeserializer_io_inputData_15 : _GEN_399; // @[Deserializer.scala 75:21]
  assign _GEN_401 = 5'h10 == _T_167 ? commandDeserializer_io_inputData_16 : _GEN_400; // @[Deserializer.scala 75:21]
  assign _GEN_402 = 5'h11 == _T_167 ? commandDeserializer_io_inputData_17 : _GEN_401; // @[Deserializer.scala 75:21]
  assign _GEN_403 = 5'h12 == _T_167 ? commandDeserializer_io_inputData_18 : _GEN_402; // @[Deserializer.scala 75:21]
  assign _GEN_404 = 5'h13 == _T_167 ? commandDeserializer_io_inputData_19 : _GEN_403; // @[Deserializer.scala 75:21]
  assign _GEN_405 = 5'h14 == _T_167 ? commandDeserializer_io_inputData_20 : _GEN_404; // @[Deserializer.scala 75:21]
  assign _GEN_406 = 5'h15 == _T_167 ? commandDeserializer_io_inputData_21 : _GEN_405; // @[Deserializer.scala 75:21]
  assign _GEN_407 = 5'h16 == _T_167 ? commandDeserializer_io_inputData_22 : _GEN_406; // @[Deserializer.scala 75:21]
  assign _GEN_408 = 5'h17 == _T_167 ? commandDeserializer_io_inputData_23 : _GEN_407; // @[Deserializer.scala 75:21]
  assign _T_176 = 24'h11 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_409 = _T_176 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_177 = _GEN_409[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_410 = 5'h1 == _T_177 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_411 = 5'h2 == _T_177 ? commandDeserializer_io_inputData_2 : _GEN_410; // @[Deserializer.scala 75:21]
  assign _GEN_412 = 5'h3 == _T_177 ? commandDeserializer_io_inputData_3 : _GEN_411; // @[Deserializer.scala 75:21]
  assign _GEN_413 = 5'h4 == _T_177 ? commandDeserializer_io_inputData_4 : _GEN_412; // @[Deserializer.scala 75:21]
  assign _GEN_414 = 5'h5 == _T_177 ? commandDeserializer_io_inputData_5 : _GEN_413; // @[Deserializer.scala 75:21]
  assign _GEN_415 = 5'h6 == _T_177 ? commandDeserializer_io_inputData_6 : _GEN_414; // @[Deserializer.scala 75:21]
  assign _GEN_416 = 5'h7 == _T_177 ? commandDeserializer_io_inputData_7 : _GEN_415; // @[Deserializer.scala 75:21]
  assign _GEN_417 = 5'h8 == _T_177 ? commandDeserializer_io_inputData_8 : _GEN_416; // @[Deserializer.scala 75:21]
  assign _GEN_418 = 5'h9 == _T_177 ? commandDeserializer_io_inputData_9 : _GEN_417; // @[Deserializer.scala 75:21]
  assign _GEN_419 = 5'ha == _T_177 ? commandDeserializer_io_inputData_10 : _GEN_418; // @[Deserializer.scala 75:21]
  assign _GEN_420 = 5'hb == _T_177 ? commandDeserializer_io_inputData_11 : _GEN_419; // @[Deserializer.scala 75:21]
  assign _GEN_421 = 5'hc == _T_177 ? commandDeserializer_io_inputData_12 : _GEN_420; // @[Deserializer.scala 75:21]
  assign _GEN_422 = 5'hd == _T_177 ? commandDeserializer_io_inputData_13 : _GEN_421; // @[Deserializer.scala 75:21]
  assign _GEN_423 = 5'he == _T_177 ? commandDeserializer_io_inputData_14 : _GEN_422; // @[Deserializer.scala 75:21]
  assign _GEN_424 = 5'hf == _T_177 ? commandDeserializer_io_inputData_15 : _GEN_423; // @[Deserializer.scala 75:21]
  assign _GEN_425 = 5'h10 == _T_177 ? commandDeserializer_io_inputData_16 : _GEN_424; // @[Deserializer.scala 75:21]
  assign _GEN_426 = 5'h11 == _T_177 ? commandDeserializer_io_inputData_17 : _GEN_425; // @[Deserializer.scala 75:21]
  assign _GEN_427 = 5'h12 == _T_177 ? commandDeserializer_io_inputData_18 : _GEN_426; // @[Deserializer.scala 75:21]
  assign _GEN_428 = 5'h13 == _T_177 ? commandDeserializer_io_inputData_19 : _GEN_427; // @[Deserializer.scala 75:21]
  assign _GEN_429 = 5'h14 == _T_177 ? commandDeserializer_io_inputData_20 : _GEN_428; // @[Deserializer.scala 75:21]
  assign _GEN_430 = 5'h15 == _T_177 ? commandDeserializer_io_inputData_21 : _GEN_429; // @[Deserializer.scala 75:21]
  assign _GEN_431 = 5'h16 == _T_177 ? commandDeserializer_io_inputData_22 : _GEN_430; // @[Deserializer.scala 75:21]
  assign _GEN_432 = 5'h17 == _T_177 ? commandDeserializer_io_inputData_23 : _GEN_431; // @[Deserializer.scala 75:21]
  assign _T_186 = 24'h12 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_433 = _T_186 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_187 = _GEN_433[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_434 = 5'h1 == _T_187 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_435 = 5'h2 == _T_187 ? commandDeserializer_io_inputData_2 : _GEN_434; // @[Deserializer.scala 75:21]
  assign _GEN_436 = 5'h3 == _T_187 ? commandDeserializer_io_inputData_3 : _GEN_435; // @[Deserializer.scala 75:21]
  assign _GEN_437 = 5'h4 == _T_187 ? commandDeserializer_io_inputData_4 : _GEN_436; // @[Deserializer.scala 75:21]
  assign _GEN_438 = 5'h5 == _T_187 ? commandDeserializer_io_inputData_5 : _GEN_437; // @[Deserializer.scala 75:21]
  assign _GEN_439 = 5'h6 == _T_187 ? commandDeserializer_io_inputData_6 : _GEN_438; // @[Deserializer.scala 75:21]
  assign _GEN_440 = 5'h7 == _T_187 ? commandDeserializer_io_inputData_7 : _GEN_439; // @[Deserializer.scala 75:21]
  assign _GEN_441 = 5'h8 == _T_187 ? commandDeserializer_io_inputData_8 : _GEN_440; // @[Deserializer.scala 75:21]
  assign _GEN_442 = 5'h9 == _T_187 ? commandDeserializer_io_inputData_9 : _GEN_441; // @[Deserializer.scala 75:21]
  assign _GEN_443 = 5'ha == _T_187 ? commandDeserializer_io_inputData_10 : _GEN_442; // @[Deserializer.scala 75:21]
  assign _GEN_444 = 5'hb == _T_187 ? commandDeserializer_io_inputData_11 : _GEN_443; // @[Deserializer.scala 75:21]
  assign _GEN_445 = 5'hc == _T_187 ? commandDeserializer_io_inputData_12 : _GEN_444; // @[Deserializer.scala 75:21]
  assign _GEN_446 = 5'hd == _T_187 ? commandDeserializer_io_inputData_13 : _GEN_445; // @[Deserializer.scala 75:21]
  assign _GEN_447 = 5'he == _T_187 ? commandDeserializer_io_inputData_14 : _GEN_446; // @[Deserializer.scala 75:21]
  assign _GEN_448 = 5'hf == _T_187 ? commandDeserializer_io_inputData_15 : _GEN_447; // @[Deserializer.scala 75:21]
  assign _GEN_449 = 5'h10 == _T_187 ? commandDeserializer_io_inputData_16 : _GEN_448; // @[Deserializer.scala 75:21]
  assign _GEN_450 = 5'h11 == _T_187 ? commandDeserializer_io_inputData_17 : _GEN_449; // @[Deserializer.scala 75:21]
  assign _GEN_451 = 5'h12 == _T_187 ? commandDeserializer_io_inputData_18 : _GEN_450; // @[Deserializer.scala 75:21]
  assign _GEN_452 = 5'h13 == _T_187 ? commandDeserializer_io_inputData_19 : _GEN_451; // @[Deserializer.scala 75:21]
  assign _GEN_453 = 5'h14 == _T_187 ? commandDeserializer_io_inputData_20 : _GEN_452; // @[Deserializer.scala 75:21]
  assign _GEN_454 = 5'h15 == _T_187 ? commandDeserializer_io_inputData_21 : _GEN_453; // @[Deserializer.scala 75:21]
  assign _GEN_455 = 5'h16 == _T_187 ? commandDeserializer_io_inputData_22 : _GEN_454; // @[Deserializer.scala 75:21]
  assign _GEN_456 = 5'h17 == _T_187 ? commandDeserializer_io_inputData_23 : _GEN_455; // @[Deserializer.scala 75:21]
  assign _T_196 = 24'h13 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_457 = _T_196 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_197 = _GEN_457[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_458 = 5'h1 == _T_197 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_459 = 5'h2 == _T_197 ? commandDeserializer_io_inputData_2 : _GEN_458; // @[Deserializer.scala 75:21]
  assign _GEN_460 = 5'h3 == _T_197 ? commandDeserializer_io_inputData_3 : _GEN_459; // @[Deserializer.scala 75:21]
  assign _GEN_461 = 5'h4 == _T_197 ? commandDeserializer_io_inputData_4 : _GEN_460; // @[Deserializer.scala 75:21]
  assign _GEN_462 = 5'h5 == _T_197 ? commandDeserializer_io_inputData_5 : _GEN_461; // @[Deserializer.scala 75:21]
  assign _GEN_463 = 5'h6 == _T_197 ? commandDeserializer_io_inputData_6 : _GEN_462; // @[Deserializer.scala 75:21]
  assign _GEN_464 = 5'h7 == _T_197 ? commandDeserializer_io_inputData_7 : _GEN_463; // @[Deserializer.scala 75:21]
  assign _GEN_465 = 5'h8 == _T_197 ? commandDeserializer_io_inputData_8 : _GEN_464; // @[Deserializer.scala 75:21]
  assign _GEN_466 = 5'h9 == _T_197 ? commandDeserializer_io_inputData_9 : _GEN_465; // @[Deserializer.scala 75:21]
  assign _GEN_467 = 5'ha == _T_197 ? commandDeserializer_io_inputData_10 : _GEN_466; // @[Deserializer.scala 75:21]
  assign _GEN_468 = 5'hb == _T_197 ? commandDeserializer_io_inputData_11 : _GEN_467; // @[Deserializer.scala 75:21]
  assign _GEN_469 = 5'hc == _T_197 ? commandDeserializer_io_inputData_12 : _GEN_468; // @[Deserializer.scala 75:21]
  assign _GEN_470 = 5'hd == _T_197 ? commandDeserializer_io_inputData_13 : _GEN_469; // @[Deserializer.scala 75:21]
  assign _GEN_471 = 5'he == _T_197 ? commandDeserializer_io_inputData_14 : _GEN_470; // @[Deserializer.scala 75:21]
  assign _GEN_472 = 5'hf == _T_197 ? commandDeserializer_io_inputData_15 : _GEN_471; // @[Deserializer.scala 75:21]
  assign _GEN_473 = 5'h10 == _T_197 ? commandDeserializer_io_inputData_16 : _GEN_472; // @[Deserializer.scala 75:21]
  assign _GEN_474 = 5'h11 == _T_197 ? commandDeserializer_io_inputData_17 : _GEN_473; // @[Deserializer.scala 75:21]
  assign _GEN_475 = 5'h12 == _T_197 ? commandDeserializer_io_inputData_18 : _GEN_474; // @[Deserializer.scala 75:21]
  assign _GEN_476 = 5'h13 == _T_197 ? commandDeserializer_io_inputData_19 : _GEN_475; // @[Deserializer.scala 75:21]
  assign _GEN_477 = 5'h14 == _T_197 ? commandDeserializer_io_inputData_20 : _GEN_476; // @[Deserializer.scala 75:21]
  assign _GEN_478 = 5'h15 == _T_197 ? commandDeserializer_io_inputData_21 : _GEN_477; // @[Deserializer.scala 75:21]
  assign _GEN_479 = 5'h16 == _T_197 ? commandDeserializer_io_inputData_22 : _GEN_478; // @[Deserializer.scala 75:21]
  assign _GEN_480 = 5'h17 == _T_197 ? commandDeserializer_io_inputData_23 : _GEN_479; // @[Deserializer.scala 75:21]
  assign _T_206 = 24'h14 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_481 = _T_206 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_207 = _GEN_481[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_482 = 5'h1 == _T_207 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_483 = 5'h2 == _T_207 ? commandDeserializer_io_inputData_2 : _GEN_482; // @[Deserializer.scala 75:21]
  assign _GEN_484 = 5'h3 == _T_207 ? commandDeserializer_io_inputData_3 : _GEN_483; // @[Deserializer.scala 75:21]
  assign _GEN_485 = 5'h4 == _T_207 ? commandDeserializer_io_inputData_4 : _GEN_484; // @[Deserializer.scala 75:21]
  assign _GEN_486 = 5'h5 == _T_207 ? commandDeserializer_io_inputData_5 : _GEN_485; // @[Deserializer.scala 75:21]
  assign _GEN_487 = 5'h6 == _T_207 ? commandDeserializer_io_inputData_6 : _GEN_486; // @[Deserializer.scala 75:21]
  assign _GEN_488 = 5'h7 == _T_207 ? commandDeserializer_io_inputData_7 : _GEN_487; // @[Deserializer.scala 75:21]
  assign _GEN_489 = 5'h8 == _T_207 ? commandDeserializer_io_inputData_8 : _GEN_488; // @[Deserializer.scala 75:21]
  assign _GEN_490 = 5'h9 == _T_207 ? commandDeserializer_io_inputData_9 : _GEN_489; // @[Deserializer.scala 75:21]
  assign _GEN_491 = 5'ha == _T_207 ? commandDeserializer_io_inputData_10 : _GEN_490; // @[Deserializer.scala 75:21]
  assign _GEN_492 = 5'hb == _T_207 ? commandDeserializer_io_inputData_11 : _GEN_491; // @[Deserializer.scala 75:21]
  assign _GEN_493 = 5'hc == _T_207 ? commandDeserializer_io_inputData_12 : _GEN_492; // @[Deserializer.scala 75:21]
  assign _GEN_494 = 5'hd == _T_207 ? commandDeserializer_io_inputData_13 : _GEN_493; // @[Deserializer.scala 75:21]
  assign _GEN_495 = 5'he == _T_207 ? commandDeserializer_io_inputData_14 : _GEN_494; // @[Deserializer.scala 75:21]
  assign _GEN_496 = 5'hf == _T_207 ? commandDeserializer_io_inputData_15 : _GEN_495; // @[Deserializer.scala 75:21]
  assign _GEN_497 = 5'h10 == _T_207 ? commandDeserializer_io_inputData_16 : _GEN_496; // @[Deserializer.scala 75:21]
  assign _GEN_498 = 5'h11 == _T_207 ? commandDeserializer_io_inputData_17 : _GEN_497; // @[Deserializer.scala 75:21]
  assign _GEN_499 = 5'h12 == _T_207 ? commandDeserializer_io_inputData_18 : _GEN_498; // @[Deserializer.scala 75:21]
  assign _GEN_500 = 5'h13 == _T_207 ? commandDeserializer_io_inputData_19 : _GEN_499; // @[Deserializer.scala 75:21]
  assign _GEN_501 = 5'h14 == _T_207 ? commandDeserializer_io_inputData_20 : _GEN_500; // @[Deserializer.scala 75:21]
  assign _GEN_502 = 5'h15 == _T_207 ? commandDeserializer_io_inputData_21 : _GEN_501; // @[Deserializer.scala 75:21]
  assign _GEN_503 = 5'h16 == _T_207 ? commandDeserializer_io_inputData_22 : _GEN_502; // @[Deserializer.scala 75:21]
  assign _GEN_504 = 5'h17 == _T_207 ? commandDeserializer_io_inputData_23 : _GEN_503; // @[Deserializer.scala 75:21]
  assign _T_216 = 24'h15 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_505 = _T_216 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_217 = _GEN_505[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_506 = 5'h1 == _T_217 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_507 = 5'h2 == _T_217 ? commandDeserializer_io_inputData_2 : _GEN_506; // @[Deserializer.scala 75:21]
  assign _GEN_508 = 5'h3 == _T_217 ? commandDeserializer_io_inputData_3 : _GEN_507; // @[Deserializer.scala 75:21]
  assign _GEN_509 = 5'h4 == _T_217 ? commandDeserializer_io_inputData_4 : _GEN_508; // @[Deserializer.scala 75:21]
  assign _GEN_510 = 5'h5 == _T_217 ? commandDeserializer_io_inputData_5 : _GEN_509; // @[Deserializer.scala 75:21]
  assign _GEN_511 = 5'h6 == _T_217 ? commandDeserializer_io_inputData_6 : _GEN_510; // @[Deserializer.scala 75:21]
  assign _GEN_512 = 5'h7 == _T_217 ? commandDeserializer_io_inputData_7 : _GEN_511; // @[Deserializer.scala 75:21]
  assign _GEN_513 = 5'h8 == _T_217 ? commandDeserializer_io_inputData_8 : _GEN_512; // @[Deserializer.scala 75:21]
  assign _GEN_514 = 5'h9 == _T_217 ? commandDeserializer_io_inputData_9 : _GEN_513; // @[Deserializer.scala 75:21]
  assign _GEN_515 = 5'ha == _T_217 ? commandDeserializer_io_inputData_10 : _GEN_514; // @[Deserializer.scala 75:21]
  assign _GEN_516 = 5'hb == _T_217 ? commandDeserializer_io_inputData_11 : _GEN_515; // @[Deserializer.scala 75:21]
  assign _GEN_517 = 5'hc == _T_217 ? commandDeserializer_io_inputData_12 : _GEN_516; // @[Deserializer.scala 75:21]
  assign _GEN_518 = 5'hd == _T_217 ? commandDeserializer_io_inputData_13 : _GEN_517; // @[Deserializer.scala 75:21]
  assign _GEN_519 = 5'he == _T_217 ? commandDeserializer_io_inputData_14 : _GEN_518; // @[Deserializer.scala 75:21]
  assign _GEN_520 = 5'hf == _T_217 ? commandDeserializer_io_inputData_15 : _GEN_519; // @[Deserializer.scala 75:21]
  assign _GEN_521 = 5'h10 == _T_217 ? commandDeserializer_io_inputData_16 : _GEN_520; // @[Deserializer.scala 75:21]
  assign _GEN_522 = 5'h11 == _T_217 ? commandDeserializer_io_inputData_17 : _GEN_521; // @[Deserializer.scala 75:21]
  assign _GEN_523 = 5'h12 == _T_217 ? commandDeserializer_io_inputData_18 : _GEN_522; // @[Deserializer.scala 75:21]
  assign _GEN_524 = 5'h13 == _T_217 ? commandDeserializer_io_inputData_19 : _GEN_523; // @[Deserializer.scala 75:21]
  assign _GEN_525 = 5'h14 == _T_217 ? commandDeserializer_io_inputData_20 : _GEN_524; // @[Deserializer.scala 75:21]
  assign _GEN_526 = 5'h15 == _T_217 ? commandDeserializer_io_inputData_21 : _GEN_525; // @[Deserializer.scala 75:21]
  assign _GEN_527 = 5'h16 == _T_217 ? commandDeserializer_io_inputData_22 : _GEN_526; // @[Deserializer.scala 75:21]
  assign _GEN_528 = 5'h17 == _T_217 ? commandDeserializer_io_inputData_23 : _GEN_527; // @[Deserializer.scala 75:21]
  assign _T_226 = 24'h16 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_529 = _T_226 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_227 = _GEN_529[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_530 = 5'h1 == _T_227 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_531 = 5'h2 == _T_227 ? commandDeserializer_io_inputData_2 : _GEN_530; // @[Deserializer.scala 75:21]
  assign _GEN_532 = 5'h3 == _T_227 ? commandDeserializer_io_inputData_3 : _GEN_531; // @[Deserializer.scala 75:21]
  assign _GEN_533 = 5'h4 == _T_227 ? commandDeserializer_io_inputData_4 : _GEN_532; // @[Deserializer.scala 75:21]
  assign _GEN_534 = 5'h5 == _T_227 ? commandDeserializer_io_inputData_5 : _GEN_533; // @[Deserializer.scala 75:21]
  assign _GEN_535 = 5'h6 == _T_227 ? commandDeserializer_io_inputData_6 : _GEN_534; // @[Deserializer.scala 75:21]
  assign _GEN_536 = 5'h7 == _T_227 ? commandDeserializer_io_inputData_7 : _GEN_535; // @[Deserializer.scala 75:21]
  assign _GEN_537 = 5'h8 == _T_227 ? commandDeserializer_io_inputData_8 : _GEN_536; // @[Deserializer.scala 75:21]
  assign _GEN_538 = 5'h9 == _T_227 ? commandDeserializer_io_inputData_9 : _GEN_537; // @[Deserializer.scala 75:21]
  assign _GEN_539 = 5'ha == _T_227 ? commandDeserializer_io_inputData_10 : _GEN_538; // @[Deserializer.scala 75:21]
  assign _GEN_540 = 5'hb == _T_227 ? commandDeserializer_io_inputData_11 : _GEN_539; // @[Deserializer.scala 75:21]
  assign _GEN_541 = 5'hc == _T_227 ? commandDeserializer_io_inputData_12 : _GEN_540; // @[Deserializer.scala 75:21]
  assign _GEN_542 = 5'hd == _T_227 ? commandDeserializer_io_inputData_13 : _GEN_541; // @[Deserializer.scala 75:21]
  assign _GEN_543 = 5'he == _T_227 ? commandDeserializer_io_inputData_14 : _GEN_542; // @[Deserializer.scala 75:21]
  assign _GEN_544 = 5'hf == _T_227 ? commandDeserializer_io_inputData_15 : _GEN_543; // @[Deserializer.scala 75:21]
  assign _GEN_545 = 5'h10 == _T_227 ? commandDeserializer_io_inputData_16 : _GEN_544; // @[Deserializer.scala 75:21]
  assign _GEN_546 = 5'h11 == _T_227 ? commandDeserializer_io_inputData_17 : _GEN_545; // @[Deserializer.scala 75:21]
  assign _GEN_547 = 5'h12 == _T_227 ? commandDeserializer_io_inputData_18 : _GEN_546; // @[Deserializer.scala 75:21]
  assign _GEN_548 = 5'h13 == _T_227 ? commandDeserializer_io_inputData_19 : _GEN_547; // @[Deserializer.scala 75:21]
  assign _GEN_549 = 5'h14 == _T_227 ? commandDeserializer_io_inputData_20 : _GEN_548; // @[Deserializer.scala 75:21]
  assign _GEN_550 = 5'h15 == _T_227 ? commandDeserializer_io_inputData_21 : _GEN_549; // @[Deserializer.scala 75:21]
  assign _GEN_551 = 5'h16 == _T_227 ? commandDeserializer_io_inputData_22 : _GEN_550; // @[Deserializer.scala 75:21]
  assign _GEN_552 = 5'h17 == _T_227 ? commandDeserializer_io_inputData_23 : _GEN_551; // @[Deserializer.scala 75:21]
  assign _T_229 = _GEN_552 ^ 1'h1; // @[Deserializer.scala 75:21]
  assign _T_236 = 24'h17 + commandDeserializer_io_bitsRead; // @[Deserializer.scala 74:72]
  assign _GEN_553 = _T_236 % 24'h18; // @[Deserializer.scala 74:87]
  assign _T_237 = _GEN_553[4:0]; // @[Deserializer.scala 74:87]
  assign _GEN_554 = 5'h1 == _T_237 ? commandDeserializer_io_inputData_1 : _GEN_1; // @[Deserializer.scala 75:21]
  assign _GEN_555 = 5'h2 == _T_237 ? commandDeserializer_io_inputData_2 : _GEN_554; // @[Deserializer.scala 75:21]
  assign _GEN_556 = 5'h3 == _T_237 ? commandDeserializer_io_inputData_3 : _GEN_555; // @[Deserializer.scala 75:21]
  assign _GEN_557 = 5'h4 == _T_237 ? commandDeserializer_io_inputData_4 : _GEN_556; // @[Deserializer.scala 75:21]
  assign _GEN_558 = 5'h5 == _T_237 ? commandDeserializer_io_inputData_5 : _GEN_557; // @[Deserializer.scala 75:21]
  assign _GEN_559 = 5'h6 == _T_237 ? commandDeserializer_io_inputData_6 : _GEN_558; // @[Deserializer.scala 75:21]
  assign _GEN_560 = 5'h7 == _T_237 ? commandDeserializer_io_inputData_7 : _GEN_559; // @[Deserializer.scala 75:21]
  assign _GEN_561 = 5'h8 == _T_237 ? commandDeserializer_io_inputData_8 : _GEN_560; // @[Deserializer.scala 75:21]
  assign _GEN_562 = 5'h9 == _T_237 ? commandDeserializer_io_inputData_9 : _GEN_561; // @[Deserializer.scala 75:21]
  assign _GEN_563 = 5'ha == _T_237 ? commandDeserializer_io_inputData_10 : _GEN_562; // @[Deserializer.scala 75:21]
  assign _GEN_564 = 5'hb == _T_237 ? commandDeserializer_io_inputData_11 : _GEN_563; // @[Deserializer.scala 75:21]
  assign _GEN_565 = 5'hc == _T_237 ? commandDeserializer_io_inputData_12 : _GEN_564; // @[Deserializer.scala 75:21]
  assign _GEN_566 = 5'hd == _T_237 ? commandDeserializer_io_inputData_13 : _GEN_565; // @[Deserializer.scala 75:21]
  assign _GEN_567 = 5'he == _T_237 ? commandDeserializer_io_inputData_14 : _GEN_566; // @[Deserializer.scala 75:21]
  assign _GEN_568 = 5'hf == _T_237 ? commandDeserializer_io_inputData_15 : _GEN_567; // @[Deserializer.scala 75:21]
  assign _GEN_569 = 5'h10 == _T_237 ? commandDeserializer_io_inputData_16 : _GEN_568; // @[Deserializer.scala 75:21]
  assign _GEN_570 = 5'h11 == _T_237 ? commandDeserializer_io_inputData_17 : _GEN_569; // @[Deserializer.scala 75:21]
  assign _GEN_571 = 5'h12 == _T_237 ? commandDeserializer_io_inputData_18 : _GEN_570; // @[Deserializer.scala 75:21]
  assign _GEN_572 = 5'h13 == _T_237 ? commandDeserializer_io_inputData_19 : _GEN_571; // @[Deserializer.scala 75:21]
  assign _GEN_573 = 5'h14 == _T_237 ? commandDeserializer_io_inputData_20 : _GEN_572; // @[Deserializer.scala 75:21]
  assign _GEN_574 = 5'h15 == _T_237 ? commandDeserializer_io_inputData_21 : _GEN_573; // @[Deserializer.scala 75:21]
  assign _GEN_575 = 5'h16 == _T_237 ? commandDeserializer_io_inputData_22 : _GEN_574; // @[Deserializer.scala 75:21]
  assign _GEN_576 = 5'h17 == _T_237 ? commandDeserializer_io_inputData_23 : _GEN_575; // @[Deserializer.scala 75:21]
  assign _T_242 = ~_GEN_24 & ~_T_19; // @[Deserializer.scala 76:26]
  assign _T_243 = _T_242 & ~_GEN_72; // @[Deserializer.scala 76:26]
  assign _T_244 = _T_243 & ~_GEN_96; // @[Deserializer.scala 76:26]
  assign _T_245 = _T_244 & ~_GEN_120; // @[Deserializer.scala 76:26]
  assign _T_246 = _T_245 & ~_GEN_144; // @[Deserializer.scala 76:26]
  assign _T_247 = _T_246 & ~_GEN_168; // @[Deserializer.scala 76:26]
  assign _T_248 = _T_247 & ~_GEN_192; // @[Deserializer.scala 76:26]
  assign _T_249 = _T_248 & ~_GEN_216; // @[Deserializer.scala 76:26]
  assign _T_250 = _T_249 & ~_GEN_240; // @[Deserializer.scala 76:26]
  assign _T_251 = _T_250 & ~_GEN_264; // @[Deserializer.scala 76:26]
  assign _T_252 = _T_251 & ~_GEN_288; // @[Deserializer.scala 76:26]
  assign _T_253 = _T_252 & ~_GEN_312; // @[Deserializer.scala 76:26]
  assign _T_254 = _T_253 & ~_GEN_336; // @[Deserializer.scala 76:26]
  assign _T_255 = _T_254 & ~_T_149; // @[Deserializer.scala 76:26]
  assign _T_256 = _T_255 & ~_T_159; // @[Deserializer.scala 76:26]
  assign _T_257 = _T_256 & ~_GEN_408; // @[Deserializer.scala 76:26]
  assign _T_258 = _T_257 & ~_GEN_432; // @[Deserializer.scala 76:26]
  assign _T_259 = _T_258 & ~_GEN_456; // @[Deserializer.scala 76:26]
  assign _T_260 = _T_259 & ~_GEN_480; // @[Deserializer.scala 76:26]
  assign _T_261 = _T_260 & ~_GEN_504; // @[Deserializer.scala 76:26]
  assign _T_262 = _T_261 & ~_GEN_528; // @[Deserializer.scala 76:26]
  assign _T_263 = _T_262 & ~_T_229; // @[Deserializer.scala 76:26]
  assign _T_264 = _T_263 & ~_GEN_576; // @[Deserializer.scala 76:26]
  assign io_outJoystickXNotConvSt = 1'h0; // @[Bgec.scala 65:28]
  assign io_outJoystickXNotChipSel = joystickXADC_io_notChipSel; // @[Bgec.scala 67:29]
  assign io_outJoystickXNotRead = joystickXADC_io_notRead; // @[Bgec.scala 68:26]
  assign io_outJoystickYNotConvSt = 1'h0; // @[Bgec.scala 72:28]
  assign io_outJoystickYNotChipSel = joystickYADC_io_notChipSel; // @[Bgec.scala 74:29]
  assign io_outJoystickYNotRead = joystickYADC_io_notRead; // @[Bgec.scala 75:26]
  assign io_outCStickXNotConvSt = 1'h0; // @[Bgec.scala 79:26]
  assign io_outCStickXNotChipSel = cStickXADC_io_notChipSel; // @[Bgec.scala 81:27]
  assign io_outCStickXNotRead = cStickXADC_io_notRead; // @[Bgec.scala 82:24]
  assign io_outCStickYNotConvSt = 1'h0; // @[Bgec.scala 86:26]
  assign io_outCStickYNotChipSel = cStickYADC_io_notChipSel; // @[Bgec.scala 88:27]
  assign io_outCStickYNotRead = cStickYADC_io_notRead; // @[Bgec.scala 89:24]
  assign io_outTriggerLNotConvSt = 1'h0; // @[Bgec.scala 93:27]
  assign io_outTriggerLNotChipSel = triggerLADC_io_notChipSel; // @[Bgec.scala 95:28]
  assign io_outTriggerLNotRead = triggerLADC_io_notRead; // @[Bgec.scala 96:25]
  assign io_outTriggerRNotConvSt = 1'h0; // @[Bgec.scala 100:27]
  assign io_outTriggerRNotChipSel = triggerRADC_io_notChipSel; // @[Bgec.scala 102:28]
  assign io_outTriggerRNotRead = triggerRADC_io_notRead; // @[Bgec.scala 103:25]
  assign controller_io_inButtonStart = io_inButtonStart; // @[Bgec.scala 113:31]
  assign controller_io_inButtonY = io_inButtonY; // @[Bgec.scala 109:27]
  assign controller_io_inButtonX = io_inButtonX; // @[Bgec.scala 108:27]
  assign controller_io_inButtonB = io_inButtonB; // @[Bgec.scala 107:27]
  assign controller_io_inButtonA = io_inButtonA; // @[Bgec.scala 106:27]
  assign controller_io_inButtonL = io_inButtonL; // @[Bgec.scala 110:27]
  assign controller_io_inButtonR = io_inButtonR; // @[Bgec.scala 111:27]
  assign controller_io_inButtonZ = io_inButtonZ; // @[Bgec.scala 112:27]
  assign controller_io_inDpadUp = io_inDpadUp; // @[Bgec.scala 115:26]
  assign controller_io_inDpadDown = io_inDpadDown; // @[Bgec.scala 114:28]
  assign controller_io_inDpadRight = io_inDpadRight; // @[Bgec.scala 117:29]
  assign controller_io_inDpadLeft = io_inDpadLeft; // @[Bgec.scala 116:28]
  assign controller_io_inJoystickX = joystickXADC_io_outData; // @[Bgec.scala 118:29]
  assign controller_io_inJoystickY = joystickYADC_io_outData; // @[Bgec.scala 119:29]
  assign controller_io_inCstickX = cStickXADC_io_outData; // @[Bgec.scala 120:27]
  assign controller_io_inCstickY = cStickYADC_io_outData; // @[Bgec.scala 121:27]
  assign controller_io_inTriggerL = triggerLADC_io_outData; // @[Bgec.scala 122:28]
  assign controller_io_inTriggerR = triggerRADC_io_outData; // @[Bgec.scala 123:28]
  assign joystickXADC_clock = clock;
  assign joystickXADC_reset = reset;
  assign joystickXADC_io_notEndOfConv = io_inJoystickXNotEndOfConv; // @[Bgec.scala 66:32]
  assign joystickXADC_io_dataBus = io_inJoystickXData; // @[Bgec.scala 69:27]
  assign joystickYADC_clock = clock;
  assign joystickYADC_reset = reset;
  assign joystickYADC_io_notEndOfConv = io_inJoystickYNotEndOfConv; // @[Bgec.scala 73:32]
  assign joystickYADC_io_dataBus = io_inJoystickYData; // @[Bgec.scala 76:27]
  assign cStickXADC_clock = clock;
  assign cStickXADC_reset = reset;
  assign cStickXADC_io_notEndOfConv = io_inCStickXNotEndOfConv; // @[Bgec.scala 80:30]
  assign cStickXADC_io_dataBus = io_inCStickXData; // @[Bgec.scala 83:25]
  assign cStickYADC_clock = clock;
  assign cStickYADC_reset = reset;
  assign cStickYADC_io_notEndOfConv = io_inCStickYNotEndOfConv; // @[Bgec.scala 87:30]
  assign cStickYADC_io_dataBus = io_inCStickYData; // @[Bgec.scala 90:25]
  assign triggerLADC_clock = clock;
  assign triggerLADC_reset = reset;
  assign triggerLADC_io_notEndOfConv = io_inTriggerLNotEndOfConv; // @[Bgec.scala 94:31]
  assign triggerLADC_io_dataBus = io_inTriggerLData; // @[Bgec.scala 97:26]
  assign triggerRADC_clock = clock;
  assign triggerRADC_reset = reset;
  assign triggerRADC_io_notEndOfConv = io_inTriggerRNotEndOfConv; // @[Bgec.scala 101:31]
  assign triggerRADC_io_dataBus = io_inTriggerRData; // @[Bgec.scala 104:26]
  assign dataLine_write = controllerDataSerializer_io_write; // @[Bgec.scala 131:21]
  assign dataLine_writeData = controllerDataSerializer_io_writeData; // @[Bgec.scala 132:25]
  assign controllerDataSerializer_clock = clock;
  assign controllerDataSerializer_reset = reset;
  assign controllerDataSerializer_io_startSerialization = _T_264 & ~toldToSerialize; // @[Bgec.scala 152:52 Bgec.scala 155:52]
  assign controllerDataSerializer_io_outputData = controller_io_outData; // @[Bgec.scala 129:42]
  assign commandDeserializer_clock = clock;
  assign commandDeserializer_reset = reset;
  assign commandDeserializer_io_startDeserialization = reset; // @[Bgec.scala 139:49 Bgec.scala 141:49]
  assign commandDeserializer_io_pauseDeserialization = controllerDataSerializer_io_write; // @[Bgec.scala 158:47]
  assign commandDeserializer_io_readData = dataLine_readData; // @[Bgec.scala 136:35]
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
  toldToSerialize = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      toldToSerialize <= 1'h0;
    end else begin
      toldToSerialize <= _T_264;
    end
  end
endmodule
