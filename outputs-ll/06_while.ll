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
  %"contador" = alloca double
  store double              0x0, double* %"contador"
  br label %"while_cond_0"
while_cond_0:
  %".4" = load double, double* %"contador"
  %".5" = fcmp olt double %".4", 0x4014000000000000
  br i1 %".5", label %"while_body_1", label %"while_end_2"
while_body_1:
  %".7" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = load double, double* %"contador"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", double %".10")
  %".13" = load double, double* %"contador"
  %".14" = fadd double %".13", 0x3ff0000000000000
  store double %".14", double* %"contador"
  br label %"while_cond_0"
while_end_2:
  %".17" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_4", i32 0, i32 0
  %".18" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i8* %".17")
  ret i32 0
}

@"str_3" = internal constant [10 x i8] c"Contador:\00"
@"str_4" = internal constant [12 x i8] c"Fim do loop\00"