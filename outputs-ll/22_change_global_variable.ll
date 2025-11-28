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
  %".2" = getelementptr inbounds [23 x i8], [23 x i8]* @"str_3", i32 0, i32 0
  %".3" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".2")
  %".5" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5")
  %".7" = load i1, i1* @"flag"
  %".8" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".9" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".10" = select  i1 %".7", i8* %".8", i8* %".9"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".10")
  call void @"alterarFlag"()
  %".14" = getelementptr inbounds [33 x i8], [33 x i8]* @"str_4", i32 0, i32 0
  %".15" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i8* %".14")
  %".17" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17")
  %".19" = load i1, i1* @"flag"
  %".20" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".21" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".22" = select  i1 %".19", i8* %".20", i8* %".21"
  %".23" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i8* %".22")
  call void @"alterarFlag"()
  %".26" = getelementptr inbounds [41 x i8], [41 x i8]* @"str_5", i32 0, i32 0
  %".27" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i8* %".26")
  %".29" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29")
  %".31" = load i1, i1* @"flag"
  %".32" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".33" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".34" = select  i1 %".31", i8* %".32", i8* %".33"
  %".35" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35", i8* %".34")
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