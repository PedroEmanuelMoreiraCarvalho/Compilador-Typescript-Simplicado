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
  %"ativo" = alloca i1
  %"nome" = alloca i8*
  %"PI" = alloca double
  %"idade" = alloca double
  store double 0x4039000000000000, double* %"idade"
  store double 0x400921f9f01b866e, double* %"PI"
  %".4" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_0", i32 0, i32 0
  store i8* %".4", i8** %"nome"
  store i1 1, i1* %"ativo"
  %".7" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_1", i32 0, i32 0
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = load i8*, i8** %"nome"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i8* %".10")
  %".13" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_2", i32 0, i32 0
  %".14" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i8* %".13")
  %".16" = load double, double* %"idade"
  %".17" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17", double %".16")
  %".19" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_3", i32 0, i32 0
  %".20" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i8* %".19")
  %".22" = load double, double* %"PI"
  %".23" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", double %".22")
  ret i32 0
}

@"str_0" = internal constant [6 x i8] c"Maria\00"
@"str_1" = internal constant [6 x i8] c"Nome:\00"
@"str_2" = internal constant [7 x i8] c"Idade:\00"
@"str_3" = internal constant [4 x i8] c"Pi:\00"