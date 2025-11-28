; ModuleID = "typescript_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"puts"(i8* %".1")

declare double @"sqrt"(double %".1")

declare double @"pow"(double %".1", double %".2")

declare i32 @"atoi"(i8* %".1")

declare double @"atof"(i8* %".1")

declare i8* @"malloc"(i64 %".1")

@"fmt_number" = internal constant [4 x i8] c"%g\0a\00"
@"fmt_number_no_nl" = internal constant [3 x i8] c"%g\00"
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_string_no_nl" = internal constant [3 x i8] c"%s\00"
@"fmt_bool" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_bool_no_nl" = internal constant [3 x i8] c"%s\00"
@"fmt_space" = internal constant [2 x i8] c" \00"
@"fmt_newline" = internal constant [2 x i8] c"\0a\00"
@"str_true" = internal constant [5 x i8] c"true\00"
@"str_false" = internal constant [6 x i8] c"false\00"
define i32 @"main"()
{
entry:
  %".2" = mul i64 5, 8
  %".3" = call i8* @"malloc"(i64 %".2")
  %".4" = bitcast i8* %".3" to double*
  %".5" = getelementptr double, double* %".4", i64 0
  store double 0x3ff0000000000000, double* %".5"
  %".7" = getelementptr double, double* %".4", i64 1
  store double 0x4000000000000000, double* %".7"
  %".9" = getelementptr double, double* %".4", i64 2
  store double 0x4008000000000000, double* %".9"
  %".11" = getelementptr double, double* %".4", i64 3
  store double 0x4010000000000000, double* %".11"
  %".13" = getelementptr double, double* %".4", i64 4
  store double 0x4014000000000000, double* %".13"
  %".15" = insertvalue {i64, double*} undef, i64 5, 0
  %".16" = insertvalue {i64, double*} %".15", double* %".4", 1
  store {i64, double*} %".16", {i64, double*}* @"numeros"
  %".18" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_0", i32 0, i32 0
  %".19" = mul i64 3, 8
  %".20" = call i8* @"malloc"(i64 %".19")
  %".21" = bitcast i8* %".20" to i8**
  %".22" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_1", i32 0, i32 0
  %".23" = getelementptr i8*, i8** %".21", i64 0
  store i8* %".22", i8** %".23"
  %".25" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_2", i32 0, i32 0
  %".26" = getelementptr i8*, i8** %".21", i64 1
  store i8* %".25", i8** %".26"
  %".28" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_3", i32 0, i32 0
  %".29" = getelementptr i8*, i8** %".21", i64 2
  store i8* %".28", i8** %".29"
  %".31" = insertvalue {i64, i8**} undef, i64 3, 0
  %".32" = insertvalue {i64, i8**} %".31", i8** %".21", 1
  store {i64, i8**} %".32", {i64, i8**}* @"nomes"
  %".34" = load {i64, double*}, {i64, double*}* @"numeros"
  %".35" = extractvalue {i64, double*} %".34", 1
  %".36" = fptosi double              0x0 to i64
  %".37" = getelementptr double, double* %".35", i64 %".36"
  %".38" = load double, double* %".37"
  store double %".38", double* @"primeiro"
  %".40" = load {i64, double*}, {i64, double*}* @"numeros"
  %".41" = extractvalue {i64, double*} %".40", 0
  %".42" = sitofp i64 %".41" to double
  store double %".42", double* @"tamanho"
  %".44" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_4", i32 0, i32 0
  %".45" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", i8* %".44")
  %".47" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47")
  %".49" = load double, double* @"primeiro"
  %".50" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", double %".49")
  %".52" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_5", i32 0, i32 0
  %".53" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53", i8* %".52")
  %".55" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55")
  %".57" = load double, double* @"tamanho"
  %".58" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", double %".57")
  %".60" = getelementptr inbounds [18 x i8], [18 x i8]* @"str_6", i32 0, i32 0
  %".61" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".61", i8* %".60")
  %".63" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63")
  %".65" = load {i64, double*}, {i64, double*}* @"numeros"
  %".66" = extractvalue {i64, double*} %".65", 1
  %".67" = fptosi double 0x4000000000000000 to i64
  %".68" = getelementptr double, double* %".66", i64 %".67"
  %".69" = load double, double* %".68"
  %".70" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70", double %".69")
  %".72" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_7", i32 0, i32 0
  %".73" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73", i8* %".72")
  %".75" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".75")
  %".77" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".78" = extractvalue {i64, i8**} %".77", 1
  %".79" = fptosi double              0x0 to i64
  %".80" = getelementptr i8*, i8** %".78", i64 %".79"
  %".81" = load i8*, i8** %".80"
  %".82" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82", i8* %".81")
  %".84" = load {i64, double*}, {i64, double*}* @"numeros"
  %".85" = extractvalue {i64, double*} %".84", 1
  %".86" = fptosi double 0x4000000000000000 to i64
  %".87" = getelementptr double, double* %".85", i64 %".86"
  store double 0x4024000000000000, double* %".87"
  %".89" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_8", i32 0, i32 0
  %".90" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".91" = extractvalue {i64, i8**} %".90", 1
  %".92" = fptosi double              0x0 to i64
  %".93" = getelementptr i8*, i8** %".91", i64 %".92"
  store i8* %".89", i8** %".93"
  %".95" = getelementptr inbounds [29 x i8], [29 x i8]* @"str_9", i32 0, i32 0
  %".96" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".96", i8* %".95")
  %".98" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".98")
  %".100" = load {i64, double*}, {i64, double*}* @"numeros"
  %".101" = extractvalue {i64, double*} %".100", 1
  %".102" = fptosi double 0x4000000000000000 to i64
  %".103" = getelementptr double, double* %".101", i64 %".102"
  %".104" = load double, double* %".103"
  %".105" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", double %".104")
  %".107" = getelementptr inbounds [26 x i8], [26 x i8]* @"str_10", i32 0, i32 0
  %".108" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", i8* %".107")
  %".110" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %".110")
  %".112" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".113" = extractvalue {i64, i8**} %".112", 1
  %".114" = fptosi double              0x0 to i64
  %".115" = getelementptr i8*, i8** %".113", i64 %".114"
  %".116" = load i8*, i8** %".115"
  %".117" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %".117", i8* %".116")
  ret i32 0
}

@"numeros" = internal global {i64, double*} zeroinitializer
@"str_0" = internal constant [4 x i8] c"Ana\00"
@"str_1" = internal constant [4 x i8] c"Ana\00"
@"str_2" = internal constant [6 x i8] c"Bruno\00"
@"str_3" = internal constant [7 x i8] c"Carlos\00"
@"nomes" = internal global {i64, i8**} zeroinitializer
@"primeiro" = internal global double              0x0
@"tamanho" = internal global double              0x0
@"str_4" = internal constant [10 x i8] c"Primeiro:\00"
@"str_5" = internal constant [9 x i8] c"Tamanho:\00"
@"str_6" = internal constant [18 x i8] c"Terceiro n\c3\bamero:\00"
@"str_7" = internal constant [15 x i8] c"Primeiro nome:\00"
@"str_8" = internal constant [6 x i8] c"Alice\00"
@"str_9" = internal constant [29 x i8] c"Terceiro n\c3\bamero atualizado:\00"
@"str_10" = internal constant [26 x i8] c"Primeiro nome atualizado:\00"