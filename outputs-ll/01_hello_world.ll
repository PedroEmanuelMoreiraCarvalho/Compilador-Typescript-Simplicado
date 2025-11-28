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
  %".2" = getelementptr inbounds [32 x i8], [32 x i8]* @"str_0", i32 0, i32 0
  store i8* %".2", i8** @"mensagem"
  %".4" = load i8*, i8** @"mensagem"
  %".5" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %".4")
  ret i32 0
}

@"str_0" = internal constant [32 x i8] c"Hello, TypeScript Simplificado!\00"
@"mensagem" = internal global i8* null