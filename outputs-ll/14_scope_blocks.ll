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
  %"y.1" = alloca double
  %"y" = alloca double
  %"x" = alloca double
  store double 0x4024000000000000, double* %"x"
  %".3" = load double, double* %"x"
  %".4" = fcmp ogt double %".3", 0x4014000000000000
  br i1 %".4", label %"if_then_0", label %"if_else_1"
if_then_0:
  store double 0x4034000000000000, double* %"y"
  %".7" = load double, double* %"x"
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".7")
  %".10" = load double, double* %"y"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", double %".10")
  br label %"if_merge_2"
if_else_1:
  br label %"if_merge_2"
if_merge_2:
  store double 0x403e000000000000, double* %"y.1"
  %".16" = load double, double* %"x"
  %".17" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", double %".16")
  %".19" = load double, double* %"y.1"
  %".20" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".19")
  ret i32 0
}
