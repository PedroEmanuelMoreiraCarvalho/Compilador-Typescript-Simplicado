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
  %".2" = call double @"sqrt"(double 0x4030000000000000)
  store double %".2", double* @"raiz"
  %".4" = call double @"pow"(double 0x4000000000000000, double 0x4008000000000000)
  store double %".4", double* @"potencia"
  %".6" = getelementptr inbounds [21 x i8], [21 x i8]* @"str_0", i32 0, i32 0
  %".7" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".6")
  %".9" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9")
  %".11" = load double, double* @"raiz"
  %".12" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", double %".11")
  %".14" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_1", i32 0, i32 0
  %".15" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i8* %".14")
  %".17" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17")
  %".19" = load double, double* @"potencia"
  %".20" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".19")
  %".22" = call double @"sqrt"(double 0x4039000000000000)
  %".23" = call double @"pow"(double 0x4008000000000000, double 0x4000000000000000)
  %".24" = fadd double %".22", %".23"
  store double %".24", double* @"resultado"
  %".26" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_2", i32 0, i32 0
  %".27" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i8* %".26")
  %".29" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29")
  %".31" = load double, double* @"resultado"
  %".32" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32", double %".31")
  ret i32 0
}

@"raiz" = internal global double              0x0
@"potencia" = internal global double              0x0
@"str_0" = internal constant [21 x i8] c"Raiz quadrada de 16:\00"
@"str_1" = internal constant [15 x i8] c"2 elevado a 3:\00"
@"resultado" = internal global double              0x0
@"str_2" = internal constant [11 x i8] c"Resultado:\00"