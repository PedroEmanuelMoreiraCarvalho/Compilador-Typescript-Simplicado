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
  %".2" = load double, double* @"nota1"
  %".3" = load double, double* @"nota2"
  %".4" = load double, double* @"nota3"
  %".5" = call double @"calcularMedia"(double %".2", double %".3", double %".4")
  store double %".5", double* @"mediaFinal"
  %".7" = load double, double* @"mediaFinal"
  call void @"verificarAprovacao"(double %".7")
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
  %".8" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i8* %".7")
  %".10" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  %".12" = load double, double* %"media"
  %".13" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", double %".12")
  br label %"if_merge_2"
if_else_1:
  %".16" = load double, double* %"media"
  %".17" = fcmp oge double %".16", 0x4014000000000000
  br i1 %".17", label %"if_then_4", label %"if_else_5"
if_merge_2:
  ret void
if_then_4:
  %".19" = getelementptr inbounds [23 x i8], [23 x i8]* @"str_7", i32 0, i32 0
  %".20" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i8* %".19")
  %".22" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22")
  %".24" = load double, double* %"media"
  %".25" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", double %".24")
  br label %"if_merge_6"
if_else_5:
  %".28" = getelementptr inbounds [19 x i8], [19 x i8]* @"str_8", i32 0, i32 0
  %".29" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29", i8* %".28")
  %".31" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31")
  %".33" = load double, double* %"media"
  %".34" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", double %".33")
  br label %"if_merge_6"
if_merge_6:
  br label %"if_merge_2"
}

@"str_3" = internal constant [18 x i8] c"Aprovado! M\c3\a9dia:\00"
@"str_7" = internal constant [23 x i8] c"Recupera\c3\a7\c3\a3o! M\c3\a9dia:\00"
@"str_8" = internal constant [19 x i8] c"Reprovado! M\c3\a9dia:\00"
@"nota1" = internal global double 0x4021000000000000
@"nota2" = internal global double 0x401c000000000000
@"nota3" = internal global double 0x4022000000000000
@"mediaFinal" = internal global double              0x0