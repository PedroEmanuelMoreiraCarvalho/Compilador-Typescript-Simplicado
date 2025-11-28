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
  %".2" = load double, double* @"nota"
  %".3" = fcmp oge double %".2", 0x401c000000000000
  br i1 %".3", label %"if_then_0", label %"if_else_1"
if_then_0:
  %".5" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".6" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8* %".5")
  br label %"if_merge_2"
if_else_1:
  %".9" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_4", i32 0, i32 0
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i8* %".9")
  br label %"if_merge_2"
if_merge_2:
  %".13" = load double, double* @"idade"
  %".14" = fcmp oge double %".13", 0x4032000000000000
  br i1 %".14", label %"if_then_5", label %"if_else_6"
if_then_5:
  %".16" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_8", i32 0, i32 0
  %".17" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", i8* %".16")
  br label %"if_merge_7"
if_else_6:
  br label %"if_merge_7"
if_merge_7:
  ret i32 0
}

@"nota" = internal global double 0x401e000000000000
@"str_3" = internal constant [10 x i8] c"Aprovado!\00"
@"str_4" = internal constant [11 x i8] c"Reprovado!\00"
@"idade" = internal global double 0x4032000000000000
@"str_8" = internal constant [15 x i8] c"Maior de idade\00"