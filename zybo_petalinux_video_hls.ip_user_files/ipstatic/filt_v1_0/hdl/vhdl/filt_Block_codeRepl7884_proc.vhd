-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filt_Block_codeRepl7884_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    wrk_mats_1_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_0_V_empty_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_0_V_read : OUT STD_LOGIC;
    wrk_mats_1_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_1_V_empty_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_1_V_read : OUT STD_LOGIC;
    wrk_mats_1_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_1_data_stream_2_V_empty_n : IN STD_LOGIC;
    wrk_mats_1_data_stream_2_V_read : OUT STD_LOGIC;
    wrk_mats_3_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_3_data_stream_0_V_full_n : IN STD_LOGIC;
    wrk_mats_3_data_stream_0_V_write : OUT STD_LOGIC;
    wrk_mats_3_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_3_data_stream_1_V_full_n : IN STD_LOGIC;
    wrk_mats_3_data_stream_1_V_write : OUT STD_LOGIC;
    wrk_mats_3_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    wrk_mats_3_data_stream_2_V_full_n : IN STD_LOGIC;
    wrk_mats_3_data_stream_2_V_write : OUT STD_LOGIC;
    sel_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    sel_empty_n : IN STD_LOGIC;
    sel_read : OUT STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of filt_Block_codeRepl7884_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_20 : BOOLEAN;
    signal sel_blk_n : STD_LOGIC;
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_62 : BOOLEAN;
    signal grp_filt_CvtColor_fu_38_ap_start : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_ap_done : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_ap_idle : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_ap_ready : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_src_0_data_stream_V_read : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_src_1_data_stream_V_read : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_src_2_data_stream_V_read : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_write : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_write : STD_LOGIC;
    signal grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_write : STD_LOGIC;
    signal ap_reg_grp_filt_CvtColor_fu_38_ap_start : STD_LOGIC := '0';
    signal ap_sig_93 : BOOLEAN;
    signal tmp_104_out_fu_54_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component filt_CvtColor IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_src_0_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        p_src_0_data_stream_V_empty_n : IN STD_LOGIC;
        p_src_0_data_stream_V_read : OUT STD_LOGIC;
        p_src_1_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        p_src_1_data_stream_V_empty_n : IN STD_LOGIC;
        p_src_1_data_stream_V_read : OUT STD_LOGIC;
        p_src_2_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        p_src_2_data_stream_V_empty_n : IN STD_LOGIC;
        p_src_2_data_stream_V_read : OUT STD_LOGIC;
        p_dst_0_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        p_dst_0_data_stream_V_full_n : IN STD_LOGIC;
        p_dst_0_data_stream_V_write : OUT STD_LOGIC;
        p_dst_1_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        p_dst_1_data_stream_V_full_n : IN STD_LOGIC;
        p_dst_1_data_stream_V_write : OUT STD_LOGIC;
        p_dst_2_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        p_dst_2_data_stream_V_full_n : IN STD_LOGIC;
        p_dst_2_data_stream_V_write : OUT STD_LOGIC );
    end component;



begin
    grp_filt_CvtColor_fu_38 : component filt_CvtColor
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_filt_CvtColor_fu_38_ap_start,
        ap_done => grp_filt_CvtColor_fu_38_ap_done,
        ap_idle => grp_filt_CvtColor_fu_38_ap_idle,
        ap_ready => grp_filt_CvtColor_fu_38_ap_ready,
        p_src_0_data_stream_V_dout => wrk_mats_1_data_stream_0_V_dout,
        p_src_0_data_stream_V_empty_n => wrk_mats_1_data_stream_0_V_empty_n,
        p_src_0_data_stream_V_read => grp_filt_CvtColor_fu_38_p_src_0_data_stream_V_read,
        p_src_1_data_stream_V_dout => wrk_mats_1_data_stream_1_V_dout,
        p_src_1_data_stream_V_empty_n => wrk_mats_1_data_stream_1_V_empty_n,
        p_src_1_data_stream_V_read => grp_filt_CvtColor_fu_38_p_src_1_data_stream_V_read,
        p_src_2_data_stream_V_dout => wrk_mats_1_data_stream_2_V_dout,
        p_src_2_data_stream_V_empty_n => wrk_mats_1_data_stream_2_V_empty_n,
        p_src_2_data_stream_V_read => grp_filt_CvtColor_fu_38_p_src_2_data_stream_V_read,
        p_dst_0_data_stream_V_din => grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_din,
        p_dst_0_data_stream_V_full_n => wrk_mats_3_data_stream_0_V_full_n,
        p_dst_0_data_stream_V_write => grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_write,
        p_dst_1_data_stream_V_din => grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_din,
        p_dst_1_data_stream_V_full_n => wrk_mats_3_data_stream_1_V_full_n,
        p_dst_1_data_stream_V_write => grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_write,
        p_dst_2_data_stream_V_din => grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_din,
        p_dst_2_data_stream_V_full_n => wrk_mats_3_data_stream_2_V_full_n,
        p_dst_2_data_stream_V_write => grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_write);





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
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done))))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_filt_CvtColor_fu_38_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_filt_CvtColor_fu_38_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_93))) then 
                    ap_reg_grp_filt_CvtColor_fu_38_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_filt_CvtColor_fu_38_ap_ready)) then 
                    ap_reg_grp_filt_CvtColor_fu_38_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done))))) then 
                    ap_return_preg <= tmp_104_out_fu_54_p2;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm, sel_empty_n, grp_filt_CvtColor_fu_38_ap_done, ap_sig_93)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_93)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done)))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    ap_done_assign_proc : process(ap_done_reg, sel_empty_n, ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_ap_done)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done)))))) then 
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


    ap_ready_assign_proc : process(sel_empty_n, ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_ap_done)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done))))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(sel_empty_n, ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_ap_done, tmp_104_out_fu_54_p2, ap_return_preg)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done))))) then 
            ap_return <= tmp_104_out_fu_54_p2;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;


    ap_sig_20_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_20 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_62_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_62 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_93_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_93 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_20)
    begin
        if (ap_sig_20) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_62)
    begin
        if (ap_sig_62) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;

    grp_filt_CvtColor_fu_38_ap_start <= ap_reg_grp_filt_CvtColor_fu_38_ap_start;

    sel_blk_n_assign_proc : process(sel_empty_n, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            sel_blk_n <= sel_empty_n;
        else 
            sel_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    sel_read_assign_proc : process(sel_empty_n, ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_ap_done)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((sel_empty_n = ap_const_logic_0) or (ap_const_logic_0 = grp_filt_CvtColor_fu_38_ap_done))))) then 
            sel_read <= ap_const_logic_1;
        else 
            sel_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_104_out_fu_54_p2 <= "1" when (sel_dout = ap_const_lv32_1) else "0";

    wrk_mats_1_data_stream_0_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_src_0_data_stream_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_0_V_read <= grp_filt_CvtColor_fu_38_p_src_0_data_stream_V_read;
        else 
            wrk_mats_1_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    wrk_mats_1_data_stream_1_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_src_1_data_stream_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_1_V_read <= grp_filt_CvtColor_fu_38_p_src_1_data_stream_V_read;
        else 
            wrk_mats_1_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    wrk_mats_1_data_stream_2_V_read_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_src_2_data_stream_V_read)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_1_data_stream_2_V_read <= grp_filt_CvtColor_fu_38_p_src_2_data_stream_V_read;
        else 
            wrk_mats_1_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_3_data_stream_0_V_din <= grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_din;

    wrk_mats_3_data_stream_0_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_3_data_stream_0_V_write <= grp_filt_CvtColor_fu_38_p_dst_0_data_stream_V_write;
        else 
            wrk_mats_3_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_3_data_stream_1_V_din <= grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_din;

    wrk_mats_3_data_stream_1_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_3_data_stream_1_V_write <= grp_filt_CvtColor_fu_38_p_dst_1_data_stream_V_write;
        else 
            wrk_mats_3_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;

    wrk_mats_3_data_stream_2_V_din <= grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_din;

    wrk_mats_3_data_stream_2_V_write_assign_proc : process(ap_sig_cseq_ST_st2_fsm_1, grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_write)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            wrk_mats_3_data_stream_2_V_write <= grp_filt_CvtColor_fu_38_p_dst_2_data_stream_V_write;
        else 
            wrk_mats_3_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;