module DataLine(
    inout line,
    input write,
    input writeData,
    output readData
);

    assign line = write ? writeData : 'z;
    assign readData = write ? 'z : line;

endmodule: DataLine
