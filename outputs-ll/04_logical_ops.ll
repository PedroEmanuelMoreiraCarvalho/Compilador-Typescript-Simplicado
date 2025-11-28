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
  %".30" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i8* %".29")
  %".32" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32")
  %".34" = load i1, i1* @"maior"
  %".35" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".36" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".37" = select  i1 %".34", i8* %".35", i8* %".36"
  %".38" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38", i8* %".37")
  %".40" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_1", i32 0, i32 0
  %".41" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".41", i8* %".40")
  %".43" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".43")
  %".45" = load i1, i1* @"e_logico"
  %".46" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".47" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".48" = select  i1 %".45", i8* %".46", i8* %".47"
  %".49" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".49", i8* %".48")
  %".51" = getelementptr inbounds [12 x i8], [12 x i8]* @"str_2", i32 0, i32 0
  %".52" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".52", i8* %".51")
  %".54" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".54")
  %".56" = load i1, i1* @"ou_logico"
  %".57" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".58" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".59" = select  i1 %".56", i8* %".57", i8* %".58"
  %".60" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".60", i8* %".59")
  %".62" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_3", i32 0, i32 0
  %".63" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".63", i8* %".62")
  %".65" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".65")
  %".67" = load i1, i1* @"menor"
  %".68" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".69" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".70" = select  i1 %".67", i8* %".68", i8* %".69"
  %".71" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".71", i8* %".70")
  %".73" = getelementptr inbounds [7 x i8], [7 x i8]* @"str_4", i32 0, i32 0
  %".74" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".74", i8* %".73")
  %".76" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".76")
  %".78" = load i1, i1* @"igual"
  %".79" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".80" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".81" = select  i1 %".78", i8* %".79", i8* %".80"
  %".82" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".82", i8* %".81")
  %".84" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_5", i32 0, i32 0
  %".85" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".85", i8* %".84")
  %".87" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".88" = call i32 (i8*, ...) @"printf"(i8* %".87")
  %".89" = load i1, i1* @"diferente"
  %".90" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".91" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".92" = select  i1 %".89", i8* %".90", i8* %".91"
  %".93" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".93", i8* %".92")
  %".95" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_6", i32 0, i32 0
  %".96" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".96", i8* %".95")
  %".98" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".98")
  %".100" = load i1, i1* @"condicao1"
  %".101" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".102" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".103" = select  i1 %".100", i8* %".101", i8* %".102"
  %".104" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".104", i8* %".103")
  %".106" = getelementptr inbounds [11 x i8], [11 x i8]* @"str_7", i32 0, i32 0
  %".107" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".107", i8* %".106")
  %".109" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".109")
  %".111" = load i1, i1* @"condicao2"
  %".112" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".113" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".114" = select  i1 %".111", i8* %".112", i8* %".113"
  %".115" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".115", i8* %".114")
  %".117" = getelementptr inbounds [9 x i8], [9 x i8]* @"str_8", i32 0, i32 0
  %".118" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".118", i8* %".117")
  %".120" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".120")
  %".122" = load i1, i1* @"negacao"
  %".123" = getelementptr [5 x i8], [5 x i8]* @"str_true", i32 0, i32 0
  %".124" = getelementptr [6 x i8], [6 x i8]* @"str_false", i32 0, i32 0
  %".125" = select  i1 %".122", i8* %".123", i8* %".124"
  %".126" = getelementptr [4 x i8], [4 x i8]* @"fmt_bool", i32 0, i32 0
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".126", i8* %".125")
  %".128" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_9", i32 0, i32 0
  %".129" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".130" = call i32 (i8*, ...) @"printf"(i8* %".129", i8* %".128")
  %".131" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".131")
  %".133" = load double, double* @"x"
  %".134" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".134", double %".133")
  %".136" = getelementptr inbounds [3 x i8], [3 x i8]* @"str_10", i32 0, i32 0
  %".137" = getelementptr [3 x i8], [3 x i8]* @"fmt_string_no_nl", i32 0, i32 0
  %".138" = call i32 (i8*, ...) @"printf"(i8* %".137", i8* %".136")
  %".139" = getelementptr [2 x i8], [2 x i8]* @"fmt_space", i32 0, i32 0
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".139")
  %".141" = load double, double* @"y"
  %".142" = getelementptr [4 x i8], [4 x i8]* @"fmt_number", i32 0, i32 0
  %".143" = call i32 (i8*, ...) @"printf"(i8* %".142", double %".141")
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