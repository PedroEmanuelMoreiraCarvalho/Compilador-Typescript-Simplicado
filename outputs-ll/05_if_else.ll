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
  %"idade" = alloca double
  %"nota" = alloca double
  store double 0x401e000000000000, double* %"nota"
  %".3" = load double, double* %"nota"
  %".4" = fcmp oge double %".3", 0x401c000000000000
  br i1 %".4", label %"if_then_0", label %"if_else_1"
if_then_0:
  %".6" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".7" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i8* %".6")
  br label %"if_merge_2"
if_else_1:
  %".10" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_4", i32 0, i32 0
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".10")
  br label %"if_merge_2"
if_merge_2:
  store double 0x4032000000000000, double* %"idade"
  %".15" = load double, double* %"idade"
  %".16" = fcmp oge double %".15", 0x4032000000000000
  br i1 %".16", label %"if_then_5", label %"if_else_6"
if_then_5:
  %".18" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_8", i32 0, i32 0
  %".19" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i8* %".18")
  br label %"if_merge_7"
if_else_6:
  br label %"if_merge_7"
if_merge_7:
  ret i32 0
}

@"str_3" = internal constant [10 x i8] c"Aprovado!\00"
@"str_4" = internal constant [11 x i8] c"Reprovado!\00"
@"str_8" = internal constant [15 x i8] c"Maior de idade\00"