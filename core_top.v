module core_top #(
    parameter MEMORY_FILE = ""
)(
    input  wire        clk,
    input  wire        rst_n
);

// insira seu código aqui
wire rd_en;
wire wr_en;

wire [31:0] addr;
wire [31:0] data_i;
wire [31:0] data_o;

Memory #(
    .MEMORY_FILE(MEMORY_FILE),
    .MEMORY_SIZE()
) mem (
    .clk(clk),
    .rd_en_i(rd_en),
    .wr_en_i(wr_en),
    .addr_i(addr),
    .data_i(data_o),
    .data_o(data_i),
    .ack_o()
);

Core #(
    .BOOT_ADDRESS()
) core (
    .clk(clk),
    .rst_n(rst_n),
    .rd_en_o(rd_en),
    .wr_en_i(wr_en),
    .data_i(data_i),
    .addr_o(addr),
    .data_o(data_o)
);

endmodule