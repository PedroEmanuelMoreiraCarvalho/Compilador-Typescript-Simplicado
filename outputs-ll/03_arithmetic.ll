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
  %".2" = load double, double* @"a"
  %".3" = load double, double* @"b"
  %".4" = fadd double %".2", %".3"
  store double %".4", double* @"soma"
  %".6" = load double, double* @"a"
  %".7" = load double, double* @"b"
  %".8" = fsub double %".6", %".7"
  store double %".8", double* @"subtracao"
  %".10" = load double, double* @"a"
  %".11" = load double, double* @"b"
  %".12" = fmul double %".10", %".11"
  store double %".12", double* @"multiplicacao"
  %".14" = load double, double* @"a"
  %".15" = load double, double* @"b"
  %".16" = fdiv double %".14", %".15"
  store double %".16", double* @"divisao"
  %".18" = load double, double* @"a"
  %".19" = load double, double* @"b"
  %".20" = frem double %".18", %".19"
  store double %".20", double* @"modulo"
  %".22" = load double, double* @"a"
  %".23" = call double @"pow"(double %".22", double 0x4000000000000000)
  store double %".23", double* @"potencia"
  %".25" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_0", i32 0, i32 0
  %".26" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i8* %".25")
  %".28" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28")
  %".30" = load double, double* @"soma"
  %".31" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".30")
  %".33" = getelementptr inbounds [13 x i8], [13 x i8]* @"str_1", i32 0, i32 0
  %".34" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8* %".33")
  %".36" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36")
  %".38" = load double, double* @"subtracao"
  %".39" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39", double %".38")
  %".41" = getelementptr inbounds [17 x i8], [17 x i8]* @"str_2", i32 0, i32 0
  %".42" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".42", i8* %".41")
  %".44" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".44")
  %".46" = load double, double* @"multiplicacao"
  %".47" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47", double %".46")
  %".49" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".50" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50", i8* %".49")
  %".52" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52")
  %".54" = load double, double* @"divisao"
  %".55" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55", double %".54")
  %".57" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_4", i32 0, i32 0
  %".58" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", i8* %".57")
  %".60" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60")
  %".62" = load double, double* @"modulo"
  %".63" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", double %".62")
  %".65" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_5", i32 0, i32 0
  %".66" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66", i8* %".65")
  %".68" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".68")
  %".70" = load double, double* @"potencia"
  %".71" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".71", double %".70")
  ret i32 0
}

@"a" = internal global double 0x4024000000000000
@"b" = internal global double 0x4014000000000000
@"soma" = internal global double              0x0
@"subtracao" = internal global double              0x0
@"multiplicacao" = internal global double              0x0
@"divisao" = internal global double              0x0
@"modulo" = internal global double              0x0
@"potencia" = internal global double              0x0
@"str_0" = internal constant [6 x i8] c"Soma:\00"
@"str_1" = internal constant [13 x i8] c"Subtra\c3\a7\c3\a3o:\00"
@"str_2" = internal constant [17 x i8] c"Multiplica\c3\a7\c3\a3o:\00"
@"str_3" = internal constant [10 x i8] c"Divis\c3\a3o:\00"
@"str_4" = internal constant [9 x i8] c"M\c3\b3dulo:\00"
@"str_5" = internal constant [11 x i8] c"Pot\c3\aancia:\00"