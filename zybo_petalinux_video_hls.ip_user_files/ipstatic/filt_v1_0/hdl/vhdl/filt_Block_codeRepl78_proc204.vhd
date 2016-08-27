-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filt_Block_codeRepl78_proc204 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    sel : IN STD_LOGIC_VECTOR (31 downto 0);
    src_mat_rows_V_out_din : OUT STD_LOGIC_VECTOR (8 downto 0);
    src_mat_rows_V_out_full_n : IN STD_LOGIC;
    src_mat_rows_V_out_write : OUT STD_LOGIC;
    src_mat_cols_V_out_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    src_mat_cols_V_out_full_n : IN STD_LOGIC;
    src_mat_cols_V_out_write : OUT STD_LOGIC;
    dst_mat_rows_V_out_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    dst_mat_rows_V_out_full_n : IN STD_LOGIC;
    dst_mat_rows_V_out_write : OUT STD_LOGIC;
    dst_mat_cols_V_out_din : OUT STD_LOGIC_VECTOR (10 downto 0);
    dst_mat_cols_V_out_full_n : IN STD_LOGIC;
    dst_mat_cols_V_out_write : OUT STD_LOGIC;
    sel_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    sel_out_full_n : IN STD_LOGIC;
    sel_out_write : OUT STD_LOGIC );
end;


architecture behav of filt_Block_codeRepl78_proc204 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv9_F0 : STD_LOGIC_VECTOR (8 downto 0) := "011110000";
    constant ap_const_lv10_140 : STD_LOGIC_VECTOR (9 downto 0) := "0101000000";
    constant ap_const_lv10_1E0 : STD_LOGIC_VECTOR (9 downto 0) := "0111100000";
    constant ap_const_lv11_280 : STD_LOGIC_VECTOR (10 downto 0) := "01010000000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_19 : BOOLEAN;
    signal src_mat_rows_V_out_blk_n : STD_LOGIC;
    signal src_mat_cols_V_out_blk_n : STD_LOGIC;
    signal dst_mat_rows_V_out_blk_n : STD_LOGIC;
    signal dst_mat_cols_V_out_blk_n : STD_LOGIC;
    signal sel_out_blk_n : STD_LOGIC;
    signal ap_sig_66 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_66)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    ap_done_assign_proc : process(ap_done_reg, ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_19_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_19 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_66_assign_proc : process(ap_start, ap_done_reg, src_mat_rows_V_out_full_n, src_mat_cols_V_out_full_n, dst_mat_rows_V_out_full_n, dst_mat_cols_V_out_full_n, sel_out_full_n)
    begin
                ap_sig_66 <= ((sel_out_full_n = ap_const_logic_0) or (src_mat_rows_V_out_full_n = ap_const_logic_0) or (src_mat_cols_V_out_full_n = ap_const_logic_0) or (dst_mat_rows_V_out_full_n = ap_const_logic_0) or (dst_mat_cols_V_out_full_n = ap_const_logic_0) or (ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_19)
    begin
        if (ap_sig_19) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    dst_mat_cols_V_out_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, dst_mat_cols_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            dst_mat_cols_V_out_blk_n <= dst_mat_cols_V_out_full_n;
        else 
            dst_mat_cols_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_mat_cols_V_out_din <= ap_const_lv11_280;

    dst_mat_cols_V_out_write_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            dst_mat_cols_V_out_write <= ap_const_logic_1;
        else 
            dst_mat_cols_V_out_write <= ap_const_logic_0;
        end if; 
    end process;


    dst_mat_rows_V_out_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, dst_mat_rows_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            dst_mat_rows_V_out_blk_n <= dst_mat_rows_V_out_full_n;
        else 
            dst_mat_rows_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_mat_rows_V_out_din <= ap_const_lv10_1E0;

    dst_mat_rows_V_out_write_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            dst_mat_rows_V_out_write <= ap_const_logic_1;
        else 
            dst_mat_rows_V_out_write <= ap_const_logic_0;
        end if; 
    end process;


    sel_out_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, sel_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            sel_out_blk_n <= sel_out_full_n;
        else 
            sel_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    sel_out_din <= sel;

    sel_out_write_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            sel_out_write <= ap_const_logic_1;
        else 
            sel_out_write <= ap_const_logic_0;
        end if; 
    end process;


    src_mat_cols_V_out_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, src_mat_cols_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            src_mat_cols_V_out_blk_n <= src_mat_cols_V_out_full_n;
        else 
            src_mat_cols_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    src_mat_cols_V_out_din <= ap_const_lv10_140;

    src_mat_cols_V_out_write_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            src_mat_cols_V_out_write <= ap_const_logic_1;
        else 
            src_mat_cols_V_out_write <= ap_const_logic_0;
        end if; 
    end process;


    src_mat_rows_V_out_blk_n_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, src_mat_rows_V_out_full_n)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            src_mat_rows_V_out_blk_n <= src_mat_rows_V_out_full_n;
        else 
            src_mat_rows_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    src_mat_rows_V_out_din <= ap_const_lv9_F0;

    src_mat_rows_V_out_write_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_66)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_66))) then 
            src_mat_rows_V_out_write <= ap_const_logic_1;
        else 
            src_mat_rows_V_out_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;