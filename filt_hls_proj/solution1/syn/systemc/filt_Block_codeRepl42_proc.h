// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _filt_Block_codeRepl42_proc_HH_
#define _filt_Block_codeRepl42_proc_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct filt_Block_codeRepl42_proc : public sc_module {
    // Port declarations 19
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<9> > src_mat_rows_V_out_din;
    sc_in< sc_logic > src_mat_rows_V_out_full_n;
    sc_out< sc_logic > src_mat_rows_V_out_write;
    sc_out< sc_lv<10> > src_mat_cols_V_out_din;
    sc_in< sc_logic > src_mat_cols_V_out_full_n;
    sc_out< sc_logic > src_mat_cols_V_out_write;
    sc_out< sc_lv<10> > dst_mat_rows_V_out_din;
    sc_in< sc_logic > dst_mat_rows_V_out_full_n;
    sc_out< sc_logic > dst_mat_rows_V_out_write;
    sc_out< sc_lv<11> > dst_mat_cols_V_out_din;
    sc_in< sc_logic > dst_mat_cols_V_out_full_n;
    sc_out< sc_logic > dst_mat_cols_V_out_write;


    // Module declarations
    filt_Block_codeRepl42_proc(sc_module_name name);
    SC_HAS_PROCESS(filt_Block_codeRepl42_proc);

    ~filt_Block_codeRepl42_proc();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_sig_cseq_ST_st1_fsm_0;
    sc_signal< bool > ap_sig_19;
    sc_signal< sc_logic > src_mat_rows_V_out_blk_n;
    sc_signal< sc_logic > src_mat_cols_V_out_blk_n;
    sc_signal< sc_logic > dst_mat_rows_V_out_blk_n;
    sc_signal< sc_logic > dst_mat_cols_V_out_blk_n;
    sc_signal< bool > ap_sig_58;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_st1_fsm_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<9> ap_const_lv9_F0;
    static const sc_lv<10> ap_const_lv10_140;
    static const sc_lv<10> ap_const_lv10_1E0;
    static const sc_lv<11> ap_const_lv11_280;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sig_19();
    void thread_ap_sig_58();
    void thread_ap_sig_cseq_ST_st1_fsm_0();
    void thread_dst_mat_cols_V_out_blk_n();
    void thread_dst_mat_cols_V_out_din();
    void thread_dst_mat_cols_V_out_write();
    void thread_dst_mat_rows_V_out_blk_n();
    void thread_dst_mat_rows_V_out_din();
    void thread_dst_mat_rows_V_out_write();
    void thread_src_mat_cols_V_out_blk_n();
    void thread_src_mat_cols_V_out_din();
    void thread_src_mat_cols_V_out_write();
    void thread_src_mat_rows_V_out_blk_n();
    void thread_src_mat_rows_V_out_din();
    void thread_src_mat_rows_V_out_write();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif