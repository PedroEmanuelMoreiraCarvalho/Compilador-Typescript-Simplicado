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
  %".2" = load double, double* @"x"
  %".3" = fcmp ogt double %".2", 0x4014000000000000
  br i1 %".3", label %"if_then_0", label %"if_else_1"
if_then_0:
  %".5" = load double, double* @"x"
  %".6" = fcmp olt double %".5", 0x402e000000000000
  br i1 %".6", label %"if_then_3", label %"if_else_4"
if_else_1:
  br label %"if_merge_2"
if_merge_2:
  %".23" = load double, double* @"x"
  %".24" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", double %".23")
  ret i32 0
if_then_3:
  %".8" = load double, double* @"x"
  %".9" = fcmp olt double %".8", 0x4024000000000000
  br i1 %".9", label %"if_then_6", label %"if_else_7"
if_else_4:
  br label %"if_merge_5"
if_merge_5:
  br label %"if_merge_2"
if_then_6:
  %".11" = load double, double* @"x"
  %".12" = fadd double %".11", 0x3ff0000000000000
  store double %".12", double* @"x"
  br label %"if_merge_8"
if_else_7:
  %".15" = load double, double* @"x"
  %".16" = fsub double %".15", 0x3ff0000000000000
  store double %".16", double* @"x"
  br label %"if_merge_8"
if_merge_8:
  br label %"if_merge_5"
}

@"x" = internal global double 0x4024000000000000