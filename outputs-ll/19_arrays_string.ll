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
  %".50" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", i8* %".49")
  %".52" = load i8*, i8** @"segundoNome"
  %".53" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".53", i8* %".52")
  %".55" = getelementptr inbounds [16 x i8], [16 x i8]* @"str_10", i32 0, i32 0
  %".56" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".56", i8* %".55")
  %".58" = load i8*, i8** @"primeiraFruta"
  %".59" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59", i8* %".58")
  %".61" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_11", i32 0, i32 0
  %".62" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".63" = extractvalue {i64, i8**} %".62", 1
  %".64" = fptosi double 0x3ff0000000000000 to i64
  %".65" = getelementptr i8*, i8** %".63", i64 %".64"
  store i8* %".61", i8** %".65"
  %".67" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_12", i32 0, i32 0
  %".68" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".69" = extractvalue {i64, i8**} %".68", 1
  %".70" = fptosi double              0x0 to i64
  %".71" = getelementptr i8*, i8** %".69", i64 %".70"
  store i8* %".67", i8** %".71"
  %".73" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".74" = extractvalue {i64, i8**} %".73", 0
  %".75" = sitofp i64 %".74" to double
  store double %".75", double* @"totalNomes"
  %".77" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".78" = extractvalue {i64, i8**} %".77", 0
  %".79" = sitofp i64 %".78" to double
  store double %".79", double* @"totalFrutas"
  %".81" = getelementptr inbounds [25 x i8], [25 x i8]* @"str_13", i32 0, i32 0
  %".82" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82", i8* %".81")
  %".84" = load {i64, i8**}, {i64, i8**}* @"nomes"
  %".85" = extractvalue {i64, i8**} %".84", 1
  %".86" = fptosi double 0x3ff0000000000000 to i64
  %".87" = getelementptr i8*, i8** %".85", i64 %".86"
  %".88" = load i8*, i8** %".87"
  %".89" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".89", i8* %".88")
  %".91" = getelementptr inbounds [27 x i8], [27 x i8]* @"str_14", i32 0, i32 0
  %".92" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".92", i8* %".91")
  %".94" = load {i64, i8**}, {i64, i8**}* @"frutas"
  %".95" = extractvalue {i64, i8**} %".94", 1
  %".96" = fptosi double              0x0 to i64
  %".97" = getelementptr i8*, i8** %".95", i64 %".96"
  %".98" = load i8*, i8** %".97"
  %".99" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".99", i8* %".98")
  %".101" = getelementptr inbounds [16 x i8], [16 x i8]* @"str_15", i32 0, i32 0
  %".102" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".102", i8* %".101")
  %".104" = load double, double* @"totalNomes"
  %".105" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".105", double %".104")
  %".107" = getelementptr inbounds [17 x i8], [17 x i8]* @"str_16", i32 0, i32 0
  %".108" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", i8* %".107")
  %".110" = load double, double* @"totalFrutas"
  %".111" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".111", double %".110")
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