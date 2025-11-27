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
  %"i" = alloca double
  %"ultimo" = alloca double
  %"primeiro" = alloca double
  %"soma" = alloca double
  %"numeros" = alloca {i64, double*}
  %".2" = mul i64 5, 8
  %".3" = call i8* @"malloc"(i64 %".2")
  %".4" = bitcast i8* %".3" to double*
  %".5" = getelementptr double, double* %".4", i64 0
  store double 0x3ff0000000000000, double* %".5"
  %".7" = getelementptr double, double* %".4", i64 1
  store double 0x4000000000000000, double* %".7"
  %".9" = getelementptr double, double* %".4", i64 2
  store double 0x4008000000000000, double* %".9"
  %".11" = getelementptr double, double* %".4", i64 3
  store double 0x4010000000000000, double* %".11"
  %".13" = getelementptr double, double* %".4", i64 4
  store double 0x4014000000000000, double* %".13"
  %".15" = insertvalue {i64, double*} undef, i64 5, 0
  %".16" = insertvalue {i64, double*} %".15", double* %".4", 1
  store {i64, double*} %".16", {i64, double*}* %"numeros"
  store double              0x0, double* %"soma"
  %".19" = load {i64, double*}, {i64, double*}* %"numeros"
  %".20" = extractvalue {i64, double*} %".19", 1
  %".21" = fptosi double              0x0 to i64
  %".22" = getelementptr double, double* %".20", i64 %".21"
  %".23" = load double, double* %".22"
  store double %".23", double* %"primeiro"
  %".25" = load {i64, double*}, {i64, double*}* %"numeros"
  %".26" = extractvalue {i64, double*} %".25", 1
  %".27" = fptosi double 0x4010000000000000 to i64
  %".28" = getelementptr double, double* %".26", i64 %".27"
  %".29" = load double, double* %".28"
  store double %".29", double* %"ultimo"
  %".31" = load {i64, double*}, {i64, double*}* %"numeros"
  %".32" = extractvalue {i64, double*} %".31", 1
  %".33" = fptosi double 0x4000000000000000 to i64
  %".34" = getelementptr double, double* %".32", i64 %".33"
  store double 0x4024000000000000, double* %".34"
  store double              0x0, double* %"i"
  br label %"for_cond_0"
for_cond_0:
  %".38" = load double, double* %"i"
  %".39" = load {i64, double*}, {i64, double*}* %"numeros"
  %".40" = extractvalue {i64, double*} %".39", 0
  %".41" = sitofp i64 %".40" to double
  %".42" = fcmp olt double %".38", %".41"
  br i1 %".42", label %"for_body_1", label %"for_end_3"
for_body_1:
  %".44" = load double, double* %"soma"
  %".45" = load {i64, double*}, {i64, double*}* %"numeros"
  %".46" = extractvalue {i64, double*} %".45", 1
  %".47" = load double, double* %"i"
  %".48" = fptosi double %".47" to i64
  %".49" = getelementptr double, double* %".46", i64 %".48"
  %".50" = load double, double* %".49"
  %".51" = fadd double %".44", %".50"
  store double %".51", double* %"soma"
  br label %"for_update_2"
for_update_2:
  %".54" = load double, double* %"i"
  %".55" = fadd double %".54", 0x3ff0000000000000
  store double %".55", double* %"i"
  br label %"for_cond_0"
for_end_3:
  %".58" = getelementptr inbounds [20 x i8], [20 x i8]* @"str_4", i32 0, i32 0
  %".59" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".59", i8* %".58")
  %".61" = load double, double* %"soma"
  %".62" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".62", double %".61")
  %".64" = getelementptr inbounds [18 x i8], [18 x i8]* @"str_5", i32 0, i32 0
  %".65" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".65", i8* %".64")
  %".67" = load {i64, double*}, {i64, double*}* %"numeros"
  %".68" = extractvalue {i64, double*} %".67", 0
  %".69" = sitofp i64 %".68" to double
  %".70" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".70", double %".69")
  ret i32 0
}

@"str_4" = internal constant [20 x i8] c"Soma dos elementos:\00"
@"str_5" = internal constant [18 x i8] c"Tamanho do array:\00"