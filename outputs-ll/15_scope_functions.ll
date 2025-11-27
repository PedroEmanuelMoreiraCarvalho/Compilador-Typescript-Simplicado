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
  %"valor" = alloca double
  %"global" = alloca double
  store double 0x4059000000000000, double* %"global"
  %".3" = call double @"teste"(double 0x4014000000000000)
  store double %".3", double* %"valor"
  %".5" = load double, double* %"valor"
  %".6" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", double %".5")
  %".8" = load double, double* %"global"
  %".9" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", double %".8")
  ret i32 0
}

define double @"teste"(double %".1")
{
entry:
  %"resultado" = alloca double
  %"local" = alloca double
  %"parametro" = alloca double
  store double %".1", double* %"parametro"
  store double 0x4024000000000000, double* %"local"
  %".5" = load double, double* %"global"
  %".6" = load double, double* %"local"
  %".7" = fadd double %".5", %".6"
  %".8" = load double, double* %"parametro"
  %".9" = fadd double %".7", %".8"
  store double %".9", double* %"resultado"
  %".11" = load double, double* %"resultado"
  ret double %".11"
}
