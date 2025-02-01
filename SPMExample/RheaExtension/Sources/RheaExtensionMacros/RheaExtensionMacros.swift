import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RheaWrapperMacro: DeclarationMacro {
    
    public static func expansion(
        of node: some SwiftSyntax.FreestandingMacroExpansionSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [DeclSyntax] {
        let argumentList = node.arguments
        var functionBody: String = ""
        var signature: String?
        
        for argument in argumentList {
            switch argument.label?.text {
            case "func":
                if let closureExpr = argument.expression.as(ClosureExprSyntax.self) {
                    functionBody = closureExpr.statements.description.trimmingCharacters(in: .whitespacesAndNewlines)
                    if let sig = closureExpr.signature {
                        signature = sig.description
                    }
                }
            default:
                break
            }
        }
        let declarationString = """
            #rhea(time: .load, func: { \(signature ?? "context in")
                \(functionBody)
            })
            """
        return [DeclSyntax(stringLiteral: declarationString)]
    }
}


@main
struct RheaExtensionPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        RheaWrapperMacro.self
    ]
}
