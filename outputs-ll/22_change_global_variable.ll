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
  %".2" = getelementptr inbounds [23 x i8], [23 x i8]* @"str_3", i32 0, i32 0
  %".3" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %".5" = load i1, i1* @"flag"
  %".6" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".7" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".8" = select  i1 %".5", i8* %".6", i8* %".7"
  %".9" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i8* %".8")
  call void @"alterarFlag"()
  %".12" = getelementptr inbounds [33 x i8], [33 x i8]* @"str_4", i32 0, i32 0
  %".13" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i8* %".12")
  %".15" = load i1, i1* @"flag"
  %".16" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".17" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".18" = select  i1 %".15", i8* %".16", i8* %".17"
  %".19" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i8* %".18")
  call void @"alterarFlag"()
  %".22" = getelementptr inbounds [41 x i8], [41 x i8]* @"str_5", i32 0, i32 0
  %".23" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i8* %".22")
  %".25" = load i1, i1* @"flag"
  %".26" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".27" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".28" = select  i1 %".25", i8* %".26", i8* %".27"
  %".29" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i8* %".28")
  ret i32 0
}

@"flag" = internal global i1 1
define void @"alterarFlag"()
{
entry:
  %".2" = load i1, i1* @"flag"
  br i1 %".2", label %"if_then_0", label %"if_else_1"
if_then_0:
  store i1 0, i1* @"flag"
  br label %"if_merge_2"
if_else_1:
  store i1 1, i1* @"flag"
  br label %"if_merge_2"
if_merge_2:
  ret void
}

@"str_3" = internal constant [23 x i8] c"Valor inicial da flag:\00"
@"str_4" = internal constant [33 x i8] c"Valor da flag ap\c3\b3s altera\c3\a7\c3\a3o:\00"
@"str_5" = internal constant [41 x i8] c"Valor da flag ap\c3\b3s segunda altera\c3\a7\c3\a3o:\00"