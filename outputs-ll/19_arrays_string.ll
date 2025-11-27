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
  %"totalFrutas" = alloca double
  %"totalNomes" = alloca double
  %"segundaFruta" = alloca i8*
  %"primeiroNome" = alloca i8*
  %"frutas" = alloca {i64, i8**}
  %"nomes" = alloca {i64, i8**}
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
  store {i64, i8**} %".16", {i64, i8**}* %"nomes"
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
  store {i64, i8**} %".35", {i64, i8**}* %"frutas"
  %".37" = load {i64, i8**}, {i64, i8**}* %"nomes"
  %".38" = extractvalue {i64, i8**} %".37", 1
  %".39" = fptosi double              0x0 to i64
  %".40" = getelementptr i8*, i8** %".38", i64 %".39"
  %".41" = load i8*, i8** %".40"
  store i8* %".41", i8** %"primeiroNome"
  %".43" = load {i64, i8**}, {i64, i8**}* %"frutas"
  %".44" = extractvalue {i64, i8**} %".43", 1
  %".45" = fptosi double 0x3ff0000000000000 to i64
  %".46" = getelementptr i8*, i8** %".44", i64 %".45"
  %".47" = load i8*, i8** %".46"
  store i8* %".47", i8** %"segundaFruta"
  %".49" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_9", i32 0, i32 0
  %".50" = load {i64, i8**}, {i64, i8**}* %"nomes"
  %".51" = extractvalue {i64, i8**} %".50", 1
  %".52" = fptosi double 0x3ff0000000000000 to i64
  %".53" = getelementptr i8*, i8** %".51", i64 %".52"
  store i8* %".49", i8** %".53"
  %".55" = getelementptr inbounds [8 x i8], [8 x i8]* @"str_10", i32 0, i32 0
  %".56" = load {i64, i8**}, {i64, i8**}* %"frutas"
  %".57" = extractvalue {i64, i8**} %".56", 1
  %".58" = fptosi double              0x0 to i64
  %".59" = getelementptr i8*, i8** %".57", i64 %".58"
  store i8* %".55", i8** %".59"
  %".61" = load {i64, i8**}, {i64, i8**}* %"nomes"
  %".62" = extractvalue {i64, i8**} %".61", 0
  %".63" = sitofp i64 %".62" to double
  store double %".63", double* %"totalNomes"
  %".65" = load {i64, i8**}, {i64, i8**}* %"frutas"
  %".66" = extractvalue {i64, i8**} %".65", 0
  %".67" = sitofp i64 %".66" to double
  store double %".67", double* %"totalFrutas"
  %".69" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_11", i32 0, i32 0
  %".70" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70", i8* %".69")
  %".72" = load i8*, i8** %"primeiroNome"
  %".73" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73", i8* %".72")
  %".75" = getelementptr inbounds [16 x i8], [16 x i8]* @"str_12", i32 0, i32 0
  %".76" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".76", i8* %".75")
  %".78" = load double, double* %"totalNomes"
  %".79" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".79", double %".78")
  %".81" = getelementptr inbounds [17 x i8], [17 x i8]* @"str_13", i32 0, i32 0
  %".82" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82", i8* %".81")
  %".84" = load double, double* %"totalFrutas"
  %".85" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".85", double %".84")
  ret i32 0
}

@"str_0" = internal constant [4 x i8] c"Ana\00"
@"str_1" = internal constant [4 x i8] c"Ana\00"
@"str_2" = internal constant [6 x i8] c"Bruno\00"
@"str_3" = internal constant [7 x i8] c"Carlos\00"
@"str_4" = internal constant [7 x i8] c"ma\c3\a7\c3\a3\00"
@"str_5" = internal constant [7 x i8] c"ma\c3\a7\c3\a3\00"
@"str_6" = internal constant [7 x i8] c"banana\00"
@"str_7" = internal constant [8 x i8] c"laranja\00"
@"str_8" = internal constant [4 x i8] c"uva\00"
@"str_9" = internal constant [8 x i8] c"Beatriz\00"
@"str_10" = internal constant [8 x i8] c"abacaxi\00"
@"str_11" = internal constant [15 x i8] c"Primeiro nome:\00"
@"str_12" = internal constant [16 x i8] c"Total de nomes:\00"
@"str_13" = internal constant [17 x i8] c"Total de frutas:\00"