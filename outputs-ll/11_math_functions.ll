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
  %".2" = call double @"sqrt"(double 0x4030000000000000)
  store double %".2", double* @"raiz"
  %".4" = call double @"pow"(double 0x4000000000000000, double 0x4008000000000000)
  store double %".4", double* @"potencia"
  %".6" = getelementptr inbounds [21 x i8], [21 x i8]* @"str_0", i32 0, i32 0
  %".7" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".6")
  %".9" = load double, double* @"raiz"
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".9")
  %".12" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_1", i32 0, i32 0
  %".13" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i8* %".12")
  %".15" = load double, double* @"potencia"
  %".16" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", double %".15")
  %".18" = call double @"sqrt"(double 0x4039000000000000)
  %".19" = call double @"pow"(double 0x4008000000000000, double 0x4000000000000000)
  %".20" = fadd double %".18", %".19"
  store double %".20", double* @"resultado"
  %".22" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_2", i32 0, i32 0
  %".23" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i8* %".22")
  %".25" = load double, double* @"resultado"
  %".26" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", double %".25")
  ret i32 0
}

@"raiz" = internal global double              0x0
@"potencia" = internal global double              0x0
@"str_0" = internal constant [21 x i8] c"Raiz quadrada de 16:\00"
@"str_1" = internal constant [15 x i8] c"2 elevado a 3:\00"
@"resultado" = internal global double              0x0
@"str_2" = internal constant [11 x i8] c"Resultado:\00"