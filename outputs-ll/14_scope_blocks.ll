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
  %".2" = load double, double* @"x"
  %".3" = fcmp ogt double %".2", 0x4014000000000000
  br i1 %".3", label %"if_then_0", label %"if_else_1"
if_then_0:
  store double 0x4034000000000000, double* %"y"
  %".6" = load double, double* @"x"
  %".7" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", double %".6")
  %".9" = load double, double* %"y"
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".9")
  br label %"if_merge_2"
if_else_1:
  br label %"if_merge_2"
if_merge_2:
  %".14" = load double, double* @"x"
  %".15" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", double %".14")
  %".17" = load double, double* @"y"
  %".18" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".17")
  ret i32 0
}

@"x" = internal global double 0x4024000000000000
@"y" = internal global double 0x403e000000000000