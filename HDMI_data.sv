import HDMI_info::*;
logic pixel_clk; // Read clock
logic [ADDR_BITS 1] read_addr; // Read address
logic [PIXEL_BITS1:0] read_data; // Read data

HDMI_data hdmi_data (
  // You use this to write to memory – Data to be displayed
  .clka (clkx), // Can be different clock than 100MHz clock
  .ena (1'b1),
  .wea (write_enable),
  .addra (write_addr),
  .dina (write_data),
  // Connects to my code – To output to computer display
  .clkb (pixel_clk), // Must use pixel_clock from to_display
  .addrb (read_addr),
  .doutb (read_data)
);

HDMout to_display ( // My block – You are instantiating it here
  .clk (clk), // Must be 100MHz clock
  .pixel_clk (pixel_clk), // OUTPUT from HDMout. Input to hdmi_data.
  .read_addr (read_addr),
  .read_data (read_data)
);
