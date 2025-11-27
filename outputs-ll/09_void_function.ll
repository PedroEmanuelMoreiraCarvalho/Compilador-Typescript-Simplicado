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
  %".2" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_2", i32 0, i32 0
  call void @"exibirMensagem"(i8* %".2")
  call void @"processar"()
  ret i32 0
}

define void @"exibirMensagem"(i8* %".1")
{
entry:
  %"texto" = alloca i8*
  store i8* %".1", i8** %"texto"
  %".4" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_0", i32 0, i32 0
  %".5" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %".4")
  %".7" = load i8*, i8** %"texto"
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  ret void
}

@"str_0" = internal constant [10 x i8] c"Mensagem:\00"
define void @"processar"()
{
entry:
  %"temp" = alloca double
  store double 0x4045000000000000, double* %"temp"
  %".3" = getelementptr inbounds [15 x i8], [15 x i8]* @"str_1", i32 0, i32 0
  %".4" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %".3")
  ret void
}

@"str_1" = internal constant [15 x i8] c"Processando...\00"
@"str_2" = internal constant [6 x i8] c"Ol\c3\a1!\00"