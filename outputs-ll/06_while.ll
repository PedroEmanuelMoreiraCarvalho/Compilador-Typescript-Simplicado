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
  br label %"while_cond_0"
while_cond_0:
  %".3" = load double, double* @"contador"
  %".4" = fcmp olt double %".3", 0x4014000000000000
  br i1 %".4", label %"while_body_1", label %"while_end_2"
while_body_1:
  %".6" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".7" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".6")
  %".9" = load double, double* @"contador"
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".9")
  %".12" = load double, double* @"contador"
  %".13" = fadd double %".12", 0x3ff0000000000000
  store double %".13", double* @"contador"
  br label %"while_cond_0"
while_end_2:
  %".16" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_4", i32 0, i32 0
  %".17" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i8* %".16")
  ret i32 0
}

@"contador" = internal global double              0x0
@"str_3" = internal constant [10 x i8] c"Contador:\00"
@"str_4" = internal constant [12 x i8] c"Fim do loop\00"