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
  store i8* %".2", i8** @"texto"
  %".4" = load i8*, i8** @"texto"
  %".5" = call i32 @"atoi"(i8* %".4")
  %".6" = sitofp i32 %".5" to double
  store double %".6", double* @"inteiro"
  %".8" = getelementptr inbounds [5 x i8], [5 x i8]* @"str_1", i32 0, i32 0
  %".9" = call double @"atof"(i8* %".8")
  store double %".9", double* @"flutuante"
  %".11" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_2", i32 0, i32 0
  %".12" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i8* %".11")
  %".14" = load i8*, i8** @"texto"
  %".15" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i8* %".14")
  %".17" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_3", i32 0, i32 0
  %".18" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i8* %".17")
  %".20" = load double, double* @"inteiro"
  %".21" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", double %".20")
  %".23" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_4", i32 0, i32 0
  %".24" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i8* %".23")
  %".26" = load double, double* @"flutuante"
  %".27" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".26")
  %".29" = load double, double* @"inteiro"
  %".30" = load double, double* @"flutuante"
  %".31" = fadd double %".29", %".30"
  store double %".31", double* @"soma"
  %".33" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_5", i32 0, i32 0
  %".34" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8* %".33")
  %".36" = load double, double* @"soma"
  %".37" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37", double %".36")
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