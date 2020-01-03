module DataLine(
    input clock,
    inout line,
    input write,
    input writeData,
    output readData
);

    always @(posedge clock) begin
        if (write) begin
            line <= writeData;
        end else begin
            line <= 1'h1;
            writeData <= 1'h0;
        end
        readData <= line;
    end

endmodule: DataLine
