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
  %"x" = alloca double
  store double 0x4024000000000000, double* %"x"
  %".3" = load double, double* %"x"
  %".4" = fcmp ogt double %".3", 0x4014000000000000
  br i1 %".4", label %"if_then_0", label %"if_else_1"
if_then_0:
  %".6" = load double, double* %"x"
  %".7" = fcmp olt double %".6", 0x402e000000000000
  br i1 %".7", label %"if_then_3", label %"if_else_4"
if_else_1:
  br label %"if_merge_2"
if_merge_2:
  ret i32 0
if_then_3:
  %".9" = load double, double* %"x"
  %".10" = fcmp olt double %".9", 0x4024000000000000
  br i1 %".10", label %"if_then_6", label %"if_else_7"
if_else_4:
  br label %"if_merge_5"
if_merge_5:
  br label %"if_merge_2"
if_then_6:
  %".12" = load double, double* %"x"
  %".13" = fadd double %".12", 0x3ff0000000000000
  store double %".13", double* %"x"
  br label %"if_merge_8"
if_else_7:
  %".16" = load double, double* %"x"
  %".17" = fsub double %".16", 0x3ff0000000000000
  store double %".17", double* %"x"
  br label %"if_merge_8"
if_merge_8:
  br label %"if_merge_5"
}
