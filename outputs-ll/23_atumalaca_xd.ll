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
  %".2" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_0", i32 0, i32 0
  %".3" = mul i64 3, 8
  %".4" = call i8* @"malloc"(i64 %".3")
  %".5" = bitcast i8* %".4" to i8**
  %".6" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_1", i32 0, i32 0
  %".7" = getelementptr i8*, i8** %".5", i64 0
  store i8* %".6", i8** %".7"
  %".9" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_2", i32 0, i32 0
  %".10" = getelementptr i8*, i8** %".5", i64 1
  store i8* %".9", i8** %".10"
  %".12" = getelementptr inbounds [4 x i8], [4 x i8]* @"str_3", i32 0, i32 0
  %".13" = getelementptr i8*, i8** %".5", i64 2
  store i8* %".12", i8** %".13"
  %".15" = insertvalue {i64, i8**} undef, i64 3, 0
  %".16" = insertvalue {i64, i8**} %".15", i8** %".5", 1
  store {i64, i8**} %".16", {i64, i8**}* @"valores"
  %".18" = load {i64, i8**}, {i64, i8**}* @"valores"
  %".19" = extractvalue {i64, i8**} %".18", 1
  %".20" = call double @"func1"()
  %".21" = fptosi double %".20" to i64
  %".22" = getelementptr i8*, i8** %".19", i64 %".21"
  %".23" = load i8*, i8** %".22"
  %".24" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i8* %".23")
  ret i32 0
}

@"str_0" = internal constant [3 x i8] c"xd\00"
@"str_1" = internal constant [3 x i8] c"xd\00"
@"str_2" = internal constant [10 x i8] c"atumalaca\00"
@"str_3" = internal constant [4 x i8] c"sim\00"
@"valores" = internal global {i64, i8**} zeroinitializer
define double @"func1"()
{
entry:
  %"a" = alloca double
  %".2" = fdiv double 0x4008000000000000, 0x4000000000000000
  store double %".2", double* %"a"
  %".4" = load double, double* %"a"
  ret double %".4"
}
