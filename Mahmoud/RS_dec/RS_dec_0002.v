// RS_dec_0002.v

// This file was auto-generated from altera_rs_ii_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module RS_dec_0002 #(
		parameter CHANNEL          = 1,
		parameter BITSPERSYMBOL    = 8,
		parameter N                = 255,
		parameter CHECK            = 32,
		parameter IRRPOL           = 285,
		parameter GENSTART         = 4,
		parameter ROOTSPACE        = 1,
		parameter ERASURE          = 0,
		parameter ERRORSYMB        = 0,
		parameter ERRORSYMBCOUNT   = 0,
		parameter ERRORBITCOUNT    = 0,
		parameter BITCOUNTTYPE     = "Full",
		parameter VARN             = 0,
		parameter USENUMN          = 0,
		parameter OPTIMIZE_LATENCY = 0,
		parameter USEROM           = 0,
		parameter BMFIXEDLATENCY   = 1,
		parameter MIN_N            = 3,
		parameter VARCHECK         = 0,
		parameter MINCHECK         = 2,
		parameter USEDUALBASIS     = 0
	) (
		input  wire       clk_clk,           //   clk.clk
		input  wire       reset_reset_n,     // reset.reset_n
		input  wire       in_startofpacket,  //    in.startofpacket
		input  wire       in_endofpacket,    //      .endofpacket
		input  wire       in_valid,          //      .valid
		output wire       in_ready,          //      .ready
		input  wire [7:0] in_data,           //      .data
		output wire       out_startofpacket, //   out.startofpacket
		output wire       out_endofpacket,   //      .endofpacket
		output wire       out_error,         //      .error
		output wire       out_valid,         //      .valid
		input  wire       out_ready,         //      .ready
		output wire [7:0] out_data           //      .data
	);

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (CHANNEL != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					channel_check ( .error(1'b1) );
		end
		if (BITSPERSYMBOL != 8)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bitspersymbol_check ( .error(1'b1) );
		end
		if (N != 255)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					n_check ( .error(1'b1) );
		end
		if (CHECK != 32)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					check_check ( .error(1'b1) );
		end
		if (IRRPOL != 285)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					irrpol_check ( .error(1'b1) );
		end
		if (GENSTART != 4)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					genstart_check ( .error(1'b1) );
		end
		if (ROOTSPACE != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					rootspace_check ( .error(1'b1) );
		end
		if (ERASURE != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					erasure_check ( .error(1'b1) );
		end
		if (ERRORSYMB != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					errorsymb_check ( .error(1'b1) );
		end
		if (ERRORSYMBCOUNT != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					errorsymbcount_check ( .error(1'b1) );
		end
		if (ERRORBITCOUNT != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					errorbitcount_check ( .error(1'b1) );
		end
		if (BITCOUNTTYPE != "Full")
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bitcounttype_check ( .error(1'b1) );
		end
		if (VARN != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					varn_check ( .error(1'b1) );
		end
		if (USENUMN != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					usenumn_check ( .error(1'b1) );
		end
		if (OPTIMIZE_LATENCY != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					optimize_latency_check ( .error(1'b1) );
		end
		if (USEROM != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					userom_check ( .error(1'b1) );
		end
		if (BMFIXEDLATENCY != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bmfixedlatency_check ( .error(1'b1) );
		end
		if (MIN_N != 3)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					min_n_check ( .error(1'b1) );
		end
		if (VARCHECK != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					varcheck_check ( .error(1'b1) );
		end
		if (MINCHECK != 2)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					mincheck_check ( .error(1'b1) );
		end
		if (USEDUALBASIS != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					usedualbasis_check ( .error(1'b1) );
		end
	endgenerate

	RS_dec_rs_decoder #(
		.ERASURE          (0),
		.CHANNEL          (1),
		.BITSPERSYMBOL    (8),
		.CHECK            (32),
		.IRRPOL           (285),
		.N                (255),
		.GENSTART         (4),
		.ROOTSPACE        (1),
		.VARCHECK         (0),
		.VARN             (0),
		.OPTIMIZE_LATENCY (0),
		.MIN_N            (3),
		.USEROM           (0),
		.BMFIXEDLATENCY   (1),
		.USENUMN          (0),
		.USEDUALBASIS     (0),
		.ERRORSYMB        (0),
		.ERRORSYMBCOUNT   (0),
		.ERRORBITCOUNT    (0),
		.BITCOUNTTYPE     ("Full")
	) rs_decoder (
		.clk_clk           (clk_clk),           // clk.clk
		.rst_reset_n       (reset_reset_n),     // rst.reset_n
		.in_startofpacket  (in_startofpacket),  //  in.startofpacket
		.in_endofpacket    (in_endofpacket),    //    .endofpacket
		.in_valid          (in_valid),          //    .valid
		.in_ready          (in_ready),          //    .ready
		.in_data           (in_data),           //    .data
		.out_startofpacket (out_startofpacket), // out.startofpacket
		.out_endofpacket   (out_endofpacket),   //    .endofpacket
		.out_error         (out_error),         //    .error
		.out_valid         (out_valid),         //    .valid
		.out_ready         (out_ready),         //    .ready
		.out_data          (out_data)           //    .data
	);

endmodule
