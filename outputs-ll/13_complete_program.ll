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
  %"mediaFinal" = alloca double
  %"nota3" = alloca double
  %"nota2" = alloca double
  %"nota1" = alloca double
  store double 0x4021000000000000, double* %"nota1"
  store double 0x401c000000000000, double* %"nota2"
  store double 0x4022000000000000, double* %"nota3"
  %".5" = load double, double* %"nota1"
  %".6" = load double, double* %"nota2"
  %".7" = load double, double* %"nota3"
  %".8" = call double @"calcularMedia"(double %".5", double %".6", double %".7")
  store double %".8", double* %"mediaFinal"
  %".10" = load double, double* %"mediaFinal"
  call void @"verificarAprovacao"(double %".10")
  ret i32 0
}

define double @"calcularMedia"(double %".1", double %".2", double %".3")
{
entry:
  %"media" = alloca double
  %"soma" = alloca double
  %"n3" = alloca double
  %"n2" = alloca double
  %"n1" = alloca double
  store double %".1", double* %"n1"
  store double %".2", double* %"n2"
  store double %".3", double* %"n3"
  %".8" = load double, double* %"n1"
  %".9" = load double, double* %"n2"
  %".10" = fadd double %".8", %".9"
  %".11" = load double, double* %"n3"
  %".12" = fadd double %".10", %".11"
  store double %".12", double* %"soma"
  %".14" = load double, double* %"soma"
  %".15" = fdiv double %".14", 0x4008000000000000
  store double %".15", double* %"media"
  %".17" = load double, double* %"media"
  ret double %".17"
}

define void @"verificarAprovacao"(double %".1")
{
entry:
  %"media" = alloca double
  store double %".1", double* %"media"
  %".4" = load double, double* %"media"
  %".5" = fcmp oge double %".4", 0x401c000000000000
  br i1 %".5", label %"if_then_0", label %"if_else_1"
if_then_0:
  %".7" = getelementptr inbounds [18 x i8], [18 x i8]* @"str_3", i32 0, i32 0
  %".8" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = load double, double* %"media"
  %".11" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", double %".10")
  br label %"if_merge_2"
if_else_1:
  %".14" = load double, double* %"media"
  %".15" = fcmp oge double %".14", 0x4014000000000000
  br i1 %".15", label %"if_then_4", label %"if_else_5"
if_merge_2:
  ret void
if_then_4:
  %".17" = getelementptr inbounds [23 x i8], [23 x i8]* @"str_7", i32 0, i32 0
  %".18" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i8* %".17")
  %".20" = load double, double* %"media"
  %".21" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", double %".20")
  br label %"if_merge_6"
if_else_5:
  %".24" = getelementptr inbounds [19 x i8], [19 x i8]* @"str_8", i32 0, i32 0
  %".25" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i8* %".24")
  %".27" = load double, double* %"media"
  %".28" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", double %".27")
  br label %"if_merge_6"
if_merge_6:
  br label %"if_merge_2"
}

@"str_3" = internal constant [18 x i8] c"Aprovado! M\c3\a9dia:\00"
@"str_7" = internal constant [23 x i8] c"Recupera\c3\a7\c3\a3o! M\c3\a9dia:\00"
@"str_8" = internal constant [19 x i8] c"Reprovado! M\c3\a9dia:\00"