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
  %"j" = alloca double
  store double              0x0, double* @"i"
  br label %"for_cond_0"
for_cond_0:
  %".4" = load double, double* @"i"
  %".5" = fcmp olt double %".4", 0x4014000000000000
  br i1 %".5", label %"for_body_1", label %"for_end_3"
for_body_1:
  %".7" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_4", i32 0, i32 0
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = load double, double* @"i"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", double %".10")
  br label %"for_update_2"
for_update_2:
  %".14" = load double, double* @"i"
  %".15" = fadd double %".14", 0x3ff0000000000000
  store double %".15", double* @"i"
  br label %"for_cond_0"
for_end_3:
  store double 0x4024000000000000, double* %"j"
  br label %"for_cond_5"
for_cond_5:
  %".20" = load double, double* %"j"
  %".21" = fcmp ogt double %".20",              0x0
  br i1 %".21", label %"for_body_6", label %"for_end_8"
for_body_6:
  %".23" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_9", i32 0, i32 0
  %".24" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i8* %".23")
  %".26" = load double, double* %"j"
  %".27" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".26")
  br label %"for_update_7"
for_update_7:
  %".30" = load double, double* %"j"
  %".31" = fsub double %".30", 0x3ff0000000000000
  store double %".31", double* %"j"
  br label %"for_cond_5"
for_end_8:
  ret i32 0
}

@"i" = internal global double              0x0
@"str_4" = internal constant [3 x i8] c"i:\00"
@"str_9" = internal constant [3 x i8] c"j:\00"