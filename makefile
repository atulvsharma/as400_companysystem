
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) DEVUSR
SHELL=/QOpenSys/usr/bin/qsh

all: mypgm.pgm.sqlrpgle

## Targets

#depts.pgm.sqlrpgle: depts.dspf department.table
#employees.pgm.sqlrpgle: emps.dspf employee.table

#depts.pgm.sqlrpgle: depts.dspf
#employees.pgm.sqlrpgle: emps.dspf

## Rules

#%.table: qddssrc/%.table
#	liblist -c $(BIN_LIB);\
#	system "RUNSQLSTM SRCSTMF('$<') COMMIT(*NONE)"

%.pgm.sqlrpgle: qrpglesrc/%.pgm.sqlrpgle
	system -s "CHGATR OBJ('$<') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('$<') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF) COMPILEOPT('INCDIR(''qrpgleref'')')"

#%.dspf:
#	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QDDSSRC) RCDLEN(112)"
#	system "CPYFRMSTMF FROMSTMF('./qddssrc/$*.dspf') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QDDSSRC.file/$*.mbr') MBROPT(*REPLACE)"
#	system -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/QDDSSRC) SRCMBR($*)"

