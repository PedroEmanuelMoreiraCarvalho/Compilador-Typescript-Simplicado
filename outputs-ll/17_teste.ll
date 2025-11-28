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
  %".2" = call double @"teste"(double 0x4014000000000000)
  store double %".2", double* @"valor"
  %".4" = load double, double* @"valor"
  %".5" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".4")
  %".7" = load double, double* @"lobal"
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".7")
  ret i32 0
}

@"lobal" = internal global double 0x4059000000000000
define double @"teste"(double %".1")
{
entry:
  %"cinco" = alloca double
  %"resultado" = alloca double
  %"local" = alloca double
  %"parametro" = alloca double
  store double %".1", double* %"parametro"
  store double 0x4024000000000000, double* %"local"
  %".5" = load double, double* @"lobal"
  %".6" = load double, double* %"local"
  %".7" = fadd double %".5", %".6"
  %".8" = load double, double* %"parametro"
  %".9" = fadd double %".7", %".8"
  store double %".9", double* %"resultado"
  %".11" = load double, double* @"lobal"
  %".12" = fcmp ogt double %".11", 0x4049000000000000
  br i1 %".12", label %"if_then_0", label %"if_else_1"
if_then_0:
  store double 0x4014000000000000, double* %"cinco"
  %".15" = load double, double* @"lobal"
  %".16" = fcmp olt double %".15", 0x4059000000000000
  br i1 %".16", label %"if_then_3", label %"if_else_4"
if_else_1:
  br label %"if_merge_2"
if_merge_2:
  %".30" = load double, double* %"resultado"
  ret double %".30"
if_then_3:
  %".18" = load double, double* %"resultado"
  %".19" = load double, double* %"cinco"
  %".20" = fadd double %".18", %".19"
  store double %".20", double* %"resultado"
  br label %"if_merge_5"
if_else_4:
  br label %"if_merge_5"
if_merge_5:
  %".24" = load double, double* %"resultado"
  %".25" = load double, double* %"cinco"
  %".26" = fadd double %".24", %".25"
  store double %".26", double* %"resultado"
  br label %"if_merge_2"
}

@"valor" = internal global double              0x0