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
@"fmt_string" = internal constant [4 x i8] c"%s\0a\00"
@"fmt_bool" = internal constant [4 x i8] c"%s\0a\00"
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
  %".45" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", i8* %".44")
  %".47" = load double, double* @"primeiro"
  %".48" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", double %".47")
  %".50" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_5", i32 0, i32 0
  %".51" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51", i8* %".50")
  %".53" = load double, double* @"tamanho"
  %".54" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54", double %".53")
  %".56" = getelementptr inbounds [18 x i8], [18 x i8]* @"str_6", i32 0, i32 0
  %".57" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", i8* %".56")
  %".59" = load {i64, double*}, {i64, double*}* @"numeros"
  %".60" = extractvalue {i64, double*} %".59", 1
  %".61" = fptosi double 0x4000000000000000 to i64
  %".62" = getelementptr double, double* %".60", i64 %".61"
  %".63" = load double, double* %".62"
  %".64" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".64", double %".63")
  %".66" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_7", i32 0, i32 0
  %".67" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".67", i8* %".66")
  %".69" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".70" = extractvalue {i64, i8**} %".69", 1
  %".71" = fptosi double              0x0 to i64
  %".72" = getelementptr i8*, i8** %".70", i64 %".71"
  %".73" = load i8*, i8** %".72"
  %".74" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", i8* %".73")
  %".76" = load {i64, double*}, {i64, double*}* @"numeros"
  %".77" = extractvalue {i64, double*} %".76", 1
  %".78" = fptosi double 0x4000000000000000 to i64
  %".79" = getelementptr double, double* %".77", i64 %".78"
  store double 0x4024000000000000, double* %".79"
  %".81" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_8", i32 0, i32 0
  %".82" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".83" = extractvalue {i64, i8**} %".82", 1
  %".84" = fptosi double              0x0 to i64
  %".85" = getelementptr i8*, i8** %".83", i64 %".84"
  store i8* %".81", i8** %".85"
  %".87" = getelementptr inbounds [29 x i8], [29 x i8]* @"str_9", i32 0, i32 0
  %".88" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".88", i8* %".87")
  %".90" = load {i64, double*}, {i64, double*}* @"numeros"
  %".91" = extractvalue {i64, double*} %".90", 1
  %".92" = fptosi double 0x4000000000000000 to i64
  %".93" = getelementptr double, double* %".91", i64 %".92"
  %".94" = load double, double* %".93"
  %".95" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95", double %".94")
  %".97" = getelementptr inbounds [26 x i8], [26 x i8]* @"str_10", i32 0, i32 0
  %".98" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".98", i8* %".97")
  %".100" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".101" = extractvalue {i64, i8**} %".100", 1
  %".102" = fptosi double              0x0 to i64
  %".103" = getelementptr i8*, i8** %".101", i64 %".102"
  %".104" = load i8*, i8** %".103"
  %".105" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", i8* %".104")
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