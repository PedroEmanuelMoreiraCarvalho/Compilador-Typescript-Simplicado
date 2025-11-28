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
  %"j" = alloca double
  store double              0x0, double* @"i"
  br label %"for_cond_0"
for_cond_0:
  %".4" = load double, double* @"i"
  %".5" = fcmp olt double %".4", 0x4014000000000000
  br i1 %".5", label %"for_body_1", label %"for_end_3"
for_body_1:
  %".7" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_4", i32 0, i32 0
  %".8" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  %".12" = load double, double* @"i"
  %".13" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", double %".12")
  br label %"for_update_2"
for_update_2:
  %".16" = load double, double* @"i"
  %".17" = fadd double %".16", 0x3ff0000000000000
  store double %".17", double* @"i"
  br label %"for_cond_0"
for_end_3:
  store double 0x4024000000000000, double* %"j"
  br label %"for_cond_5"
for_cond_5:
  %".22" = load double, double* %"j"
  %".23" = fcmp ogt double %".22",              0x0
  br i1 %".23", label %"for_body_6", label %"for_end_8"
for_body_6:
  %".25" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_9", i32 0, i32 0
  %".26" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i8* %".25")
  %".28" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28")
  %".30" = load double, double* %"j"
  %".31" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".30")
  br label %"for_update_7"
for_update_7:
  %".34" = load double, double* %"j"
  %".35" = fsub double %".34", 0x3ff0000000000000
  store double %".35", double* %"j"
  br label %"for_cond_5"
for_end_8:
  ret i32 0
}

@"i" = internal global double              0x0
@"str_4" = internal constant [3 x i8] c"i:\00"
@"str_9" = internal constant [3 x i8] c"j:\00"