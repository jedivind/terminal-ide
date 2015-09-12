# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := vim

$(LOCAL_PATH)/auto/pathdef.c: 
	-@echo creating auto/pathdef.c
	-@echo '/* auto/pathdef.c */' > auto/pathdef.c
	-@echo '/* This file is automatically created by Makefile' >> auto/pathdef.c
	-@echo ' * DO NOT EDIT!  Change Makefile only. */' >> auto/pathdef.c
	-@echo '#include "vim.h"' >> auto/pathdef.c
	-@echo 'char_u *default_vim_dir = (char_u *)"/data/local/usr/share/vim";' >> auto/pathdef.c
	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' >> auto/pathdef.c
	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS)";' >> auto/pathdef.c
	-@echo 'char_u *default_vimruntime_dir = (char_u *)"/data/local/usr/share/vim";' >> auto/pathdef.c
	-@echo 'char_u *compiled_user = (char_u *)"$(USERNAME)";' >> auto/pathdef.c
	-@echo 'char_u *compiled_sys = (char_u *)"$(USERDOMAIN)";' >> auto/pathdef.c
	-@sh $(LOCAL_PATH)/pathdef.sh

NCURSES_PATH = ncurses
serial = $(NCURSES_PATH)/tty
base = $(NCURSES_PATH)/base
trace = $(NCURSES_PATH)/trace
tinfo = $(NCURSES_PATH)/tinfo

NCURSES_FILES = \
	$(serial)/hardscroll.c \
	$(serial)/hashmap.c \
	$(base)/lib_addch.c \
	$(base)/lib_addstr.c \
	$(base)/lib_beep.c \
	$(base)/lib_bkgd.c \
	$(base)/lib_box.c \
	$(base)/lib_chgat.c \
	$(base)/lib_clear.c \
	$(base)/lib_clearok.c \
	$(base)/lib_clrbot.c \
	$(base)/lib_clreol.c \
	$(base)/lib_color.c \
	$(base)/lib_colorset.c \
	$(base)/lib_delch.c \
	$(base)/lib_delwin.c \
	$(base)/lib_echo.c \
	$(base)/lib_endwin.c \
	$(base)/lib_erase.c \
	$(base)/lib_flash.c \
	$(NCURSES_PATH)/lib_gen.c \
	$(base)/lib_getch.c \
	$(base)/lib_getstr.c \
	$(base)/lib_hline.c \
	$(base)/lib_immedok.c \
	$(base)/lib_inchstr.c \
	$(base)/lib_initscr.c \
	$(base)/lib_insch.c \
	$(base)/lib_insdel.c \
	$(base)/lib_insnstr.c \
	$(base)/lib_instr.c \
	$(base)/lib_isendwin.c \
	$(base)/lib_leaveok.c \
	$(base)/lib_mouse.c \
	$(base)/lib_move.c \
	$(serial)/lib_mvcur.c \
	$(base)/lib_mvwin.c \
	$(base)/lib_newterm.c \
	$(base)/lib_newwin.c \
	$(base)/lib_nl.c \
	$(base)/lib_overlay.c \
	$(base)/lib_pad.c \
	$(base)/lib_printw.c \
	$(base)/lib_redrawln.c \
	$(base)/lib_refresh.c \
	$(base)/lib_restart.c \
	$(base)/lib_scanw.c \
	$(base)/lib_screen.c \
	$(base)/lib_scroll.c \
	$(base)/lib_scrollok.c \
	$(base)/lib_scrreg.c \
	$(base)/lib_set_term.c \
	$(base)/lib_slk.c \
	$(base)/lib_slkatr_set.c \
	$(base)/lib_slkatrof.c \
	$(base)/lib_slkatron.c \
	$(base)/lib_slkatrset.c \
	$(base)/lib_slkattr.c \
	$(base)/lib_slkclear.c \
	$(base)/lib_slkcolor.c \
	$(base)/lib_slkinit.c \
	$(base)/lib_slklab.c \
	$(base)/lib_slkrefr.c \
	$(base)/lib_slkset.c \
	$(base)/lib_slktouch.c \
	$(base)/lib_touch.c \
	$(trace)/lib_tracedmp.c \
	$(trace)/lib_tracemse.c \
	$(serial)/lib_tstp.c \
	$(base)/lib_ungetch.c \
	$(serial)/lib_vidattr.c \
	$(base)/lib_vline.c \
	$(base)/lib_wattroff.c \
	$(base)/lib_wattron.c \
	$(base)/lib_winch.c \
	$(base)/lib_window.c \
	$(base)/nc_panel.c \
	$(base)/safe_sprintf.c \
	$(serial)/tty_update.c \
	$(trace)/varargs.c \
	$(base)/memmove.c \
	$(base)/vsscanf.c \
	$(base)/lib_freeall.c \
	$(NCURSES_PATH)/expanded.c \
	$(base)/legacy_coding.c \
	$(base)/lib_dft_fgbg.c \
	$(tinfo)/lib_print.c \
	$(base)/resizeterm.c \
	$(trace)/trace_xnames.c \
	$(tinfo)/use_screen.c \
	$(base)/use_window.c \
	$(base)/wresize.c \
	$(tinfo)/access.c \
	$(tinfo)/add_tries.c \
	$(tinfo)/alloc_ttype.c \
	$(NCURSES_PATH)/codes.c \
	$(tinfo)/comp_error.c \
	$(tinfo)/db_iterator.c \
	$(tinfo)/doalloc.c \
	$(tinfo)/entries.c \
	$(NCURSES_PATH)/fallback.c \
	$(tinfo)/free_ttype.c \
	$(tinfo)/getenv_num.c \
	$(tinfo)/home_terminfo.c \
	$(tinfo)/init_keytry.c \
	$(tinfo)/lib_acs.c \
	$(tinfo)/lib_baudrate.c \
	$(tinfo)/lib_cur_term.c \
	$(tinfo)/lib_data.c \
	$(tinfo)/lib_has_cap.c \
	$(tinfo)/lib_kernel.c \
	$(NCURSES_PATH)/lib_keyname.c \
	$(tinfo)/lib_longname.c \
	$(tinfo)/lib_napms.c \
	$(tinfo)/lib_options.c \
	$(tinfo)/lib_raw.c \
	$(tinfo)/lib_setup.c \
	$(tinfo)/lib_termcap.c \
	$(tinfo)/lib_termname.c \
	$(tinfo)/lib_tgoto.c \
	$(tinfo)/lib_ti.c \
	$(tinfo)/lib_tparm.c \
	$(tinfo)/lib_tputs.c \
	$(trace)/lib_trace.c \
	$(trace)/lib_traceatr.c \
	$(trace)/lib_tracebits.c \
	$(trace)/lib_tracechr.c \
	$(tinfo)/lib_ttyflags.c \
	$(serial)/lib_twait.c \
	$(tinfo)/name_match.c \
	$(NCURSES_PATH)/names.c \
	$(tinfo)/read_entry.c \
	$(tinfo)/read_termcap.c \
	$(tinfo)/setbuf.c \
	$(tinfo)/strings.c \
	$(trace)/trace_buf.c \
	$(trace)/trace_tries.c \
	$(base)/tries.c \
	$(tinfo)/trim_sgr0.c \
	$(NCURSES_PATH)/unctrl.c \
	$(trace)/visbuf.c \
	$(tinfo)/alloc_entry.c \
	$(tinfo)/captoinfo.c \
	$(NCURSES_PATH)/comp_captab.c \
	$(tinfo)/comp_expand.c \
	$(tinfo)/comp_hash.c \
	$(tinfo)/comp_parse.c \
	$(tinfo)/comp_scan.c \
	$(tinfo)/parse_entry.c \
	$(tinfo)/write_entry.c \
	$(base)/define_key.c \
	$(tinfo)/hashed_db.c \
	$(base)/key_defined.c \
	$(base)/keybound.c \
	$(base)/keyok.c \
	$(base)/version.c

LOCAL_SRC_FILES := blowfish.c \
	$(NCURSES_FILES) \
	auto/pathdef.c \
	buffer.c \
	charset.c \
	diff.c \
	digraph.c \
	edit.c \
	eval.c \
	ex_cmds.c \
	ex_cmds2.c \
	ex_docmd.c \
	ex_eval.c \
	ex_getln.c \
	fileio.c \
	fold.c \
	getchar.c \
	hardcopy.c \
	hashtab.c \
	if_cscope.c \
	if_xcmdsrv.c \
	main.c \
	mark.c \
	memfile.c \
	memline.c \
	menu.c \
	message.c \
	misc1.c \
	misc2.c \
	move.c \
	mbyte.c \
	normal.c \
	ops.c \
	option.c \
	os_unix.c \
	popupmnu.c \
	quickfix.c \
	regexp.c \
	screen.c \
	search.c \
	sha256.c \
	spell.c \
	syntax.c \
	tag.c \
	term.c \
	ui.c \
	undo.c \
	version.c \
	window.c \


LOCAL_C_INCLUDES += $(LOCAL_PATH)/proto/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ncurses/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/ncurses/
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DTRACE

include $(BUILD_EXECUTABLE)
