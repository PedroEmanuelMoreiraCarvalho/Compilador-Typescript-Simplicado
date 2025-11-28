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
  %".2" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_0", i32 0, i32 0
  store i8* %".2", i8** @"nome"
  %".4" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_1", i32 0, i32 0
  %".5" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %".4")
  %".7" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  %".9" = load i8*, i8** @"nome"
  %".10" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i8* %".9")
  %".12" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_2", i32 0, i32 0
  %".13" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i8* %".12")
  %".15" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  %".17" = load double, double* @"idade"
  %".18" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".17")
  %".20" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_3", i32 0, i32 0
  %".21" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i8* %".20")
  %".23" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  %".25" = load double, double* @"PI"
  %".26" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", double %".25")
  ret i32 0
}

@"idade" = internal global double 0x4039000000000000
@"PI" = internal global double 0x400921f9f01b866e
@"str_0" = internal constant [6 x i8] c"Maria\00"
@"nome" = internal global i8* null
@"ativo" = internal global i1 1
@"str_1" = internal constant [6 x i8] c"Nome:\00"
@"str_2" = internal constant [7 x i8] c"Idade:\00"
@"str_3" = internal constant [4 x i8] c"Pi:\00"