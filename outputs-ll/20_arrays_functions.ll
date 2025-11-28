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
  %".2" = mul i64 4, 8
  %".3" = call i8* @"malloc"(i64 %".2")
  %".4" = bitcast i8* %".3" to double*
  %".5" = getelementptr double, double* %".4", i64 0
  store double 0x4014000000000000, double* %".5"
  %".7" = getelementptr double, double* %".4", i64 1
  store double 0x4024000000000000, double* %".7"
  %".9" = getelementptr double, double* %".4", i64 2
  store double 0x402e000000000000, double* %".9"
  %".11" = getelementptr double, double* %".4", i64 3
  store double 0x4034000000000000, double* %".11"
  %".13" = insertvalue {i64, double*} undef, i64 4, 0
  %".14" = insertvalue {i64, double*} %".13", double* %".4", 1
  store {i64, double*} %".14", {i64, double*}* @"meuArray"
  %".16" = load {i64, double*}, {i64, double*}* @"meuArray"
  %".17" = call double @"somarArray"({i64, double*} %".16")
  store double %".17", double* @"resultado"
  %".19" = call {i64, double*} @"criarArray"()
  store {i64, double*} %".19", {i64, double*}* @"novoArray"
  %".21" = load {i64, double*}, {i64, double*}* @"novoArray"
  %".22" = call double @"somarArray"({i64, double*} %".21")
  store double %".22", double* @"soma"
  %".24" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_4", i32 0, i32 0
  %".25" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i8* %".24")
  %".27" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27")
  %".29" = load double, double* @"resultado"
  %".30" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", double %".29")
  %".32" = getelementptr inbounds [20 x i8], [20 x i8]* @"str_5", i32 0, i32 0
  %".33" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".33", i8* %".32")
  %".35" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".35")
  %".37" = load double, double* @"soma"
  %".38" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", double %".37")
  ret i32 0
}

define double @"somarArray"({i64, double*} %".1")
{
entry:
  %"i" = alloca double
  %"total" = alloca double
  %"valores" = alloca {i64, double*}
  store {i64, double*} %".1", {i64, double*}* %"valores"
  store double              0x0, double* %"total"
  store double              0x0, double* %"i"
  br label %"for_cond_0"
for_cond_0:
  %".7" = load double, double* %"i"
  %".8" = load {i64, double*}, {i64, double*}* %"valores"
  %".9" = extractvalue {i64, double*} %".8", 0
  %".10" = sitofp i64 %".9" to double
  %".11" = fcmp olt double %".7", %".10"
  br i1 %".11", label %"for_body_1", label %"for_end_3"
for_body_1:
  %".13" = load double, double* %"total"
  %".14" = load {i64, double*}, {i64, double*}* %"valores"
  %".15" = extractvalue {i64, double*} %".14", 1
  %".16" = load double, double* %"i"
  %".17" = fptosi double %".16" to i64
  %".18" = getelementptr double, double* %".15", i64 %".17"
  %".19" = load double, double* %".18"
  %".20" = fadd double %".13", %".19"
  store double %".20", double* %"total"
  br label %"for_update_2"
for_update_2:
  %".23" = load double, double* %"i"
  %".24" = fadd double %".23", 0x3ff0000000000000
  store double %".24", double* %"i"
  br label %"for_cond_0"
for_end_3:
  %".27" = load double, double* %"total"
  ret double %".27"
}

define {i64, double*} @"criarArray"()
{
entry:
  %"arr" = alloca {i64, double*}
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
  store {i64, double*} %".12", {i64, double*}* %"arr"
  %".14" = load {i64, double*}, {i64, double*}* %"arr"
  ret {i64, double*} %".14"
}

@"meuArray" = internal global {i64, double*} zeroinitializer
@"resultado" = internal global double              0x0
@"novoArray" = internal global {i64, double*} zeroinitializer
@"soma" = internal global double              0x0
@"str_4" = internal constant [11 x i8] c"Resultado:\00"
@"str_5" = internal constant [20 x i8] c"Soma do novo array:\00"