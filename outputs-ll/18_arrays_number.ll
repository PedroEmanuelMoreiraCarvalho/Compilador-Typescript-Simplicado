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
  %"i" = alloca double
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
  store {i64, double*} %".16", {i64, double*}* @"numeros"
  %".18" = load {i64, double*}, {i64, double*}* @"numeros"
  %".19" = extractvalue {i64, double*} %".18", 1
  %".20" = fptosi double              0x0 to i64
  %".21" = getelementptr double, double* %".19", i64 %".20"
  %".22" = load double, double* %".21"
  store double %".22", double* @"primeiro"
  %".24" = load {i64, double*}, {i64, double*}* @"numeros"
  %".25" = extractvalue {i64, double*} %".24", 1
  %".26" = fptosi double 0x4010000000000000 to i64
  %".27" = getelementptr double, double* %".25", i64 %".26"
  %".28" = load double, double* %".27"
  store double %".28", double* @"ultimo"
  %".30" = load {i64, double*}, {i64, double*}* @"numeros"
  %".31" = extractvalue {i64, double*} %".30", 1
  %".32" = fptosi double 0x4000000000000000 to i64
  %".33" = getelementptr double, double* %".31", i64 %".32"
  store double 0x4024000000000000, double* %".33"
  store double              0x0, double* %"i"
  br label %"for_cond_0"
for_cond_0:
  %".37" = load double, double* %"i"
  %".38" = load {i64, double*}, {i64, double*}* @"numeros"
  %".39" = extractvalue {i64, double*} %".38", 0
  %".40" = sitofp i64 %".39" to double
  %".41" = fcmp olt double %".37", %".40"
  br i1 %".41", label %"for_body_1", label %"for_end_3"
for_body_1:
  %".43" = load double, double* @"soma"
  %".44" = load {i64, double*}, {i64, double*}* @"numeros"
  %".45" = extractvalue {i64, double*} %".44", 1
  %".46" = load double, double* %"i"
  %".47" = fptosi double %".46" to i64
  %".48" = getelementptr double, double* %".45", i64 %".47"
  %".49" = load double, double* %".48"
  %".50" = fadd double %".43", %".49"
  store double %".50", double* @"soma"
  br label %"for_update_2"
for_update_2:
  %".53" = load double, double* %"i"
  %".54" = fadd double %".53", 0x3ff0000000000000
  store double %".54", double* %"i"
  br label %"for_cond_0"
for_end_3:
  %".57" = getelementptr inbounds [20 x i8], [20 x i8]* @"str_4", i32 0, i32 0
  %".58" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", i8* %".57")
  %".60" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60")
  %".62" = load double, double* @"soma"
  %".63" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", double %".62")
  %".65" = getelementptr inbounds [18 x i8], [18 x i8]* @"str_5", i32 0, i32 0
  %".66" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66", i8* %".65")
  %".68" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68")
  %".70" = load {i64, double*}, {i64, double*}* @"numeros"
  %".71" = extractvalue {i64, double*} %".70", 0
  %".72" = sitofp i64 %".71" to double
  %".73" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".73", double %".72")
  ret i32 0
}

@"numeros" = internal global {i64, double*} zeroinitializer
@"soma" = internal global double              0x0
@"primeiro" = internal global double              0x0
@"ultimo" = internal global double              0x0
@"str_4" = internal constant [20 x i8] c"Soma dos elementos:\00"
@"str_5" = internal constant [18 x i8] c"Tamanho do array:\00"