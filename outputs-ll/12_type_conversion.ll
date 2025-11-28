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
  store i8* %".2", i8** @"texto"
  %".4" = load i8*, i8** @"texto"
  %".5" = call i32 @"atoi"(i8* %".4")
  %".6" = sitofp i32 %".5" to double
  store double %".6", double* @"inteiro"
  %".8" = getelementptr inbounds [5 x i8], [5 x i8]* @"str_1", i32 0, i32 0
  %".9" = call double @"atof"(i8* %".8")
  store double %".9", double* @"flutuante"
  %".11" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_2", i32 0, i32 0
  %".12" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i8* %".11")
  %".14" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = load i8*, i8** @"texto"
  %".17" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i8* %".16")
  %".19" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_3", i32 0, i32 0
  %".20" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i8* %".19")
  %".22" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22")
  %".24" = load double, double* @"inteiro"
  %".25" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", double %".24")
  %".27" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_4", i32 0, i32 0
  %".28" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", i8* %".27")
  %".30" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30")
  %".32" = load double, double* @"flutuante"
  %".33" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", double %".32")
  %".35" = load double, double* @"inteiro"
  %".36" = load double, double* @"flutuante"
  %".37" = fadd double %".35", %".36"
  store double %".37", double* @"soma"
  %".39" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_5", i32 0, i32 0
  %".40" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40", i8* %".39")
  %".42" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42")
  %".44" = load double, double* @"soma"
  %".45" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", double %".44")
  ret i32 0
}

@"str_0" = internal constant [4 x i8] c"123\00"
@"texto" = internal global i8* null
@"inteiro" = internal global double              0x0
@"str_1" = internal constant [5 x i8] c"3.14\00"
@"flutuante" = internal global double              0x0
@"str_2" = internal constant [7 x i8] c"Texto:\00"
@"str_3" = internal constant [9 x i8] c"Inteiro:\00"
@"str_4" = internal constant [11 x i8] c"Flutuante:\00"
@"soma" = internal global double              0x0
@"str_5" = internal constant [6 x i8] c"Soma:\00"