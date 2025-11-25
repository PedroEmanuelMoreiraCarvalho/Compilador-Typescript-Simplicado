# Generated from TypeScriptSimplificado.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
else:
    from TypeScriptSimplificadoParser import TypeScriptSimplificadoParser

# This class defines a complete listener for a parse tree produced by TypeScriptSimplificadoParser.
class TypeScriptSimplificadoListener(ParseTreeListener):

    # Enter a parse tree produced by TypeScriptSimplificadoParser#program.
    def enterProgram(self, ctx:TypeScriptSimplificadoParser.ProgramContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#program.
    def exitProgram(self, ctx:TypeScriptSimplificadoParser.ProgramContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#functionDecl.
    def enterFunctionDecl(self, ctx:TypeScriptSimplificadoParser.FunctionDeclContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#functionDecl.
    def exitFunctionDecl(self, ctx:TypeScriptSimplificadoParser.FunctionDeclContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#returnType.
    def enterReturnType(self, ctx:TypeScriptSimplificadoParser.ReturnTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#returnType.
    def exitReturnType(self, ctx:TypeScriptSimplificadoParser.ReturnTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#paramList.
    def enterParamList(self, ctx:TypeScriptSimplificadoParser.ParamListContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#paramList.
    def exitParamList(self, ctx:TypeScriptSimplificadoParser.ParamListContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#param.
    def enterParam(self, ctx:TypeScriptSimplificadoParser.ParamContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#param.
    def exitParam(self, ctx:TypeScriptSimplificadoParser.ParamContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#numberType.
    def enterNumberType(self, ctx:TypeScriptSimplificadoParser.NumberTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#numberType.
    def exitNumberType(self, ctx:TypeScriptSimplificadoParser.NumberTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#stringType.
    def enterStringType(self, ctx:TypeScriptSimplificadoParser.StringTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#stringType.
    def exitStringType(self, ctx:TypeScriptSimplificadoParser.StringTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#booleanType.
    def enterBooleanType(self, ctx:TypeScriptSimplificadoParser.BooleanTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#booleanType.
    def exitBooleanType(self, ctx:TypeScriptSimplificadoParser.BooleanTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#numberArrayType.
    def enterNumberArrayType(self, ctx:TypeScriptSimplificadoParser.NumberArrayTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#numberArrayType.
    def exitNumberArrayType(self, ctx:TypeScriptSimplificadoParser.NumberArrayTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#stringArrayType.
    def enterStringArrayType(self, ctx:TypeScriptSimplificadoParser.StringArrayTypeContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#stringArrayType.
    def exitStringArrayType(self, ctx:TypeScriptSimplificadoParser.StringArrayTypeContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#varDeclStmt.
    def enterVarDeclStmt(self, ctx:TypeScriptSimplificadoParser.VarDeclStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#varDeclStmt.
    def exitVarDeclStmt(self, ctx:TypeScriptSimplificadoParser.VarDeclStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#assignStmt.
    def enterAssignStmt(self, ctx:TypeScriptSimplificadoParser.AssignStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#assignStmt.
    def exitAssignStmt(self, ctx:TypeScriptSimplificadoParser.AssignStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#ifStmt.
    def enterIfStmt(self, ctx:TypeScriptSimplificadoParser.IfStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#ifStmt.
    def exitIfStmt(self, ctx:TypeScriptSimplificadoParser.IfStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#whileStmt.
    def enterWhileStmt(self, ctx:TypeScriptSimplificadoParser.WhileStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#whileStmt.
    def exitWhileStmt(self, ctx:TypeScriptSimplificadoParser.WhileStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#forStmt.
    def enterForStmt(self, ctx:TypeScriptSimplificadoParser.ForStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#forStmt.
    def exitForStmt(self, ctx:TypeScriptSimplificadoParser.ForStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#retStmt.
    def enterRetStmt(self, ctx:TypeScriptSimplificadoParser.RetStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#retStmt.
    def exitRetStmt(self, ctx:TypeScriptSimplificadoParser.RetStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#consoleStmt.
    def enterConsoleStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#consoleStmt.
    def exitConsoleStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#exprStmt.
    def enterExprStmt(self, ctx:TypeScriptSimplificadoParser.ExprStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#exprStmt.
    def exitExprStmt(self, ctx:TypeScriptSimplificadoParser.ExprStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#blockStmt.
    def enterBlockStmt(self, ctx:TypeScriptSimplificadoParser.BlockStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#blockStmt.
    def exitBlockStmt(self, ctx:TypeScriptSimplificadoParser.BlockStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#block.
    def enterBlock(self, ctx:TypeScriptSimplificadoParser.BlockContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#block.
    def exitBlock(self, ctx:TypeScriptSimplificadoParser.BlockContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#letDecl.
    def enterLetDecl(self, ctx:TypeScriptSimplificadoParser.LetDeclContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#letDecl.
    def exitLetDecl(self, ctx:TypeScriptSimplificadoParser.LetDeclContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#constDecl.
    def enterConstDecl(self, ctx:TypeScriptSimplificadoParser.ConstDeclContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#constDecl.
    def exitConstDecl(self, ctx:TypeScriptSimplificadoParser.ConstDeclContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#assignmentStmt.
    def enterAssignmentStmt(self, ctx:TypeScriptSimplificadoParser.AssignmentStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#assignmentStmt.
    def exitAssignmentStmt(self, ctx:TypeScriptSimplificadoParser.AssignmentStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#idLvalue.
    def enterIdLvalue(self, ctx:TypeScriptSimplificadoParser.IdLvalueContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#idLvalue.
    def exitIdLvalue(self, ctx:TypeScriptSimplificadoParser.IdLvalueContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#arrayAccessLvalue.
    def enterArrayAccessLvalue(self, ctx:TypeScriptSimplificadoParser.ArrayAccessLvalueContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#arrayAccessLvalue.
    def exitArrayAccessLvalue(self, ctx:TypeScriptSimplificadoParser.ArrayAccessLvalueContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#lengthAccessLvalue.
    def enterLengthAccessLvalue(self, ctx:TypeScriptSimplificadoParser.LengthAccessLvalueContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#lengthAccessLvalue.
    def exitLengthAccessLvalue(self, ctx:TypeScriptSimplificadoParser.LengthAccessLvalueContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#ifStatement.
    def enterIfStatement(self, ctx:TypeScriptSimplificadoParser.IfStatementContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#ifStatement.
    def exitIfStatement(self, ctx:TypeScriptSimplificadoParser.IfStatementContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#whileStatement.
    def enterWhileStatement(self, ctx:TypeScriptSimplificadoParser.WhileStatementContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#whileStatement.
    def exitWhileStatement(self, ctx:TypeScriptSimplificadoParser.WhileStatementContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#forStatement.
    def enterForStatement(self, ctx:TypeScriptSimplificadoParser.ForStatementContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#forStatement.
    def exitForStatement(self, ctx:TypeScriptSimplificadoParser.ForStatementContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#forInit.
    def enterForInit(self, ctx:TypeScriptSimplificadoParser.ForInitContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#forInit.
    def exitForInit(self, ctx:TypeScriptSimplificadoParser.ForInitContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#forUpdate.
    def enterForUpdate(self, ctx:TypeScriptSimplificadoParser.ForUpdateContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#forUpdate.
    def exitForUpdate(self, ctx:TypeScriptSimplificadoParser.ForUpdateContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#returnStatement.
    def enterReturnStatement(self, ctx:TypeScriptSimplificadoParser.ReturnStatementContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#returnStatement.
    def exitReturnStatement(self, ctx:TypeScriptSimplificadoParser.ReturnStatementContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#consoleLogStmt.
    def enterConsoleLogStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleLogStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#consoleLogStmt.
    def exitConsoleLogStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleLogStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#expressionStmt.
    def enterExpressionStmt(self, ctx:TypeScriptSimplificadoParser.ExpressionStmtContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#expressionStmt.
    def exitExpressionStmt(self, ctx:TypeScriptSimplificadoParser.ExpressionStmtContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#expressionList.
    def enterExpressionList(self, ctx:TypeScriptSimplificadoParser.ExpressionListContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#expressionList.
    def exitExpressionList(self, ctx:TypeScriptSimplificadoParser.ExpressionListContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#expression.
    def enterExpression(self, ctx:TypeScriptSimplificadoParser.ExpressionContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#expression.
    def exitExpression(self, ctx:TypeScriptSimplificadoParser.ExpressionContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#orPass.
    def enterOrPass(self, ctx:TypeScriptSimplificadoParser.OrPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#orPass.
    def exitOrPass(self, ctx:TypeScriptSimplificadoParser.OrPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#orExpr.
    def enterOrExpr(self, ctx:TypeScriptSimplificadoParser.OrExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#orExpr.
    def exitOrExpr(self, ctx:TypeScriptSimplificadoParser.OrExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#andPass.
    def enterAndPass(self, ctx:TypeScriptSimplificadoParser.AndPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#andPass.
    def exitAndPass(self, ctx:TypeScriptSimplificadoParser.AndPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#andExpr.
    def enterAndExpr(self, ctx:TypeScriptSimplificadoParser.AndExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#andExpr.
    def exitAndExpr(self, ctx:TypeScriptSimplificadoParser.AndExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#eqExpr.
    def enterEqExpr(self, ctx:TypeScriptSimplificadoParser.EqExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#eqExpr.
    def exitEqExpr(self, ctx:TypeScriptSimplificadoParser.EqExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#eqPass.
    def enterEqPass(self, ctx:TypeScriptSimplificadoParser.EqPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#eqPass.
    def exitEqPass(self, ctx:TypeScriptSimplificadoParser.EqPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#neqExpr.
    def enterNeqExpr(self, ctx:TypeScriptSimplificadoParser.NeqExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#neqExpr.
    def exitNeqExpr(self, ctx:TypeScriptSimplificadoParser.NeqExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#geExpr.
    def enterGeExpr(self, ctx:TypeScriptSimplificadoParser.GeExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#geExpr.
    def exitGeExpr(self, ctx:TypeScriptSimplificadoParser.GeExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#ltExpr.
    def enterLtExpr(self, ctx:TypeScriptSimplificadoParser.LtExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#ltExpr.
    def exitLtExpr(self, ctx:TypeScriptSimplificadoParser.LtExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#gtExpr.
    def enterGtExpr(self, ctx:TypeScriptSimplificadoParser.GtExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#gtExpr.
    def exitGtExpr(self, ctx:TypeScriptSimplificadoParser.GtExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#leExpr.
    def enterLeExpr(self, ctx:TypeScriptSimplificadoParser.LeExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#leExpr.
    def exitLeExpr(self, ctx:TypeScriptSimplificadoParser.LeExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#relPass.
    def enterRelPass(self, ctx:TypeScriptSimplificadoParser.RelPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#relPass.
    def exitRelPass(self, ctx:TypeScriptSimplificadoParser.RelPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#addExpr.
    def enterAddExpr(self, ctx:TypeScriptSimplificadoParser.AddExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#addExpr.
    def exitAddExpr(self, ctx:TypeScriptSimplificadoParser.AddExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#addPass.
    def enterAddPass(self, ctx:TypeScriptSimplificadoParser.AddPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#addPass.
    def exitAddPass(self, ctx:TypeScriptSimplificadoParser.AddPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#subExpr.
    def enterSubExpr(self, ctx:TypeScriptSimplificadoParser.SubExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#subExpr.
    def exitSubExpr(self, ctx:TypeScriptSimplificadoParser.SubExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#mulPass.
    def enterMulPass(self, ctx:TypeScriptSimplificadoParser.MulPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#mulPass.
    def exitMulPass(self, ctx:TypeScriptSimplificadoParser.MulPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#modExpr.
    def enterModExpr(self, ctx:TypeScriptSimplificadoParser.ModExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#modExpr.
    def exitModExpr(self, ctx:TypeScriptSimplificadoParser.ModExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#mulExpr.
    def enterMulExpr(self, ctx:TypeScriptSimplificadoParser.MulExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#mulExpr.
    def exitMulExpr(self, ctx:TypeScriptSimplificadoParser.MulExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#divExpr.
    def enterDivExpr(self, ctx:TypeScriptSimplificadoParser.DivExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#divExpr.
    def exitDivExpr(self, ctx:TypeScriptSimplificadoParser.DivExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#powExpr.
    def enterPowExpr(self, ctx:TypeScriptSimplificadoParser.PowExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#powExpr.
    def exitPowExpr(self, ctx:TypeScriptSimplificadoParser.PowExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#powPass.
    def enterPowPass(self, ctx:TypeScriptSimplificadoParser.PowPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#powPass.
    def exitPowPass(self, ctx:TypeScriptSimplificadoParser.PowPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#notExpr.
    def enterNotExpr(self, ctx:TypeScriptSimplificadoParser.NotExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#notExpr.
    def exitNotExpr(self, ctx:TypeScriptSimplificadoParser.NotExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#negExpr.
    def enterNegExpr(self, ctx:TypeScriptSimplificadoParser.NegExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#negExpr.
    def exitNegExpr(self, ctx:TypeScriptSimplificadoParser.NegExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#unaryPass.
    def enterUnaryPass(self, ctx:TypeScriptSimplificadoParser.UnaryPassContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#unaryPass.
    def exitUnaryPass(self, ctx:TypeScriptSimplificadoParser.UnaryPassContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#literalExpr.
    def enterLiteralExpr(self, ctx:TypeScriptSimplificadoParser.LiteralExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#literalExpr.
    def exitLiteralExpr(self, ctx:TypeScriptSimplificadoParser.LiteralExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#idExpr.
    def enterIdExpr(self, ctx:TypeScriptSimplificadoParser.IdExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#idExpr.
    def exitIdExpr(self, ctx:TypeScriptSimplificadoParser.IdExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#arrayAccessExpr.
    def enterArrayAccessExpr(self, ctx:TypeScriptSimplificadoParser.ArrayAccessExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#arrayAccessExpr.
    def exitArrayAccessExpr(self, ctx:TypeScriptSimplificadoParser.ArrayAccessExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#lengthExpr.
    def enterLengthExpr(self, ctx:TypeScriptSimplificadoParser.LengthExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#lengthExpr.
    def exitLengthExpr(self, ctx:TypeScriptSimplificadoParser.LengthExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#funcCallExpr.
    def enterFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.FuncCallExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#funcCallExpr.
    def exitFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.FuncCallExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#mathFuncCallExpr.
    def enterMathFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.MathFuncCallExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#mathFuncCallExpr.
    def exitMathFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.MathFuncCallExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#convFuncCallExpr.
    def enterConvFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.ConvFuncCallExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#convFuncCallExpr.
    def exitConvFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.ConvFuncCallExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#arrayLitExpr.
    def enterArrayLitExpr(self, ctx:TypeScriptSimplificadoParser.ArrayLitExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#arrayLitExpr.
    def exitArrayLitExpr(self, ctx:TypeScriptSimplificadoParser.ArrayLitExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#parenExpr.
    def enterParenExpr(self, ctx:TypeScriptSimplificadoParser.ParenExprContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#parenExpr.
    def exitParenExpr(self, ctx:TypeScriptSimplificadoParser.ParenExprContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#numberLiteral.
    def enterNumberLiteral(self, ctx:TypeScriptSimplificadoParser.NumberLiteralContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#numberLiteral.
    def exitNumberLiteral(self, ctx:TypeScriptSimplificadoParser.NumberLiteralContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#stringLiteral.
    def enterStringLiteral(self, ctx:TypeScriptSimplificadoParser.StringLiteralContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#stringLiteral.
    def exitStringLiteral(self, ctx:TypeScriptSimplificadoParser.StringLiteralContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#trueLiteral.
    def enterTrueLiteral(self, ctx:TypeScriptSimplificadoParser.TrueLiteralContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#trueLiteral.
    def exitTrueLiteral(self, ctx:TypeScriptSimplificadoParser.TrueLiteralContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#falseLiteral.
    def enterFalseLiteral(self, ctx:TypeScriptSimplificadoParser.FalseLiteralContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#falseLiteral.
    def exitFalseLiteral(self, ctx:TypeScriptSimplificadoParser.FalseLiteralContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#arrayLiteral.
    def enterArrayLiteral(self, ctx:TypeScriptSimplificadoParser.ArrayLiteralContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#arrayLiteral.
    def exitArrayLiteral(self, ctx:TypeScriptSimplificadoParser.ArrayLiteralContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#functionCall.
    def enterFunctionCall(self, ctx:TypeScriptSimplificadoParser.FunctionCallContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#functionCall.
    def exitFunctionCall(self, ctx:TypeScriptSimplificadoParser.FunctionCallContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#argumentList.
    def enterArgumentList(self, ctx:TypeScriptSimplificadoParser.ArgumentListContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#argumentList.
    def exitArgumentList(self, ctx:TypeScriptSimplificadoParser.ArgumentListContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#mathSqrtCall.
    def enterMathSqrtCall(self, ctx:TypeScriptSimplificadoParser.MathSqrtCallContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#mathSqrtCall.
    def exitMathSqrtCall(self, ctx:TypeScriptSimplificadoParser.MathSqrtCallContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#mathPowCall.
    def enterMathPowCall(self, ctx:TypeScriptSimplificadoParser.MathPowCallContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#mathPowCall.
    def exitMathPowCall(self, ctx:TypeScriptSimplificadoParser.MathPowCallContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#parseIntCall.
    def enterParseIntCall(self, ctx:TypeScriptSimplificadoParser.ParseIntCallContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#parseIntCall.
    def exitParseIntCall(self, ctx:TypeScriptSimplificadoParser.ParseIntCallContext):
        pass


    # Enter a parse tree produced by TypeScriptSimplificadoParser#parseFloatCall.
    def enterParseFloatCall(self, ctx:TypeScriptSimplificadoParser.ParseFloatCallContext):
        pass

    # Exit a parse tree produced by TypeScriptSimplificadoParser#parseFloatCall.
    def exitParseFloatCall(self, ctx:TypeScriptSimplificadoParser.ParseFloatCallContext):
        pass



del TypeScriptSimplificadoParser