-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filt_Scale1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_0_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_0_data_stream_V_empty_n : IN STD_LOGIC;
    src_0_data_stream_V_read : OUT STD_LOGIC;
    src_1_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_1_data_stream_V_empty_n : IN STD_LOGIC;
    src_1_data_stream_V_read : OUT STD_LOGIC;
    src_2_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_2_data_stream_V_empty_n : IN STD_LOGIC;
    src_2_data_stream_V_read : OUT STD_LOGIC;
    dst_0_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    dst_0_data_stream_V_full_n : IN STD_LOGIC;
    dst_0_data_stream_V_write : OUT STD_LOGIC;
    dst_1_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    dst_1_data_stream_V_full_n : IN STD_LOGIC;
    dst_1_data_stream_V_write : OUT STD_LOGIC;
    dst_2_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    dst_2_data_stream_V_full_n : IN STD_LOGIC;
    dst_2_data_stream_V_write : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of filt_Scale1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_20 : BOOLEAN;
    signal ap_sig_57 : BOOLEAN;
    signal grp_filt_arithm_pro_fu_36_ap_start : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_ap_done : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_ap_idle : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_ap_ready : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_src_0_data_stream_V_read : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_src_1_data_stream_V_read : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_src_2_data_stream_V_read : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_write : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_write : STD_LOGIC;
    signal grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_write : STD_LOGIC;
    signal ap_reg_grp_filt_arithm_pro_fu_36_ap_start : STD_LOGIC := '0';
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_92 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component filt_arithm_pro IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_0_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_0_data_stream_V_empty_n : IN STD_LOGIC;
        src_0_data_stream_V_read : OUT STD_LOGIC;
        src_1_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_1_data_stream_V_empty_n : IN STD_LOGIC;
        src_1_data_stream_V_read : OUT STD_LOGIC;
        src_2_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        src_2_data_stream_V_empty_n : IN STD_LOGIC;
        src_2_data_stream_V_read : OUT STD_LOGIC;
        dst_0_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst_0_data_stream_V_full_n : IN STD_LOGIC;
        dst_0_data_stream_V_write : OUT STD_LOGIC;
        dst_1_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst_1_data_stream_V_full_n : IN STD_LOGIC;
        dst_1_data_stream_V_write : OUT STD_LOGIC;
        dst_2_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        dst_2_data_stream_V_full_n : IN STD_LOGIC;
        dst_2_data_stream_V_write : OUT STD_LOGIC;
        p0 : IN STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    grp_filt_arithm_pro_fu_36 : component filt_arithm_pro
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_filt_arithm_pro_fu_36_ap_start,
        ap_done => grp_filt_arithm_pro_fu_36_ap_done,
        ap_idle => grp_filt_arithm_pro_fu_36_ap_idle,
        ap_ready => grp_filt_arithm_pro_fu_36_ap_ready,
        src_0_data_stream_V_dout => src_0_data_stream_V_dout,
        src_0_data_stream_V_empty_n => src_0_data_stream_V_empty_n,
        src_0_data_stream_V_read => grp_filt_arithm_pro_fu_36_src_0_data_stream_V_read,
        src_1_data_stream_V_dout => src_1_data_stream_V_dout,
        src_1_data_stream_V_empty_n => src_1_data_stream_V_empty_n,
        src_1_data_stream_V_read => grp_filt_arithm_pro_fu_36_src_1_data_stream_V_read,
        src_2_data_stream_V_dout => src_2_data_stream_V_dout,
        src_2_data_stream_V_empty_n => src_2_data_stream_V_empty_n,
        src_2_data_stream_V_read => grp_filt_arithm_pro_fu_36_src_2_data_stream_V_read,
        dst_0_data_stream_V_din => grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_din,
        dst_0_data_stream_V_full_n => dst_0_data_stream_V_full_n,
        dst_0_data_stream_V_write => grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_write,
        dst_1_data_stream_V_din => grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_din,
        dst_1_data_stream_V_full_n => dst_1_data_stream_V_full_n,
        dst_1_data_stream_V_write => grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_write,
        dst_2_data_stream_V_din => grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_din,
        dst_2_data_stream_V_full_n => dst_2_data_stream_V_full_n,
        dst_2_data_stream_V_write => grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_write,
        p0 => p_read);





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
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_logic_0 = grp_filt_arithm_pro_fu_36_ap_done)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_grp_filt_arithm_pro_fu_36_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_filt_arithm_pro_fu_36_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_57))) then 
                    ap_reg_grp_filt_arithm_pro_fu_36_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_filt_arithm_pro_fu_36_ap_ready)) then 
                    ap_reg_grp_filt_arithm_pro_fu_36_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_57, grp_filt_arithm_pro_fu_36_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_57)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_const_logic_0 = grp_filt_arithm_pro_fu_36_ap_done))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    ap_done_assign_proc : process(ap_done_reg, grp_filt_arithm_pro_fu_36_ap_done, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_logic_0 = grp_filt_arithm_pro_fu_36_ap_done))))) then 
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


    ap_ready_assign_proc : process(grp_filt_arithm_pro_fu_36_ap_done, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_logic_0 = grp_filt_arithm_pro_fu_36_ap_done)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_20_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_20 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_57_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_57 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_sig_92_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_92 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_20)
    begin
        if (ap_sig_20) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_92)
    begin
        if (ap_sig_92) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;

    dst_0_data_stream_V_din <= grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_din;

    dst_0_data_stream_V_write_assign_proc : process(grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_write, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            dst_0_data_stream_V_write <= grp_filt_arithm_pro_fu_36_dst_0_data_stream_V_write;
        else 
            dst_0_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

    dst_1_data_stream_V_din <= grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_din;

    dst_1_data_stream_V_write_assign_proc : process(grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_write, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            dst_1_data_stream_V_write <= grp_filt_arithm_pro_fu_36_dst_1_data_stream_V_write;
        else 
            dst_1_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

    dst_2_data_stream_V_din <= grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_din;

    dst_2_data_stream_V_write_assign_proc : process(grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_write, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            dst_2_data_stream_V_write <= grp_filt_arithm_pro_fu_36_dst_2_data_stream_V_write;
        else 
            dst_2_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_filt_arithm_pro_fu_36_ap_start <= ap_reg_grp_filt_arithm_pro_fu_36_ap_start;

    src_0_data_stream_V_read_assign_proc : process(grp_filt_arithm_pro_fu_36_src_0_data_stream_V_read, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            src_0_data_stream_V_read <= grp_filt_arithm_pro_fu_36_src_0_data_stream_V_read;
        else 
            src_0_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;


    src_1_data_stream_V_read_assign_proc : process(grp_filt_arithm_pro_fu_36_src_1_data_stream_V_read, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            src_1_data_stream_V_read <= grp_filt_arithm_pro_fu_36_src_1_data_stream_V_read;
        else 
            src_1_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;


    src_2_data_stream_V_read_assign_proc : process(grp_filt_arithm_pro_fu_36_src_2_data_stream_V_read, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then 
            src_2_data_stream_V_read <= grp_filt_arithm_pro_fu_36_src_2_data_stream_V_read;
        else 
            src_2_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;