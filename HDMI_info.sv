package HDMI_info;
  parameter int COLS = 48; // Set your # of samples/row
  parameter int ROWS = 48; // Set your # of rows
  parameter bit COLOR = 1; // 0 = grayscale, 1 = RGB
  parameter bit EXPAND = 0; // 0 = upper_left, 1 = Full screen
  localparam int DEPTH = ROWS * COLS; //
  localparam int PIXEL_BITS = COLOR ? 24 : 8; // Pixel bits
  localparam int ADDR_BITS = $clog2(DEPTH);
endpackage


/* Import Details from Writeup
module YourModule (input xxx, output xxx);
  import HDMI_info::*;
  // The rest of your module
endmodule
/*
