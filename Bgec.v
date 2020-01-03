module Serializer(
  input   clock,
  inout   io_data
);
  wire  dataLine_clock; // @[Serializer.scala 18:24]
  wire  dataLine_write; // @[Serializer.scala 18:24]
  wire  dataLine_writeData; // @[Serializer.scala 18:24]
  wire  dataLine_readData; // @[Serializer.scala 18:24]
  DataLine dataLine ( // @[Serializer.scala 18:24]
    .clock(dataLine_clock),
    .line(io_data),
    .write(dataLine_write),
    .writeData(dataLine_writeData),
    .readData(dataLine_readData)
  );
  assign dataLine_clock = clock; // @[Serializer.scala 20:21]
  assign dataLine_write = 1'h0; // @[Serializer.scala 34:23 Serializer.scala 53:23]
  assign dataLine_writeData = 1'h0; // @[Serializer.scala 36:29 Serializer.scala 38:29 Serializer.scala 40:29]
endmodule
module Deserializer(
  input   clock,
  inout   io_data
);
  wire  dataLine_clock; // @[Deserializer.scala 18:24]
  wire  dataLine_write; // @[Deserializer.scala 18:24]
  wire  dataLine_writeData; // @[Deserializer.scala 18:24]
  wire  dataLine_readData; // @[Deserializer.scala 18:24]
  DataLine dataLine ( // @[Deserializer.scala 18:24]
    .clock(dataLine_clock),
    .line(io_data),
    .write(dataLine_write),
    .writeData(dataLine_writeData),
    .readData(dataLine_readData)
  );
  assign dataLine_clock = clock; // @[Deserializer.scala 20:21]
  assign dataLine_write = 1'h0;
  assign dataLine_writeData = 1'h0;
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
  wire  controllerDataSerializer_clock; // @[Bgec.scala 93:40]
  wire  commandDeserializer_clock; // @[Bgec.scala 98:35]
  wire  commandDeserializer_io_data; // @[Bgec.scala 98:35]
  reg  clockParity; // @[Bgec.scala 35:28]
  reg [31:0] _RAND_0;
  reg  adcReady; // @[Bgec.scala 36:25]
  reg [31:0] _RAND_1;
  reg [6:0] adcTiming; // @[Bgec.scala 37:26]
  reg [31:0] _RAND_2;
  reg [2:0] adcBitIndex; // @[Bgec.scala 38:24]
  reg [31:0] _RAND_3;
  wire [2:0] _T_1; // @[Bgec.scala 55:34]
  wire  _T_2; // @[Bgec.scala 56:24]
  wire  _T_3; // @[Bgec.scala 60:20]
  wire  _T_4; // @[Bgec.scala 64:32]
  wire [6:0] _T_6; // @[Bgec.scala 66:28]
  wire  _T_7; // @[Bgec.scala 67:20]
  wire  _GEN_99; // @[Bgec.scala 67:29]
  Serializer controllerDataSerializer ( // @[Bgec.scala 93:40]
    .clock(controllerDataSerializer_clock),
    .io_data(io_data)
  );
  Deserializer commandDeserializer ( // @[Bgec.scala 98:35]
    .clock(commandDeserializer_clock),
    .io_data(commandDeserializer_io_data)
  );
  assign _T_1 = adcBitIndex + 3'h1; // @[Bgec.scala 55:34]
  assign _T_2 = adcBitIndex == 3'h0; // @[Bgec.scala 56:24]
  assign _T_3 = clockParity == 1'h0; // @[Bgec.scala 60:20]
  assign _T_4 = adcTiming < 7'h7; // @[Bgec.scala 64:32]
  assign _T_6 = adcTiming + 7'h1; // @[Bgec.scala 66:28]
  assign _T_7 = adcTiming == 7'h0; // @[Bgec.scala 67:20]
  assign _GEN_99 = _T_7 | adcReady; // @[Bgec.scala 67:29]
  assign io_adcClock = adcReady & clockParity; // @[Bgec.scala 62:17 Bgec.scala 65:17]
  assign io_adcConvert = adcReady ? 1'h0 : _T_4; // @[Bgec.scala 61:19 Bgec.scala 64:19]
  assign controllerDataSerializer_clock = clock;
  assign commandDeserializer_clock = clock;
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
  end
endmodule
