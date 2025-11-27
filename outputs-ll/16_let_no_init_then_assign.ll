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
  %"y" = alloca double
  %"x" = alloca double
  store double 0x4024000000000000, double* %"x"
  %".3" = load double, double* %"x"
  %".4" = fadd double %".3", 0x4014000000000000
  store double %".4", double* %"y"
  %".6" = load double, double* %"y"
  %".7" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", double %".6")
  ret i32 0
}
