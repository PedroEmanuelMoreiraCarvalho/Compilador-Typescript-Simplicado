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
  br label %"while_cond_0"
while_cond_0:
  %".3" = load double, double* @"contador"
  %".4" = fcmp olt double %".3", 0x4014000000000000
  br i1 %".4", label %"while_body_1", label %"while_end_2"
while_body_1:
  %".6" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".7" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".6")
  %".9" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9")
  %".11" = load double, double* @"contador"
  %".12" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", double %".11")
  %".14" = load double, double* @"contador"
  %".15" = fadd double %".14", 0x3ff0000000000000
  store double %".15", double* @"contador"
  br label %"while_cond_0"
while_end_2:
  %".18" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_4", i32 0, i32 0
  %".19" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i8* %".18")
  ret i32 0
}

@"contador" = internal global double              0x0
@"str_3" = internal constant [10 x i8] c"Contador:\00"
@"str_4" = internal constant [12 x i8] c"Fim do loop\00"