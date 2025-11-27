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
  %"tamanho" = alloca double
  %"primeiro" = alloca double
  %"nomes" = alloca {i64, i8**}
  %"numeros" = alloca {i64, double*}
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
  store {i64, double*} %".16", {i64, double*}* %"numeros"
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
  store {i64, i8**} %".32", {i64, i8**}* %"nomes"
  %".34" = load {i64, double*}, {i64, double*}* %"numeros"
  %".35" = extractvalue {i64, double*} %".34", 1
  %".36" = fptosi double              0x0 to i64
  %".37" = getelementptr double, double* %".35", i64 %".36"
  %".38" = load double, double* %".37"
  store double %".38", double* %"primeiro"
  %".40" = load {i64, double*}, {i64, double*}* %"numeros"
  %".41" = extractvalue {i64, double*} %".40", 0
  %".42" = sitofp i64 %".41" to double
  store double %".42", double* %"tamanho"
  %".44" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_4", i32 0, i32 0
  %".45" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", i8* %".44")
  %".47" = load double, double* %"primeiro"
  %".48" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", double %".47")
  %".50" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_5", i32 0, i32 0
  %".51" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".51", i8* %".50")
  %".53" = load double, double* %"tamanho"
  %".54" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54", double %".53")
  %".56" = load {i64, double*}, {i64, double*}* %"numeros"
  %".57" = extractvalue {i64, double*} %".56", 1
  %".58" = fptosi double 0x4000000000000000 to i64
  %".59" = getelementptr double, double* %".57", i64 %".58"
  store double 0x4024000000000000, double* %".59"
  %".61" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_6", i32 0, i32 0
  %".62" = load {i64, i8**}, {i64, i8**}* %"nomes"
  %".63" = extractvalue {i64, i8**} %".62", 1
  %".64" = fptosi double              0x0 to i64
  %".65" = getelementptr i8*, i8** %".63", i64 %".64"
  store i8* %".61", i8** %".65"
  ret i32 0
}

@"str_0" = internal constant [4 x i8] c"Ana\00"
@"str_1" = internal constant [4 x i8] c"Ana\00"
@"str_2" = internal constant [6 x i8] c"Bruno\00"
@"str_3" = internal constant [7 x i8] c"Carlos\00"
@"str_4" = internal constant [10 x i8] c"Primeiro:\00"
@"str_5" = internal constant [9 x i8] c"Tamanho:\00"
@"str_6" = internal constant [6 x i8] c"Alice\00"