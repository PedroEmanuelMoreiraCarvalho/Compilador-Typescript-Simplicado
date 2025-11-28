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
  %".2" = load double, double* @"x"
  %".3" = load double, double* @"y"
  %".4" = fcmp ogt double %".2", %".3"
  store i1 %".4", i1* @"maior"
  %".6" = load double, double* @"x"
  %".7" = load double, double* @"y"
  %".8" = fcmp olt double %".6", %".7"
  store i1 %".8", i1* @"menor"
  %".10" = load double, double* @"x"
  %".11" = load double, double* @"y"
  %".12" = fcmp oeq double %".10", %".11"
  store i1 %".12", i1* @"igual"
  %".14" = load double, double* @"x"
  %".15" = load double, double* @"y"
  %".16" = fcmp one double %".14", %".15"
  store i1 %".16", i1* @"diferente"
  %".18" = load i1, i1* @"condicao1"
  %".19" = load i1, i1* @"condicao2"
  %".20" = and i1 %".18", %".19"
  store i1 %".20", i1* @"e_logico"
  %".22" = load i1, i1* @"condicao1"
  %".23" = load i1, i1* @"condicao2"
  %".24" = or i1 %".22", %".23"
  store i1 %".24", i1* @"ou_logico"
  %".26" = load i1, i1* @"condicao1"
  %".27" = xor i1 %".26", -1
  store i1 %".27", i1* @"negacao"
  %".29" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_0", i32 0, i32 0
  %".30" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i8* %".29")
  %".32" = load i1, i1* @"maior"
  %".33" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".34" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".35" = select  i1 %".32", i8* %".33", i8* %".34"
  %".36" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".36", i8* %".35")
  %".38" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_1", i32 0, i32 0
  %".39" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".39", i8* %".38")
  %".41" = load i1, i1* @"e_logico"
  %".42" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".43" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".44" = select  i1 %".41", i8* %".42", i8* %".43"
  %".45" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".45", i8* %".44")
  %".47" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_2", i32 0, i32 0
  %".48" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".48", i8* %".47")
  %".50" = load i1, i1* @"ou_logico"
  %".51" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".52" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".53" = select  i1 %".50", i8* %".51", i8* %".52"
  %".54" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54", i8* %".53")
  %".56" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_3", i32 0, i32 0
  %".57" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".57", i8* %".56")
  %".59" = load i1, i1* @"menor"
  %".60" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".61" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".62" = select  i1 %".59", i8* %".60", i8* %".61"
  %".63" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", i8* %".62")
  %".65" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_4", i32 0, i32 0
  %".66" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66", i8* %".65")
  %".68" = load i1, i1* @"igual"
  %".69" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".70" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".71" = select  i1 %".68", i8* %".69", i8* %".70"
  %".72" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".72", i8* %".71")
  %".74" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_5", i32 0, i32 0
  %".75" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".75", i8* %".74")
  %".77" = load i1, i1* @"diferente"
  %".78" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".79" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".80" = select  i1 %".77", i8* %".78", i8* %".79"
  %".81" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".81", i8* %".80")
  %".83" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_6", i32 0, i32 0
  %".84" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".85" = call i32 (i8*, ...) @"printf"(i8* %".84", i8* %".83")
  %".86" = load i1, i1* @"condicao1"
  %".87" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".88" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".89" = select  i1 %".86", i8* %".87", i8* %".88"
  %".90" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".91" = call i32 (i8*, ...) @"printf"(i8* %".90", i8* %".89")
  %".92" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_7", i32 0, i32 0
  %".93" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".93", i8* %".92")
  %".95" = load i1, i1* @"condicao2"
  %".96" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".97" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".98" = select  i1 %".95", i8* %".96", i8* %".97"
  %".99" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".99", i8* %".98")
  %".101" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_8", i32 0, i32 0
  %".102" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".102", i8* %".101")
  %".104" = load i1, i1* @"negacao"
  %".105" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".106" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".107" = select  i1 %".104", i8* %".105", i8* %".106"
  %".108" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".108", i8* %".107")
  %".110" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_9", i32 0, i32 0
  %".111" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".111", i8* %".110")
  %".113" = load double, double* @"x"
  %".114" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".115" = call i32 (i8*, ...) @"printf"(i8* %".114", double %".113")
  %".116" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_10", i32 0, i32 0
  %".117" = getelementptr [4 x i8], [4 x i8]* @"fmt_string", i32 0, i32 0
  %".118" = call i32 (i8*, ...) @"printf"(i8* %".117", i8* %".116")
  %".119" = load double, double* @"y"
  %".120" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120", double %".119")
  ret i32 0
}

@"x" = internal global double 0x4024000000000000
@"y" = internal global double 0x4034000000000000
@"maior" = internal global i1 0
@"menor" = internal global i1 0
@"igual" = internal global i1 0
@"diferente" = internal global i1 0
@"condicao1" = internal global i1 1
@"condicao2" = internal global i1 0
@"e_logico" = internal global i1 0
@"ou_logico" = internal global i1 0
@"negacao" = internal global i1 0
@"str_0" = internal constant [7 x i8] c"Maior:\00"
@"str_1" = internal constant [11 x i8] c"E l\c3\b3gico:\00"
@"str_2" = internal constant [12 x i8] c"OU l\c3\b3gico:\00"
@"str_3" = internal constant [7 x i8] c"Menor:\00"
@"str_4" = internal constant [7 x i8] c"Igual:\00"
@"str_5" = internal constant [11 x i8] c"Diferente:\00"
@"str_6" = internal constant [11 x i8] c"Condicao1:\00"
@"str_7" = internal constant [11 x i8] c"Condicao2:\00"
@"str_8" = internal constant [9 x i8] c"Negacao:\00"
@"str_9" = internal constant [3 x i8] c"x:\00"
@"str_10" = internal constant [3 x i8] c"y:\00"