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
  %"potencia" = alloca double
  %"modulo" = alloca double
  %"divisao" = alloca double
  %"multiplicacao" = alloca double
  %"subtracao" = alloca double
  %"soma" = alloca double
  %"b" = alloca double
  %"a" = alloca double
  store double 0x4024000000000000, double* %"a"
  store double 0x4014000000000000, double* %"b"
  %".4" = load double, double* %"a"
  %".5" = load double, double* %"b"
  %".6" = fadd double %".4", %".5"
  store double %".6", double* %"soma"
  %".8" = load double, double* %"a"
  %".9" = load double, double* %"b"
  %".10" = fsub double %".8", %".9"
  store double %".10", double* %"subtracao"
  %".12" = load double, double* %"a"
  %".13" = load double, double* %"b"
  %".14" = fmul double %".12", %".13"
  store double %".14", double* %"multiplicacao"
  %".16" = load double, double* %"a"
  %".17" = load double, double* %"b"
  %".18" = fdiv double %".16", %".17"
  store double %".18", double* %"divisao"
  %".20" = load double, double* %"a"
  %".21" = load double, double* %"b"
  %".22" = frem double %".20", %".21"
  store double %".22", double* %"modulo"
  %".24" = load double, double* %"a"
  %".25" = call double @"pow"(double %".24", double 0x4000000000000000)
  store double %".25", double* %"potencia"
  %".27" = getelementptr inbounds [6 x i8], [6 x i8]* @"str_0", i32 0, i32 0
  %".28" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28", i8* %".27")
  %".30" = load double, double* %"soma"
  %".31" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".30")
  %".33" = getelementptr inbounds [13 x i8], [13 x i8]* @"str_1", i32 0, i32 0
  %".34" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8* %".33")
  %".36" = load double, double* %"subtracao"
  %".37" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".37", double %".36")
  %".39" = getelementptr inbounds [17 x i8], [17 x i8]* @"str_2", i32 0, i32 0
  %".40" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40", i8* %".39")
  %".42" = load double, double* %"multiplicacao"
  %".43" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".43", double %".42")
  %".45" = getelementptr inbounds [10 x i8], [10 x i8]* @"str_3", i32 0, i32 0
  %".46" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".46", i8* %".45")
  %".48" = load double, double* %"divisao"
  %".49" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".49", double %".48")
  %".51" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_4", i32 0, i32 0
  %".52" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52", i8* %".51")
  %".54" = load double, double* %"modulo"
  %".55" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".55", double %".54")
  %".57" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_5", i32 0, i32 0
  %".58" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", i8* %".57")
  %".60" = load double, double* %"potencia"
  %".61" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".61", double %".60")
  ret i32 0
}

@"str_0" = internal constant [6 x i8] c"Soma:\00"
@"str_1" = internal constant [13 x i8] c"Subtra\c3\a7\c3\a3o:\00"
@"str_2" = internal constant [17 x i8] c"Multiplica\c3\a7\c3\a3o:\00"
@"str_3" = internal constant [10 x i8] c"Divis\c3\a3o:\00"
@"str_4" = internal constant [9 x i8] c"M\c3\b3dulo:\00"
@"str_5" = internal constant [11 x i8] c"Pot\c3\aancia:\00"