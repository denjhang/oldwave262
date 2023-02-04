;Processing Function Address Files finished!
          GOTO l0x80
          NOP 
_ivt_800120:
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
l0x80:
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
          MOV 0x24, W0
_reset?:
          LNK #0x0
          MOV #0xADE, W15
          MOV #0x27F0, W0
          MOV W0, SPLIM
          NOP 
          RCALL _main
          ULNK 
          RETURN 
_main:
          LNK #0x0
          CLR W0
          MOV W0, CLKDIV
          RCALL compute_CRC16_table_0x1021
          RCALL setup_SPI1
_loop:
          RCALL read_command_enable_sdo
          RCALL process_command
          BRA _loop
_default_isr:
          PUSH PSVPAG
          MOV W8, [W15++]
          MOV #0x0, W8
          MOV W8, PSVPAG
          MOV [--W15], W8
          LNK #0x0
          RESET 
          ULNK 
          POP PSVPAG
          RETFIE 
process_command:
          LNK #0x4
          MOV 0xA0C, W0
          LSR W0, #12, W0
          ZE W0, W0
          MUL.SU W0, #1, W2
          MOV.D W2, [W14]
          MOV #0xE, W0
          MOV #0x0, W1
          MOV.D [W14], W2
          SUB W2, W0, [W15]
          SUBB W3, W1, [W15]
          BRA GTU,case368_RSV_NACK_OPCODE_3
          MOV.D [W14], W0
          BRA W0
          BRA case012_CMD012_OPCODE_1
          BRA case012_CMD012_OPCODE_1
          BRA case012_CMD012_OPCODE_1
          BRA case368_RSV_NACK_OPCODE_3
          BRA case4_PROG_DEV_ID
          BRA case5_PROG_1ROW
          BRA case368_RSV_NACK_OPCODE_3
          BRA case7_ERASE_ALL
          BRA case368_RSV_NACK_OPCODE_3
          BRA case9_ERASE_PG_CODE
          BRA caseA_QBLANK
          BRA caseB_QVER
          BRA caseC_CRC_CHECK_OPCODE_1
          BRA caseD_PROG_1INST_VRF
          BRA caseE_QBLANK_PAGE?
case012_CMD012_OPCODE_1:
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
          BRA l0x1B4
case4_PROG_DEV_ID:
          RCALL WR_CONFIG_BYTE_PE_0x4000
          BRA l0x1B4
caseD_PROG_1INST_VRF:
          RCALL WR_SINGLE_INSTRUCTION
          BRA l0x1B4
case5_PROG_1ROW:
          RCALL WR_1ROW_INSTRUCTION
          BRA l0x1B4
case7_ERASE_ALL:
          RCALL ERASE_ALL
          BRA l0x1B4
case9_ERASE_PG_CODE:
          RCALL ERASE_PG_CODE
          BRA l0x1B4
caseA_QBLANK:
          RCALL QBLANK
          BRA l0x1B4
caseE_QBLANK_PAGE?:
          RCALL QBLANK_PAGE
          BRA l0x1B4
caseB_QVER:
          RCALL QVER_1B.MN.00.02
          BRA l0x1B4
caseC_CRC_CHECK_OPCODE_1:
          RCALL crc_check
          MOV W0, 0xAD8
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
          BRA l0x1B4
case368_RSV_NACK_OPCODE_3:
          BSET 0xAD3, #4
          BSET 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
l0x1B4:
          ULNK 
          RETURN 
format_response_and_reply:
          LNK #0x0
          MOV 0xAD2, W1
          MOV #0xF000, W0
          AND W1, W0, W1
          MOV #0x1000, W0
          SUB W1, W0, [W15]
          BRA Z,l0x1D2
          MOV 0xAD2, W1
          MOV #0xF000, W0
          AND W1, W0, W1
          MOV #0x3000, W0
          SUB W1, W0, [W15]
          BRA NZ,l0x1D8
l0x1D2:
          CLR.B W0
          MOV.B WREG, 0xAD2
          BRA l0x1DC
l0x1D8:
          MOV #0x1, W0
          MOV.B WREG, 0xAD2
l0x1DC:
          MOV 0xA0C, W0
          LSR W0, #12, W0
          ZE W0, W0
          AND W0, #0xF, W0
          SL W0, #8, W2
          MOV 0xAD2, W1
          MOV #0xF0FF, W0
          AND W1, W0, W0
          IOR W0, W2, W0
          MOV W0, 0xAD2
          MOV 0xAD2, W1
          MOV #0xF00, W0
          AND W1, W0, W1
          MOV #0x100, W0
          SUB W1, W0, [W15]
          BRA NZ,set_readp_head
set_readc_head:
          MOV.B 0xA0F, WREG
          ZE W0, W0
          INC2 W0, W0
          MOV W0, 0xAD4
          BRA l0x246
set_readp_head:
          MOV 0xAD2, W1
          MOV #0xF00, W0
          AND W1, W0, W1
          MOV #0x200, W0
          SUB W1, W0, [W15]
          BRA NZ,check_if_is_crc_check
          MOV 0xA0E, W0
          LSR W0, W0
          MUL.SU W0, #3, W0
          INC2 W0, W0
          MOV W0, 0xAD4
          MOV 0xA0E, W0
          AND W0, #0x1, W0
          CP0.B W0
          BRA Z,l0x246
          MOV 0xAD4, W0
set_readp_head2:
          INC2 W0, W0
          MOV W0, 0xAD4
          BRA l0x246
check_if_is_crc_check:
          MOV 0xAD2, W1
          MOV #0xF00, W0
          AND W1, W0, W1
          MOV #0xC00, W0
          SUB W1, W0, [W15]
          BRA NZ,l0x242
set_crc_check_head:
          MOV #0x3, W0
          MOV W0, 0xAD4
          MOV 0xAD8, W0
          MOV W0, 0xAD6
          BRA l0x246
l0x242:
          MOV #0x2, W0
          MOV W0, 0xAD4
l0x246:
          RCALL pe_response
          ULNK 
          RETURN 
ERASE_ALL:
          LNK #0x0
          MOV #0x404F, W0
          MOV W0, NVMCON
          BSET 0x761, #6
          MOV #0x55, W7
          MOV W7, NVMKEY
          MOV #0xAA, W7
          MOV W7, NVMKEY
          BSET 0x761, #7
          NOP 
          NOP 
l0x262:
          MOV.B 0x761, WREG
          MOV #0x80, W1
          AND.B W0, W1, W0
          CP0.B W0
          BRA NZ,l0x262
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
          ULNK 
          RETURN 
ERASE_PG_CODE:
          LNK #0x6
          MOV #0x4042, W0
          MOV W0, NVMCON
          MOV.B 0xA0E, WREG
          ZE W0, W0
          MOV #0x0, W1
          SL W0, #0, W3
          MOV #0x0, W2
          MOV 0xA10, W0
          MOV #0x0, W1
          ADD W2, W0, [W14++]
          ADDC W3, W1, [W14--]
          CLR W0
          MOV W0, [W14+4]
          BRA l0x2C0
l0x298:
          BSET 0x761, #6
          MOV #0x55, W7
          MOV W7, NVMKEY
          MOV #0xAA, W7
          MOV W7, NVMKEY
          BSET 0x761, #7
          NOP 
          NOP 
l0x2A8:
          MOV.B 0x761, WREG
          MOV #0x80, W1
          AND.B W0, W1, W0
          CP0.B W0
          BRA NZ,l0x2A8
          MOV #0x40, W0
          MOV #0x0, W1
          ADD W0, [W14], [W14]
          ADDC W1, [++W14], [W14--]
          MOV [W14+4], W0
          INC W0, W0
          MOV W0, [W14+4]
l0x2C0:
          MOV.B 0xA0F, WREG
          ZE W0, W1
          MOV [W14+4], W0
          SUB W1, W0, [W15]
          BRA GTU,l0x298
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
          ULNK 
          RETURN 
WR_CONFIG_BYTE_PE_0x4000:
          LNK #0x4
          MOV.B 0xA0E, WREG
          ZE W0, W0
          MOV W0, TBLPAG
          MOV #0x4000, W0
          MOV W0, NVMCON
          MOV 0xA12, W0
          MOV W0, [W14+2]
          MOV 0xA10, W0
          MOV W0, [W14]
          MOV [W14+2], W1
          MOV [W14], W0
          TBLWTL W1, [W0]
          BSET 0x761, #6
          MOV #0x55, W0
          MOV W0, NVMKEY
          MOV #0xAA, W0
          MOV W0, NVMKEY
          BSET 0x761, #7
          NOP 
          NOP 
          MOV W0, [W14+2]
l0x304:
          MOV.B 0x761, WREG
          MOV #0x80, W1
          AND.B W0, W1, W0
          CP0.B W0
          BRA NZ,l0x304
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          RCALL format_response_and_reply
          ULNK 
          RETURN 
WR_SINGLE_INSTRUCTION:
          LNK #0x4
          MOV.B 0xA0E, WREG
          ZE W0, W0
          MOV W0, TBLPAG
          MOV #0x4003, W0
          MOV W0, NVMCON
          MOV 0xA12, W0
          MOV W0, [W14+2]
          MOV 0xA10, W0
          MOV W0, [W14]
          MOV [W14+2], W1
          MOV [W14], W0
          TBLWTL W1, [W0]
          MOV.B 0xA0F, WREG
          ZE W0, W0
          MOV W0, [W14+2]
          MOV [W14+2], W1
          MOV [W14], W0
          TBLWTH.B W1, [W0]
          BSET 0x761, #6
          MOV #0x55, W0
          MOV W0, NVMKEY
          MOV #0xAA, W0
          MOV W0, NVMKEY
          BSET 0x761, #7
          NOP 
          NOP 
          MOV W0, [W14+2]
l0x354:
          MOV.B 0x761, WREG
          MOV #0x80, W1
          AND.B W0, W1, W0
          CP0.B W0
          BRA NZ,l0x354
          MOV [W14], W0
          TBLRDL [W0], W0
          MOV W0, [W14+2]
          BCLR 0xAD3, #4
          BSET 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
          MOV 0xA12, W1
          MOV [W14+2], W0
          SUB W1, W0, [W15]
          BRA NZ,l0x38C
          MOV [W14], W0
          TBLRDH.B [W0], W0
          MOV W0, [W14+2]
          MOV [W14+2], W0
          MOV.B W0, W1
          MOV.B 0xA0F, WREG
          SUB.B W1, W0, [W15]
          BRA NZ,l0x38C
          BSET 0xAD3, #4
          BCLR 0xAD3, #5
          BCLR 0xAD3, #6
          BCLR 0xAD3, #7
l0x38C:
          RCALL format_response_and_reply
          ULNK 
          RETURN 
WR_1ROW_INSTRUCTION:
          MOV #0x4001, W0
          MOV W0, NVMCON
          MOV #0xA0C, W5
          CLR W0
          MOV.B [W5+2], W8
          MOV [W5+4], W9
          ADD W5, #0x6, W6
          MOV W8, TBLPAG
          MOV W9, W7
          MOV #0x10, W0
l0x3A6:
          TBLWTL [W6++], [W7]
          TBLWTH.B [W6++], [W7++]
          TBLWTH.B [W6++], [++W7]
          TBLWTL [W6++], [W7++]
          TBLWTL [W6++], [W7]
          TBLWTH.B [W6++], [W7++]
          TBLWTH.B [W6++], [++W7]
          TBLWTL [W6++], [W7++]
          DEC W0, W0
          BRA NZ,l0x3A6
          REPEAT #0x5
          MOV [--W6], [W6]
          MOV #0x8, W0
          SUB W7, W0, W7
          TBLWTL [W6++], [W7]
          BSET 0x761, #6
          MOV #0x55, W7
          MOV W7, NVMKEY
          MOV #0xAA, W7
          MOV W7, NVMKEY
          BSET 0x761, #7
          NOP 
          NOP 
l0x3D4:
          MOV NVMCON, W0
          BTST.C W0, #15
          BRA C,l0x3D4
          RCALL VERIFY_1ROW_INS
          SL W0, #12, W0
          MOV #0xAD2, W1
          MOV W0, [W1]
          RCALL format_response_and_reply
          RETURN 
VERIFY_1ROW_INS:
          MOV #0xA0C, W0
          CLR W1
          MOV.B [W0+2], W8
          MOV [W0+4], W9
          MOV #0xC, W7
          ADD W0, #0x6, W3
          MOV W8, TBLPAG
          MOV W9, W5
          MOV #0x1F, W4
l0x3F8:
          TBLRDL [W5], W6
          CP W6, [W3++]
          BRA NZ,l0x414
          TBLRDH.B [W5++], [W7++]
          TBLRDH.B [++W5], [W7--]
          CP W6, [W3++]
          BRA NZ,l0x414
          TBLRDL [W5++], W6
          CP W6, [W3++]
          BRA NZ,l0x414
          DEC W4, W4
          BRA NN,l0x3F8
          MOV #0x1, W0
          BRA l0x416
l0x414:
          MOV #0x2, W0
l0x416:
          RETURN 
QBLANK:
          CLR TBLPAG
          MOV #0xFFFE, W7
          BRA l0x428
QBLANK_PAGE:
          MOV #0xA0C, W0
          MOV [W0+6], W3
          MOV W3, TBLPAG
          MOV [W0+8], W3
          SUB W3, #0x2, W7
l0x428:
          SETM W4
          MOV #0xFFFE, W6
          MOV #0xA0C, W0
          MOV [W0+2], W3
          MOV [W0+4], W2
l0x432:
          SUB #0x1, W2
          SUBB #0x0, W3
          BRA Z,l0x454
          TBLRDL [++W7], W0
          CPSEQ W0, W4
          BRA l0x450
          TBLRDH.B [W7], W0
          CPSEQ.B W0, W4
          BRA l0x450
          CP W6, W7
          BRA NZ,l0x432
          MOV TBLPAG, W0
          INC W0, W0
          MOV W0, TBLPAG
          BRA l0x432
l0x450:
          MOV #0xF, W1
          BRA l0x456
l0x454:
          MOV #0xF0, W1
l0x456:
          MOV #0x1A00, W0
          IOR W0, W1, W0
          MOV #0xAD2, W3
          MOV W0, [W3++]
          MOV #0x2, W0
          MOV W0, [W3]
          RCALL pe_response
          RETURN 
QVER_1B.MN.00.02:
          MOV #0x33, W1
          MOV #0x1B00, W0
          IOR W0, W1, W0
          MOV #0xAD2, W1
          MOV W0, [W1++]
          MOV #0x2, W0
          MOV W0, [W1]
          RCALL pe_response
          RETURN 
read_command_enable_sdo:
          RCALL chk_SPI1IF_read_SPI1BUF
          MOV #0xA0C, W7
          MOV W0, [W7++]
          MOV #0xFFF, W3
          AND W0, W3, W3
          DEC W3, W3
          BRA Z,dis_SPI_en_SDO_en_SPI
read_command_data:
          RCALL chk_SPI1IF_read_SPI1BUF
          MOV W0, [W7++]
          DEC W3, W3
          BRA NZ,read_command_data
dis_SPI_en_SDO_en_SPI:
          BCLR 0x241, #7
          MOV #0x500, W0
          MOV W0, SPI1CON1
          SETM SPI1BUF
          BSET 0x241, #7
          SETM SPI1BUF
          RETURN 
pe_response:
          CLR SPI1BUF
          CLR SPI1STAT
          NOP 
          BSET 0x241, #7
          CLR SPI1BUF
          NOP 
          CLR SPI1STAT
          REPEAT #0x1D
          NOP 
          MOV #0x400, W0
          MOV W0, SPI1CON1
          BCLR 0x85, #2
          BSET 0x241, #7
          MOV #0xAD2, W7
          MOV [W7++], W0
          MOV W0, SPI1BUF
          MOV [W7++], W0
          RCALL wait_rd_SPI_wr_SPI
          MOV #0xAD2, W0
          MOV [W0+2], W5
          DEC2 W5, W5
          BRA Z,close_SPI1
          MOV.B [W0+1], W0
          AND.B #0xF, W0
          MOV #0x1, W1
          CP.B W0, W1
          BRA NZ,l0x4E6
pe1_readc:
          MOV #0xA0C, W0
          MOV.B [W0+2], W1
          ZE W1, W1
          MOV W1, TBLPAG
          MOV [W0+4], W7
l0x4DC:
          TBLRDL [W7++], W0
          RCALL wait_rd_SPI_wr_SPI
          DEC W5, W5
          BRA NZ,l0x4DC
          BRA close_SPI1
l0x4E6:
          MOV #0x2, W1
          CP.B W0, W1
          BRA NZ,l0x54A
pe2_readp:
          MOV #0xA0C, W0
          MOV [W0+2], W5
          LSR W5, W6
          ADD #0x4, W0
          MOV.B [W0], W1
          MOV W1, W8
          MOV [++W0], W1
          MOV W1, W7
          DEC W5, W0
          BRA Z,l0x52A
          MOV #0x0, W1
l0x502:
          MOV W8, TBLPAG
          NOP 
          TBLRDL [W7], [W1]
          RCALL wait_rd_SPI_wr_SPI
          TBLRDH.B [W7], [W1++]
          ADD #0x2, W7
          ADDC #0x0, W8
          MOV W8, TBLPAG
          NOP 
          TBLRDH.B [W7], [W1--]
          RCALL wait_rd_SPI_wr_SPI
          TBLRDL [W7], W0
          RCALL wait_rd_SPI_wr_SPI
          ADD #0x2, W7
          ADDC #0x0, W8
          MOV W8, TBLPAG
          DEC W6, W6
          BRA NZ,l0x502
          BTSS W5, #0
          BRA close_SPI1
l0x52A:
          MOV W8, TBLPAG
          NOP 
          TBLRDL [W7], W0
          RCALL wait_rd_SPI_wr_SPI
          TBLRDH.B [W7], W0
          ZE W0, W0
          RCALL wait_rd_SPI_wr_SPI
close_SPI1:
          CLRWDT 
          BTSS 0x85, #2
          BRA close_SPI1
          BCLR 0x85, #2
          BCLR 0x241, #7
          BSET 0x243, #3
          BSET 0x241, #7
          MOV SPI1BUF, W1
          RETURN 
l0x54A:
          MOV #0xC, W1
          CP.B W0, W1
          BRA NZ,close_SPI1
pec_crc_check:
          MOV [W7++], W0
          RCALL wait_rd_SPI_wr_SPI
          BRA close_SPI1
chk_SPI1IF_read_SPI1BUF:
          CLRWDT 
          BTSS 0x85, #2
          BRA chk_SPI1IF_read_SPI1BUF
          BCLR 0x85, #2
          MOV SPI1BUF, W0
          RETURN 
wait_rd_SPI_wr_SPI:
          MOV W1, [W15++]
l0x564:
          CLRWDT 
          BTSS 0x85, #2
          BRA l0x564
          BTSS 0x85, #2
          BRA l0x564
          BCLR 0x85, #2
          MOV SPI1BUF, W1
          MOV W0, SPI1BUF
          MOV [--W15], W1
          RETURN 
setup_SPI1:
          MOV SR, W0
          IOR #0xA0, W0
          MOV W0, SR
          MOV #0xC00, W0
          MOV W0, SPI1CON1
          BCLR 0x85, #2
          CLR IPC2
          BSET 0xA9, #0
          BSET 0x95, #2
          MOV #0x8000, W0
          MOV W0, SPI1STAT
          CLR 0x762
          CLR 0x764
          RETURN 
crc_check:
          LNK #0xC
          MUL.UU W0, #0, W0
          MOV W0, [W14+4]
          MOV W1, [W14+6]
          MUL.UU W0, #0, W0
          MOV W0, [W14+8]
          MOV W1, [W14+10]
          MOV 0xA0E, W0
          LSR W0, #8, W0
          AND.B W0, #0xF, W0
          MOV.B W0, [W14]
          MOV 0xA0E, W0
          LSR W0, #12, W0
          ZE W0, W0
          MOV W0, 0xADC
          ADD W14, #0x4, W0
          INC2 W0, W1
          MOV.B 0xA0E, WREG
          MOV.B W0, [W1]
          MOV 0xA10, W0
          MUL.UU W0, #1, W2
          MOV [W14+4], W0
          MOV [W14+6], W1
          IOR W2, W0, W0
          IOR W3, W1, W1
          MOV W0, [W14+4]
          MOV W1, [W14+6]
          ADD W14, #0x8, W0
          INC2 W0, W1
          MOV 0xA12, W0
          MOV W0, [W1]
          MOV 0xA14, W0
          MUL.UU W0, #1, W2
          MOV [W14+8], W0
          MOV [W14+10], W1
          IOR W2, W0, W0
          IOR W3, W1, W1
          MOV W0, [W14+8]
          MOV W1, [W14+10]
          MOV [W14+8], W2
          MOV [W14+10], W3
          MOV [W14+4], W0
          MOV [W14+6], W1
          MOV.B [W14], W4
          RCALL FUNC0x64A
          MOV W0, [W14+2]
          MOV [W14+2], W0
          ULNK 
          RETURN 
compute_CRC16_table_0x1021:
          LNK #0x6
          CLR W0
          MOV W0, [W14+2]
          BRA _for_loop_0x5FE_i<=255
_for_loop_0x5FE:
          MOV [W14+2], W0
          SL W0, #8, W0
          MOV W0, [W14+4]
          MOV #0x8, W0
          MOV.B W0, [W14]
          BRA _while_loop_0x60A_!=0
_while_loop_0x60A:
          MOV [W14+4], W0
          CP0 W0
          BRA GE,l0x61E
          MOV [W14+4], W0
          ADD W0, W0, W0
          MOV W0, W1
          MOV #0x1021, W0
          XOR W1, W0, W0
          MOV W0, [W14+4]
          BRA l0x624
l0x61E:
          MOV [W14+4], W0
          ADD W0, W0, W0
          MOV W0, [W14+4]
l0x624:
          DEC.B [W14], [W14]
_while_loop_0x60A_!=0:
          CP0.B [W14]
          BRA NZ,_while_loop_0x60A
_store_data_to_buffer@0x80C:
          CLRWDT 
          MOV [W14+2], W0
          ADD W0, W0, W1
          MOV #0x80C, W0
          ADD W1, W0, W0
          MOV [W14+4], W1
          MOV W1, [W0]
          MOV [W14+2], W0
          INC W0, W0
          MOV W0, [W14+2]
_for_loop_0x5FE_i<=255:
          MOV [W14+2], W1
          MOV #0xFF, W0
          SUB W1, W0, [W15]
          BRA LE,_for_loop_0x5FE
          ULNK 
          RETURN 
FUNC0x64A:
          LNK #0x20
          MOV W0, [W14+14]
          MOV W1, [W14+16]
          MOV W2, [W14+18]
          MOV W3, [W14+20]
          MOV.B W4, [W14+22]
          SETM W0
          MOV W0, [W14+10]
          CLR W0
          MOV W0, [W14+8]
          MOV [W14+14], W2
          MOV [W14+16], W3
          MOV #0x0, W0
          MOV #0x1, W1
          ADD W0, W2, W0
          ADDC W1, W3, W1
          MOV #0x0, W2
          MOV #0xFFFF, W3
          MOV W0, W4
          MOV W1, W5
          MOV W2, W0
          MOV W3, W1
          AND W4, W0, W2
          AND W5, W1, W0
          MUL.UU W0, #1, W4
          MOV W4, [W14+28]
          MOV W5, [W14+30]
          MOV [W14+28], W0
          MOV [W14+30], W1
          SL W0, #0, W1
          MOV #0x0, W0
          MOV W0, [W14+28]
          MOV W1, [W14+30]
          MOV [W14+28], W0
          MOV [W14+30], W1
          MUL.UU W2, #1, W4
          MOV W4, [W14+28]
          MOV W5, [W14+30]
          MOV [W14+28], W2
          MOV [W14+30], W3
          IOR W0, W2, W0
          IOR W1, W3, W1
          MOV W0, [W14+2]
          MOV W1, [W14+4]
          BRA l0x730
l0x6A4:
          MOV [W14+18], W0
          MOV [W14+20], W1
          ADD W0, W0, W2
          ADDC W1, W1, W3
          MOV [W14+14], W0
          MOV [W14+16], W1
          ADD W0, W2, W2
          ADDC W1, W3, W3
          MOV [W14+2], W0
          MOV [W14+4], W1
          SUB W2, W0, [W15]
          SUBB W3, W1, [W15]
          BRA NC,l0x6F2
          MOV [W14+2], W2
          MOV [W14+4], W3
          MOV [W14+14], W0
          MOV [W14+16], W1
          SUB W2, W0, W0
          SUBB W3, W1, W1
          LSR W1, W1
          RRC W0, W0
          MOV W0, [W14+6]
          MOV [W14+2], W2
          MOV [W14+4], W3
          MOV #0x0, W0
          MOV #0x1, W1
          ADD W0, W2, W0
          ADDC W1, W3, W1
          MOV W0, [W14+2]
          MOV W1, [W14+4]
          MOV [W14+6], W0
          MUL.UU W0, #1, W2
          MOV [W14+18], W0
          MOV [W14+20], W1
          SUB W0, W2, W0
          SUBB W1, W3, W1
          MOV W0, [W14+18]
          MOV W1, [W14+20]
          BRA l0x6FC
l0x6F2:
          MOV [W14+18], W3
          MOV W3, [W14+6]
          MUL.UU W0, #0, W0
          MOV W0, [W14+18]
          MOV W1, [W14+20]
l0x6FC:
          MOV 0xADC, W0
          CP0 W0
          BRA NZ,l0x710
          MOV [W14+10], W3
          MOV [W14+6], W2
          MOV [W14+14], W0
          MOV [W14+16], W1
          RCALL FUNC0x75A
          MOV W0, [W14+10]
          BRA l0x71C
l0x710:
          MOV [W14+8], W3
          MOV [W14+6], W2
          MOV [W14+14], W0
          MOV [W14+16], W1
          RCALL FUNC0x7A8
          MOV W0, [W14+8]
l0x71C:
          MOV [W14+6], W0
          MOV #0x0, W1
          ADD W0, W0, W2
          ADDC W1, W1, W3
          MOV [W14+14], W0
          MOV [W14+16], W1
          ADD W2, W0, W0
          ADDC W3, W1, W1
          MOV W0, [W14+14]
          MOV W1, [W14+16]
l0x730:
          MOV [W14+18], W0
          MOV [W14+20], W1
          SUB W0, #0x0, [W15]
          SUBB W1, #0x0, [W15]
          BRA NZ,l0x6A4
          MOV 0xADC, W0
          CP0 W0
          BRA NZ,l0x74A
          MOV [W14+10], W0
          MUL.UU W0, #1, W4
          MOV W4, [W14+24]
          MOV W5, [W14+26]
          BRA l0x752
l0x74A:
          MOV [W14+8], W0
          MUL.UU W0, #1, W2
          MOV W2, [W14+24]
          MOV W3, [W14+26]
l0x752:
          MOV [W14+24], W0
          MOV [W14+26], W1
          ULNK 
          RETURN 
FUNC0x75A:
          MOV #0x32, W6
          MOV W1, [W6]
          MOV W0, W7
          MOV #0x80A, W6
          MOV W2, [W6]
          LSR 0x80A
          MOV #0x80C, W8
          MOV #0x6, W2
l0x76A:
          MOV #0x800, W6
          TBLRDL [W7], [W6++]
          TBLRDH.B [W7++], [W6++]
          TBLRDH.B [++W7], [W6++]
          TBLRDL [W7++], [W6++]
          MOV #0x800, W4
          MOV #0x3, W5
          CLR W1
l0x77A:
          CLRWDT 
          SWAP W3
          MOV.B W3, W0
          XOR.B W0, [W4++], [W1]
          CLR.B 0x1
          RLNC W0, W0
          ADD W0, W8, W0
          CLR.B W3
          XOR W3, [W0], [W2]
          SWAP W3
          MOV.B W3, W0
          XOR.B W0, [W4++], [W1]
          CLR.B 0x1
          RLNC W0, W0
          ADD W0, W8, W0
          CLR.B W3
          XOR W3, [W0], [W2]
          DEC WREG5
          BRA NZ,l0x77A
          DEC 0x80A
          BRA NZ,l0x76A
          MOV W3, W0
          RETURN 
FUNC0x7A8:
          MOV #0x32, W6
          MOV W1, [W6]
          MOV W0, W7
l0x7AE:
          CLRWDT 
          CLR W4
          TBLRDH [W7], W4
          TBLRDL [W7++], W5
          CLR W8
          MOV.B W5, W8
          LSR W5, #8, W5
          ADD W4, W5, W4
          ADD W4, W8, W4
          ADD W4, W3, W3
          DEC W2, W2
          BRA NZ,l0x7AE
          MOV W3, W0
          RETURN 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOP 
          NOPR 
          NOPR 
          NOP 
          NOP 
          NOPR 
          NOPR 
          NOPR 
          NOPR 
          NOPR 
          NOPR 
          NOPR 
;End of File! Press any key to exit the program.
