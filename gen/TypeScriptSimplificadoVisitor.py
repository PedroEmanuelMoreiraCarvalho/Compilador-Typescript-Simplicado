# Generated from TypeScriptSimplificado.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .TypeScriptSimplificadoParser import TypeScriptSimplificadoParser
else:
    from TypeScriptSimplificadoParser import TypeScriptSimplificadoParser

# This class defines a complete generic visitor for a parse tree produced by TypeScriptSimplificadoParser.

class TypeScriptSimplificadoVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by TypeScriptSimplificadoParser#program.
    def visitProgram(self, ctx:TypeScriptSimplificadoParser.ProgramContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#functionDecl.
    def visitFunctionDecl(self, ctx:TypeScriptSimplificadoParser.FunctionDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#returnType.
    def visitReturnType(self, ctx:TypeScriptSimplificadoParser.ReturnTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#paramList.
    def visitParamList(self, ctx:TypeScriptSimplificadoParser.ParamListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#param.
    def visitParam(self, ctx:TypeScriptSimplificadoParser.ParamContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#numberType.
    def visitNumberType(self, ctx:TypeScriptSimplificadoParser.NumberTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#stringType.
    def visitStringType(self, ctx:TypeScriptSimplificadoParser.StringTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#booleanType.
    def visitBooleanType(self, ctx:TypeScriptSimplificadoParser.BooleanTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#numberArrayType.
    def visitNumberArrayType(self, ctx:TypeScriptSimplificadoParser.NumberArrayTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#stringArrayType.
    def visitStringArrayType(self, ctx:TypeScriptSimplificadoParser.StringArrayTypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#varDeclStmt.
    def visitVarDeclStmt(self, ctx:TypeScriptSimplificadoParser.VarDeclStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#assignStmt.
    def visitAssignStmt(self, ctx:TypeScriptSimplificadoParser.AssignStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#ifStmt.
    def visitIfStmt(self, ctx:TypeScriptSimplificadoParser.IfStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#whileStmt.
    def visitWhileStmt(self, ctx:TypeScriptSimplificadoParser.WhileStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#forStmt.
    def visitForStmt(self, ctx:TypeScriptSimplificadoParser.ForStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#retStmt.
    def visitRetStmt(self, ctx:TypeScriptSimplificadoParser.RetStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#consoleStmt.
    def visitConsoleStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#exprStmt.
    def visitExprStmt(self, ctx:TypeScriptSimplificadoParser.ExprStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#blockStmt.
    def visitBlockStmt(self, ctx:TypeScriptSimplificadoParser.BlockStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#block.
    def visitBlock(self, ctx:TypeScriptSimplificadoParser.BlockContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#letDecl.
    def visitLetDecl(self, ctx:TypeScriptSimplificadoParser.LetDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#constDecl.
    def visitConstDecl(self, ctx:TypeScriptSimplificadoParser.ConstDeclContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#assignmentStmt.
    def visitAssignmentStmt(self, ctx:TypeScriptSimplificadoParser.AssignmentStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#idLvalue.
    def visitIdLvalue(self, ctx:TypeScriptSimplificadoParser.IdLvalueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#arrayAccessLvalue.
    def visitArrayAccessLvalue(self, ctx:TypeScriptSimplificadoParser.ArrayAccessLvalueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#lengthAccessLvalue.
    def visitLengthAccessLvalue(self, ctx:TypeScriptSimplificadoParser.LengthAccessLvalueContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#ifStatement.
    def visitIfStatement(self, ctx:TypeScriptSimplificadoParser.IfStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#whileStatement.
    def visitWhileStatement(self, ctx:TypeScriptSimplificadoParser.WhileStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#forStatement.
    def visitForStatement(self, ctx:TypeScriptSimplificadoParser.ForStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#forInit.
    def visitForInit(self, ctx:TypeScriptSimplificadoParser.ForInitContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#forUpdate.
    def visitForUpdate(self, ctx:TypeScriptSimplificadoParser.ForUpdateContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#returnStatement.
    def visitReturnStatement(self, ctx:TypeScriptSimplificadoParser.ReturnStatementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#consoleLogStmt.
    def visitConsoleLogStmt(self, ctx:TypeScriptSimplificadoParser.ConsoleLogStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#expressionStmt.
    def visitExpressionStmt(self, ctx:TypeScriptSimplificadoParser.ExpressionStmtContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#expressionList.
    def visitExpressionList(self, ctx:TypeScriptSimplificadoParser.ExpressionListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#expression.
    def visitExpression(self, ctx:TypeScriptSimplificadoParser.ExpressionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#orPass.
    def visitOrPass(self, ctx:TypeScriptSimplificadoParser.OrPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#orExpr.
    def visitOrExpr(self, ctx:TypeScriptSimplificadoParser.OrExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#andPass.
    def visitAndPass(self, ctx:TypeScriptSimplificadoParser.AndPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#andExpr.
    def visitAndExpr(self, ctx:TypeScriptSimplificadoParser.AndExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#eqExpr.
    def visitEqExpr(self, ctx:TypeScriptSimplificadoParser.EqExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#eqPass.
    def visitEqPass(self, ctx:TypeScriptSimplificadoParser.EqPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#neqExpr.
    def visitNeqExpr(self, ctx:TypeScriptSimplificadoParser.NeqExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#geExpr.
    def visitGeExpr(self, ctx:TypeScriptSimplificadoParser.GeExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#ltExpr.
    def visitLtExpr(self, ctx:TypeScriptSimplificadoParser.LtExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#gtExpr.
    def visitGtExpr(self, ctx:TypeScriptSimplificadoParser.GtExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#leExpr.
    def visitLeExpr(self, ctx:TypeScriptSimplificadoParser.LeExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#relPass.
    def visitRelPass(self, ctx:TypeScriptSimplificadoParser.RelPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#addExpr.
    def visitAddExpr(self, ctx:TypeScriptSimplificadoParser.AddExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#addPass.
    def visitAddPass(self, ctx:TypeScriptSimplificadoParser.AddPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#subExpr.
    def visitSubExpr(self, ctx:TypeScriptSimplificadoParser.SubExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#mulPass.
    def visitMulPass(self, ctx:TypeScriptSimplificadoParser.MulPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#modExpr.
    def visitModExpr(self, ctx:TypeScriptSimplificadoParser.ModExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#mulExpr.
    def visitMulExpr(self, ctx:TypeScriptSimplificadoParser.MulExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#divExpr.
    def visitDivExpr(self, ctx:TypeScriptSimplificadoParser.DivExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#powExpr.
    def visitPowExpr(self, ctx:TypeScriptSimplificadoParser.PowExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#powPass.
    def visitPowPass(self, ctx:TypeScriptSimplificadoParser.PowPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#notExpr.
    def visitNotExpr(self, ctx:TypeScriptSimplificadoParser.NotExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#negExpr.
    def visitNegExpr(self, ctx:TypeScriptSimplificadoParser.NegExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#unaryPass.
    def visitUnaryPass(self, ctx:TypeScriptSimplificadoParser.UnaryPassContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#literalExpr.
    def visitLiteralExpr(self, ctx:TypeScriptSimplificadoParser.LiteralExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#idExpr.
    def visitIdExpr(self, ctx:TypeScriptSimplificadoParser.IdExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#arrayAccessExpr.
    def visitArrayAccessExpr(self, ctx:TypeScriptSimplificadoParser.ArrayAccessExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#lengthExpr.
    def visitLengthExpr(self, ctx:TypeScriptSimplificadoParser.LengthExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#funcCallExpr.
    def visitFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.FuncCallExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#mathFuncCallExpr.
    def visitMathFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.MathFuncCallExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#convFuncCallExpr.
    def visitConvFuncCallExpr(self, ctx:TypeScriptSimplificadoParser.ConvFuncCallExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#arrayLitExpr.
    def visitArrayLitExpr(self, ctx:TypeScriptSimplificadoParser.ArrayLitExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#parenExpr.
    def visitParenExpr(self, ctx:TypeScriptSimplificadoParser.ParenExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#numberLiteral.
    def visitNumberLiteral(self, ctx:TypeScriptSimplificadoParser.NumberLiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#stringLiteral.
    def visitStringLiteral(self, ctx:TypeScriptSimplificadoParser.StringLiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#trueLiteral.
    def visitTrueLiteral(self, ctx:TypeScriptSimplificadoParser.TrueLiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#falseLiteral.
    def visitFalseLiteral(self, ctx:TypeScriptSimplificadoParser.FalseLiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#arrayLiteral.
    def visitArrayLiteral(self, ctx:TypeScriptSimplificadoParser.ArrayLiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#functionCall.
    def visitFunctionCall(self, ctx:TypeScriptSimplificadoParser.FunctionCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#argumentList.
    def visitArgumentList(self, ctx:TypeScriptSimplificadoParser.ArgumentListContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#mathSqrtCall.
    def visitMathSqrtCall(self, ctx:TypeScriptSimplificadoParser.MathSqrtCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#mathPowCall.
    def visitMathPowCall(self, ctx:TypeScriptSimplificadoParser.MathPowCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#parseIntCall.
    def visitParseIntCall(self, ctx:TypeScriptSimplificadoParser.ParseIntCallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by TypeScriptSimplificadoParser#parseFloatCall.
    def visitParseFloatCall(self, ctx:TypeScriptSimplificadoParser.ParseFloatCallContext):
        return self.visitChildren(ctx)



del TypeScriptSimplificadoParser