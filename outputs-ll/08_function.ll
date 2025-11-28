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
  %".2" = call double @"soma"(double 0x4024000000000000, double 0x4034000000000000)
  store double %".2", double* @"x"
  %".4" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_0", i32 0, i32 0
  %".5" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %".4")
  %".7" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  %".9" = load double, double* @"x"
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".9")
  ret i32 0
}

define double @"soma"(double %".1", double %".2")
{
entry:
  %"resultado" = alloca double
  %"b" = alloca double
  %"a" = alloca double
  store double %".1", double* %"a"
  store double %".2", double* %"b"
  %".6" = load double, double* %"a"
  %".7" = load double, double* %"b"
  %".8" = fadd double %".6", %".7"
  store double %".8", double* %"resultado"
  %".10" = load double, double* %"resultado"
  ret double %".10"
}

@"x" = internal global double              0x0
@"str_0" = internal constant [11 x i8] c"Resultado:\00"