require 'mkmf'
$libs += " -lm"
$CFLAGS += " -g "
$srcs = ["rubex_csv.c","__rubex__common_utils_.c"]
$objs = ["rubex_csv.o","__rubex__common_utils_.o"]
create_makefile('/Users/sameer/gitrepos/rubex_csv_reader/ext/rubex_csv/rubex_csv')
