// Generated from /Users/gabriellopesbastos/Projects/Compilador-Typescript-Simplicado/gen/TypeScriptSimplificado.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TypeScriptSimplificadoParser}.
 */
public interface TypeScriptSimplificadoListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(TypeScriptSimplificadoParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(TypeScriptSimplificadoParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDecl(TypeScriptSimplificadoParser.FunctionDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDecl(TypeScriptSimplificadoParser.FunctionDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#returnType}.
	 * @param ctx the parse tree
	 */
	void enterReturnType(TypeScriptSimplificadoParser.ReturnTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#returnType}.
	 * @param ctx the parse tree
	 */
	void exitReturnType(TypeScriptSimplificadoParser.ReturnTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#paramList}.
	 * @param ctx the parse tree
	 */
	void enterParamList(TypeScriptSimplificadoParser.ParamListContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#paramList}.
	 * @param ctx the parse tree
	 */
	void exitParamList(TypeScriptSimplificadoParser.ParamListContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#param}.
	 * @param ctx the parse tree
	 */
	void enterParam(TypeScriptSimplificadoParser.ParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#param}.
	 * @param ctx the parse tree
	 */
	void exitParam(TypeScriptSimplificadoParser.ParamContext ctx);
	/**
	 * Enter a parse tree produced by the {@code numberType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterNumberType(TypeScriptSimplificadoParser.NumberTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code numberType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitNumberType(TypeScriptSimplificadoParser.NumberTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stringType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterStringType(TypeScriptSimplificadoParser.StringTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stringType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitStringType(TypeScriptSimplificadoParser.StringTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code booleanType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterBooleanType(TypeScriptSimplificadoParser.BooleanTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code booleanType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitBooleanType(TypeScriptSimplificadoParser.BooleanTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code numberArrayType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterNumberArrayType(TypeScriptSimplificadoParser.NumberArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code numberArrayType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitNumberArrayType(TypeScriptSimplificadoParser.NumberArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stringArrayType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void enterStringArrayType(TypeScriptSimplificadoParser.StringArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stringArrayType}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#typeAnnotation}.
	 * @param ctx the parse tree
	 */
	void exitStringArrayType(TypeScriptSimplificadoParser.StringArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code varDeclStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterVarDeclStmt(TypeScriptSimplificadoParser.VarDeclStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code varDeclStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitVarDeclStmt(TypeScriptSimplificadoParser.VarDeclStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assignStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterAssignStmt(TypeScriptSimplificadoParser.AssignStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assignStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitAssignStmt(TypeScriptSimplificadoParser.AssignStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIfStmt(TypeScriptSimplificadoParser.IfStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIfStmt(TypeScriptSimplificadoParser.IfStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStmt(TypeScriptSimplificadoParser.WhileStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStmt(TypeScriptSimplificadoParser.WhileStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterForStmt(TypeScriptSimplificadoParser.ForStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitForStmt(TypeScriptSimplificadoParser.ForStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code retStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterRetStmt(TypeScriptSimplificadoParser.RetStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code retStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitRetStmt(TypeScriptSimplificadoParser.RetStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code consoleStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterConsoleStmt(TypeScriptSimplificadoParser.ConsoleStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code consoleStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitConsoleStmt(TypeScriptSimplificadoParser.ConsoleStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExprStmt(TypeScriptSimplificadoParser.ExprStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExprStmt(TypeScriptSimplificadoParser.ExprStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlockStmt(TypeScriptSimplificadoParser.BlockStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blockStmt}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlockStmt(TypeScriptSimplificadoParser.BlockStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(TypeScriptSimplificadoParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(TypeScriptSimplificadoParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code letDecl}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void enterLetDecl(TypeScriptSimplificadoParser.LetDeclContext ctx);
	/**
	 * Exit a parse tree produced by the {@code letDecl}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void exitLetDecl(TypeScriptSimplificadoParser.LetDeclContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constDecl}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void enterConstDecl(TypeScriptSimplificadoParser.ConstDeclContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constDecl}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#variableDecl}.
	 * @param ctx the parse tree
	 */
	void exitConstDecl(TypeScriptSimplificadoParser.ConstDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#assignmentStmt}.
	 * @param ctx the parse tree
	 */
	void enterAssignmentStmt(TypeScriptSimplificadoParser.AssignmentStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#assignmentStmt}.
	 * @param ctx the parse tree
	 */
	void exitAssignmentStmt(TypeScriptSimplificadoParser.AssignmentStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void enterIdLvalue(TypeScriptSimplificadoParser.IdLvalueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void exitIdLvalue(TypeScriptSimplificadoParser.IdLvalueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayAccessLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void enterArrayAccessLvalue(TypeScriptSimplificadoParser.ArrayAccessLvalueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayAccessLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void exitArrayAccessLvalue(TypeScriptSimplificadoParser.ArrayAccessLvalueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lengthAccessLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void enterLengthAccessLvalue(TypeScriptSimplificadoParser.LengthAccessLvalueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lengthAccessLvalue}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#lvalue}.
	 * @param ctx the parse tree
	 */
	void exitLengthAccessLvalue(TypeScriptSimplificadoParser.LengthAccessLvalueContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(TypeScriptSimplificadoParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(TypeScriptSimplificadoParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(TypeScriptSimplificadoParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(TypeScriptSimplificadoParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(TypeScriptSimplificadoParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(TypeScriptSimplificadoParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#forInit}.
	 * @param ctx the parse tree
	 */
	void enterForInit(TypeScriptSimplificadoParser.ForInitContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#forInit}.
	 * @param ctx the parse tree
	 */
	void exitForInit(TypeScriptSimplificadoParser.ForInitContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#forUpdate}.
	 * @param ctx the parse tree
	 */
	void enterForUpdate(TypeScriptSimplificadoParser.ForUpdateContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#forUpdate}.
	 * @param ctx the parse tree
	 */
	void exitForUpdate(TypeScriptSimplificadoParser.ForUpdateContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(TypeScriptSimplificadoParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(TypeScriptSimplificadoParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#consoleLogStmt}.
	 * @param ctx the parse tree
	 */
	void enterConsoleLogStmt(TypeScriptSimplificadoParser.ConsoleLogStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#consoleLogStmt}.
	 * @param ctx the parse tree
	 */
	void exitConsoleLogStmt(TypeScriptSimplificadoParser.ConsoleLogStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#expressionStmt}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStmt(TypeScriptSimplificadoParser.ExpressionStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#expressionStmt}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStmt(TypeScriptSimplificadoParser.ExpressionStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(TypeScriptSimplificadoParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(TypeScriptSimplificadoParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(TypeScriptSimplificadoParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(TypeScriptSimplificadoParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code orPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalOrExpr}.
	 * @param ctx the parse tree
	 */
	void enterOrPass(TypeScriptSimplificadoParser.OrPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code orPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalOrExpr}.
	 * @param ctx the parse tree
	 */
	void exitOrPass(TypeScriptSimplificadoParser.OrPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code orExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalOrExpr}.
	 * @param ctx the parse tree
	 */
	void enterOrExpr(TypeScriptSimplificadoParser.OrExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code orExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalOrExpr}.
	 * @param ctx the parse tree
	 */
	void exitOrExpr(TypeScriptSimplificadoParser.OrExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code andPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalAndExpr}.
	 * @param ctx the parse tree
	 */
	void enterAndPass(TypeScriptSimplificadoParser.AndPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code andPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalAndExpr}.
	 * @param ctx the parse tree
	 */
	void exitAndPass(TypeScriptSimplificadoParser.AndPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code andExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalAndExpr}.
	 * @param ctx the parse tree
	 */
	void enterAndExpr(TypeScriptSimplificadoParser.AndExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code andExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#logicalAndExpr}.
	 * @param ctx the parse tree
	 */
	void exitAndExpr(TypeScriptSimplificadoParser.AndExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code eqExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void enterEqExpr(TypeScriptSimplificadoParser.EqExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code eqExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void exitEqExpr(TypeScriptSimplificadoParser.EqExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code eqPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void enterEqPass(TypeScriptSimplificadoParser.EqPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code eqPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void exitEqPass(TypeScriptSimplificadoParser.EqPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code neqExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void enterNeqExpr(TypeScriptSimplificadoParser.NeqExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code neqExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#equalityExpr}.
	 * @param ctx the parse tree
	 */
	void exitNeqExpr(TypeScriptSimplificadoParser.NeqExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code geExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void enterGeExpr(TypeScriptSimplificadoParser.GeExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code geExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void exitGeExpr(TypeScriptSimplificadoParser.GeExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ltExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void enterLtExpr(TypeScriptSimplificadoParser.LtExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ltExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void exitLtExpr(TypeScriptSimplificadoParser.LtExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code gtExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void enterGtExpr(TypeScriptSimplificadoParser.GtExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code gtExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void exitGtExpr(TypeScriptSimplificadoParser.GtExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code leExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void enterLeExpr(TypeScriptSimplificadoParser.LeExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code leExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void exitLeExpr(TypeScriptSimplificadoParser.LeExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code relPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void enterRelPass(TypeScriptSimplificadoParser.RelPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code relPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#relationalExpr}.
	 * @param ctx the parse tree
	 */
	void exitRelPass(TypeScriptSimplificadoParser.RelPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code addExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void enterAddExpr(TypeScriptSimplificadoParser.AddExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code addExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void exitAddExpr(TypeScriptSimplificadoParser.AddExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code addPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void enterAddPass(TypeScriptSimplificadoParser.AddPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code addPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void exitAddPass(TypeScriptSimplificadoParser.AddPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void enterSubExpr(TypeScriptSimplificadoParser.SubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code subExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#additiveExpr}.
	 * @param ctx the parse tree
	 */
	void exitSubExpr(TypeScriptSimplificadoParser.SubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mulPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void enterMulPass(TypeScriptSimplificadoParser.MulPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mulPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void exitMulPass(TypeScriptSimplificadoParser.MulPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code modExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void enterModExpr(TypeScriptSimplificadoParser.ModExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code modExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void exitModExpr(TypeScriptSimplificadoParser.ModExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mulExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void enterMulExpr(TypeScriptSimplificadoParser.MulExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mulExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void exitMulExpr(TypeScriptSimplificadoParser.MulExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code divExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void enterDivExpr(TypeScriptSimplificadoParser.DivExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code divExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#multiplicativeExpr}.
	 * @param ctx the parse tree
	 */
	void exitDivExpr(TypeScriptSimplificadoParser.DivExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code powExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#powerExpr}.
	 * @param ctx the parse tree
	 */
	void enterPowExpr(TypeScriptSimplificadoParser.PowExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code powExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#powerExpr}.
	 * @param ctx the parse tree
	 */
	void exitPowExpr(TypeScriptSimplificadoParser.PowExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code powPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#powerExpr}.
	 * @param ctx the parse tree
	 */
	void enterPowPass(TypeScriptSimplificadoParser.PowPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code powPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#powerExpr}.
	 * @param ctx the parse tree
	 */
	void exitPowPass(TypeScriptSimplificadoParser.PowPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code notExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterNotExpr(TypeScriptSimplificadoParser.NotExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code notExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitNotExpr(TypeScriptSimplificadoParser.NotExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code negExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterNegExpr(TypeScriptSimplificadoParser.NegExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code negExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitNegExpr(TypeScriptSimplificadoParser.NegExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterUnaryPass(TypeScriptSimplificadoParser.UnaryPassContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryPass}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#unaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitUnaryPass(TypeScriptSimplificadoParser.UnaryPassContext ctx);
	/**
	 * Enter a parse tree produced by the {@code literalExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterLiteralExpr(TypeScriptSimplificadoParser.LiteralExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code literalExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitLiteralExpr(TypeScriptSimplificadoParser.LiteralExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(TypeScriptSimplificadoParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(TypeScriptSimplificadoParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayAccessExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterArrayAccessExpr(TypeScriptSimplificadoParser.ArrayAccessExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayAccessExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitArrayAccessExpr(TypeScriptSimplificadoParser.ArrayAccessExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code lengthExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterLengthExpr(TypeScriptSimplificadoParser.LengthExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code lengthExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitLengthExpr(TypeScriptSimplificadoParser.LengthExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code funcCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterFuncCallExpr(TypeScriptSimplificadoParser.FuncCallExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code funcCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitFuncCallExpr(TypeScriptSimplificadoParser.FuncCallExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mathFuncCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterMathFuncCallExpr(TypeScriptSimplificadoParser.MathFuncCallExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mathFuncCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitMathFuncCallExpr(TypeScriptSimplificadoParser.MathFuncCallExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code convFuncCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterConvFuncCallExpr(TypeScriptSimplificadoParser.ConvFuncCallExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code convFuncCallExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitConvFuncCallExpr(TypeScriptSimplificadoParser.ConvFuncCallExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayLitExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterArrayLitExpr(TypeScriptSimplificadoParser.ArrayLitExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayLitExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitArrayLitExpr(TypeScriptSimplificadoParser.ArrayLitExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parenExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void enterParenExpr(TypeScriptSimplificadoParser.ParenExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parenExpr}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#primaryExpr}.
	 * @param ctx the parse tree
	 */
	void exitParenExpr(TypeScriptSimplificadoParser.ParenExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code numberLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterNumberLiteral(TypeScriptSimplificadoParser.NumberLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code numberLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitNumberLiteral(TypeScriptSimplificadoParser.NumberLiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code stringLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterStringLiteral(TypeScriptSimplificadoParser.StringLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code stringLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitStringLiteral(TypeScriptSimplificadoParser.StringLiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code trueLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterTrueLiteral(TypeScriptSimplificadoParser.TrueLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code trueLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitTrueLiteral(TypeScriptSimplificadoParser.TrueLiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code falseLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterFalseLiteral(TypeScriptSimplificadoParser.FalseLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code falseLiteral}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitFalseLiteral(TypeScriptSimplificadoParser.FalseLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void enterArrayLiteral(TypeScriptSimplificadoParser.ArrayLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void exitArrayLiteral(TypeScriptSimplificadoParser.ArrayLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(TypeScriptSimplificadoParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(TypeScriptSimplificadoParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link TypeScriptSimplificadoParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void enterArgumentList(TypeScriptSimplificadoParser.ArgumentListContext ctx);
	/**
	 * Exit a parse tree produced by {@link TypeScriptSimplificadoParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void exitArgumentList(TypeScriptSimplificadoParser.ArgumentListContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mathSqrtCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#mathFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterMathSqrtCall(TypeScriptSimplificadoParser.MathSqrtCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mathSqrtCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#mathFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitMathSqrtCall(TypeScriptSimplificadoParser.MathSqrtCallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mathPowCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#mathFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterMathPowCall(TypeScriptSimplificadoParser.MathPowCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mathPowCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#mathFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitMathPowCall(TypeScriptSimplificadoParser.MathPowCallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parseIntCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#conversionFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterParseIntCall(TypeScriptSimplificadoParser.ParseIntCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parseIntCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#conversionFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitParseIntCall(TypeScriptSimplificadoParser.ParseIntCallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parseFloatCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#conversionFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterParseFloatCall(TypeScriptSimplificadoParser.ParseFloatCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parseFloatCall}
	 * labeled alternative in {@link TypeScriptSimplificadoParser#conversionFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitParseFloatCall(TypeScriptSimplificadoParser.ParseFloatCallContext ctx);
}