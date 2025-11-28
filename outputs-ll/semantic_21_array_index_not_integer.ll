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
  %".2" = mul i64 3, 8
  %".3" = call i8* @"malloc"(i64 %".2")
  %".4" = bitcast i8* %".3" to double*
  %".5" = getelementptr double, double* %".4", i64 0
  store double 0x4024000000000000, double* %".5"
  %".7" = getelementptr double, double* %".4", i64 1
  store double 0x4034000000000000, double* %".7"
  %".9" = getelementptr double, double* %".4", i64 2
  store double 0x403e000000000000, double* %".9"
  %".11" = insertvalue {i64, double*} undef, i64 3, 0
  %".12" = insertvalue {i64, double*} %".11", double* %".4", 1
  store {i64, double*} %".12", {i64, double*}* @"arr"
  %".14" = load {i64, double*}, {i64, double*}* @"arr"
  %".15" = extractvalue {i64, double*} %".14", 1
  %".16" = fptosi double 0x400599999999999a to i64
  %".17" = getelementptr double, double* %".15", i64 %".16"
  store double 0x4044000000000000, double* %".17"
  %".19" = load {i64, double*}, {i64, double*}* @"arr"
  %".20" = extractvalue {i64, double*} %".19", 1
  %".21" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_0", i32 0, i32 0
  %".22" = call i32 @"atoi"(i8* %".21")
  %".23" = sitofp i32 %".22" to double
  %".24" = fptosi double %".23" to i64
  %".25" = getelementptr double, double* %".20", i64 %".24"
  %".26" = load double, double* %".25"
  %".27" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".26")
  ret i32 0
}

@"arr" = internal global {i64, double*} zeroinitializer
@"str_0" = internal constant [4 x i8] c"2.7\00"