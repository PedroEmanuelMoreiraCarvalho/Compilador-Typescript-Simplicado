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
  %".2" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_0", i32 0, i32 0
  %".3" = mul i64 3, 8
  %".4" = call i8* @"malloc"(i64 %".3")
  %".5" = bitcast i8* %".4" to i8**
  %".6" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_1", i32 0, i32 0
  %".7" = getelementptr i8*, i8** %".5", i64 0
  store i8* %".6", i8** %".7"
  %".9" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_2", i32 0, i32 0
  %".10" = getelementptr i8*, i8** %".5", i64 1
  store i8* %".9", i8** %".10"
  %".12" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_3", i32 0, i32 0
  %".13" = getelementptr i8*, i8** %".5", i64 2
  store i8* %".12", i8** %".13"
  %".15" = insertvalue {i64, i8**} undef, i64 3, 0
  %".16" = insertvalue {i64, i8**} %".15", i8** %".5", 1
  store {i64, i8**} %".16", {i64, i8**}* @"nomes"
  %".18" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_4", i32 0, i32 0
  %".19" = mul i64 4, 8
  %".20" = call i8* @"malloc"(i64 %".19")
  %".21" = bitcast i8* %".20" to i8**
  %".22" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_5", i32 0, i32 0
  %".23" = getelementptr i8*, i8** %".21", i64 0
  store i8* %".22", i8** %".23"
  %".25" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_6", i32 0, i32 0
  %".26" = getelementptr i8*, i8** %".21", i64 1
  store i8* %".25", i8** %".26"
  %".28" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_7", i32 0, i32 0
  %".29" = getelementptr i8*, i8** %".21", i64 2
  store i8* %".28", i8** %".29"
  %".31" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_8", i32 0, i32 0
  %".32" = getelementptr i8*, i8** %".21", i64 3
  store i8* %".31", i8** %".32"
  %".34" = insertvalue {i64, i8**} undef, i64 4, 0
  %".35" = insertvalue {i64, i8**} %".34", i8** %".21", 1
  store {i64, i8**} %".35", {i64, i8**}* @"frutas"
  %".37" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".38" = extractvalue {i64, i8**} %".37", 1
  %".39" = fptosi double 0x3ff0000000000000 to i64
  %".40" = getelementptr i8*, i8** %".38", i64 %".39"
  %".41" = load i8*, i8** %".40"
  store i8* %".41", i8** @"segundoNome"
  %".43" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".44" = extractvalue {i64, i8**} %".43", 1
  %".45" = fptosi double              0x0 to i64
  %".46" = getelementptr i8*, i8** %".44", i64 %".45"
  %".47" = load i8*, i8** %".46"
  store i8* %".47", i8** @"primeiraFruta"
  %".49" = getelementptr inbounds [14 x i8], [14 x i8]* @"str_9", i32 0, i32 0
  %".50" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", i8* %".49")
  %".52" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52")
  %".54" = load i8*, i8** @"segundoNome"
  %".55" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55", i8* %".54")
  %".57" = getelementptr inbounds [16 x i8], [16 x i8]* @"str_10", i32 0, i32 0
  %".58" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", i8* %".57")
  %".60" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60")
  %".62" = load i8*, i8** @"primeiraFruta"
  %".63" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", i8* %".62")
  %".65" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_11", i32 0, i32 0
  %".66" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".67" = extractvalue {i64, i8**} %".66", 1
  %".68" = fptosi double 0x3ff0000000000000 to i64
  %".69" = getelementptr i8*, i8** %".67", i64 %".68"
  store i8* %".65", i8** %".69"
  %".71" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_12", i32 0, i32 0
  %".72" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".73" = extractvalue {i64, i8**} %".72", 1
  %".74" = fptosi double              0x0 to i64
  %".75" = getelementptr i8*, i8** %".73", i64 %".74"
  store i8* %".71", i8** %".75"
  %".77" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".78" = extractvalue {i64, i8**} %".77", 0
  %".79" = sitofp i64 %".78" to double
  store double %".79", double* @"totalNomes"
  %".81" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".82" = extractvalue {i64, i8**} %".81", 0
  %".83" = sitofp i64 %".82" to double
  store double %".83", double* @"totalFrutas"
  %".85" = getelementptr inbounds [25 x i8], [25 x i8]* @"str_13", i32 0, i32 0
  %".86" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".86", i8* %".85")
  %".88" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".88")
  %".90" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".91" = extractvalue {i64, i8**} %".90", 1
  %".92" = fptosi double 0x3ff0000000000000 to i64
  %".93" = getelementptr i8*, i8** %".91", i64 %".92"
  %".94" = load i8*, i8** %".93"
  %".95" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".95", i8* %".94")
  %".97" = getelementptr inbounds [27 x i8], [27 x i8]* @"str_14", i32 0, i32 0
  %".98" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".98", i8* %".97")
  %".100" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".100")
  %".102" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".103" = extractvalue {i64, i8**} %".102", 1
  %".104" = fptosi double              0x0 to i64
  %".105" = getelementptr i8*, i8** %".103", i64 %".104"
  %".106" = load i8*, i8** %".105"
  %".107" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".107", i8* %".106")
  %".109" = getelementptr inbounds [16 x i8], [16 x i8]* @"str_15", i32 0, i32 0
  %".110" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".111" = call i32 (i8*, ...) @"printf"(i8* %".110", i8* %".109")
  %".112" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".112")
  %".114" = load double, double* @"totalNomes"
  %".115" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".115", double %".114")
  %".117" = getelementptr inbounds [17 x i8], [17 x i8]* @"str_16", i32 0, i32 0
  %".118" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".118", i8* %".117")
  %".120" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120")
  %".122" = load double, double* @"totalFrutas"
  %".123" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".124" = call i32 (i8*, ...) @"printf"(i8* %".123", double %".122")
  ret i32 0
}

@"str_0" = internal constant [4 x i8] c"Ana\00"
@"str_1" = internal constant [4 x i8] c"Ana\00"
@"str_2" = internal constant [6 x i8] c"Bruno\00"
@"str_3" = internal constant [7 x i8] c"Carlos\00"
@"nomes" = internal global {i64, i8**} zeroinitializer
@"str_4" = internal constant [7 x i8] c"ma\c3\a7\c3\a3\00"
@"str_5" = internal constant [7 x i8] c"ma\c3\a7\c3\a3\00"
@"str_6" = internal constant [7 x i8] c"banana\00"
@"str_7" = internal constant [8 x i8] c"laranja\00"
@"str_8" = internal constant [4 x i8] c"uva\00"
@"frutas" = internal global {i64, i8**} zeroinitializer
@"segundoNome" = internal global i8* null
@"primeiraFruta" = internal global i8* null
@"str_9" = internal constant [14 x i8] c"Segundo nome:\00"
@"str_10" = internal constant [16 x i8] c"Primeira fruta:\00"
@"str_11" = internal constant [8 x i8] c"Beatriz\00"
@"str_12" = internal constant [8 x i8] c"abacaxi\00"
@"totalNomes" = internal global double              0x0
@"totalFrutas" = internal global double              0x0
@"str_13" = internal constant [25 x i8] c"Segundo nome atualizado:\00"
@"str_14" = internal constant [27 x i8] c"Primeira fruta atualizada:\00"
@"str_15" = internal constant [16 x i8] c"Total de nomes:\00"
@"str_16" = internal constant [17 x i8] c"Total de frutas:\00"