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
  %"negacao" = alloca i1
  %"ou_logico" = alloca i1
  %"e_logico" = alloca i1
  %"condicao2" = alloca i1
  %"condicao1" = alloca i1
  %"diferente" = alloca i1
  %"igual" = alloca i1
  %"menor" = alloca i1
  %"maior" = alloca i1
  %"y" = alloca double
  %"x" = alloca double
  store double 0x4024000000000000, double* %"x"
  store double 0x4034000000000000, double* %"y"
  %".4" = load double, double* %"x"
  %".5" = load double, double* %"y"
  %".6" = fcmp ogt double %".4", %".5"
  store i1 %".6", i1* %"maior"
  %".8" = load double, double* %"x"
  %".9" = load double, double* %"y"
  %".10" = fcmp olt double %".8", %".9"
  store i1 %".10", i1* %"menor"
  %".12" = load double, double* %"x"
  %".13" = load double, double* %"y"
  %".14" = fcmp oeq double %".12", %".13"
  store i1 %".14", i1* %"igual"
  %".16" = load double, double* %"x"
  %".17" = load double, double* %"y"
  %".18" = fcmp one double %".16", %".17"
  store i1 %".18", i1* %"diferente"
  store i1 1, i1* %"condicao1"
  store i1 0, i1* %"condicao2"
  %".22" = load i1, i1* %"condicao1"
  %".23" = load i1, i1* %"condicao2"
  %".24" = and i1 %".22", %".23"
  store i1 %".24", i1* %"e_logico"
  %".26" = load i1, i1* %"condicao1"
  %".27" = load i1, i1* %"condicao2"
  %".28" = or i1 %".26", %".27"
  store i1 %".28", i1* %"ou_logico"
  %".30" = load i1, i1* %"condicao1"
  %".31" = xor i1 %".30", -1
  store i1 %".31", i1* %"negacao"
  %".33" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_0", i32 0, i32 0
  %".34" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".34", i8* %".33")
  %".36" = load i1, i1* %"maior"
  %".37" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".38" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".39" = select  i1 %".36", i8* %".37", i8* %".38"
  %".40" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40", i8* %".39")
  %".42" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_1", i32 0, i32 0
  %".43" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".43", i8* %".42")
  %".45" = load i1, i1* %"e_logico"
  %".46" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".47" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".48" = select  i1 %".45", i8* %".46", i8* %".47"
  %".49" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".49", i8* %".48")
  %".51" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_2", i32 0, i32 0
  %".52" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52", i8* %".51")
  %".54" = load i1, i1* %"ou_logico"
  %".55" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".56" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".57" = select  i1 %".54", i8* %".55", i8* %".56"
  %".58" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58", i8* %".57")
  ret i32 0
}

@"str_0" = internal constant [7 x i8] c"Maior:\00"
@"str_1" = internal constant [11 x i8] c"E l\c3\b3gico:\00"
@"str_2" = internal constant [12 x i8] c"OU l\c3\b3gico:\00"