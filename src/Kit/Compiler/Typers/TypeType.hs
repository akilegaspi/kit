module Kit.Compiler.Typers.TypeType where

import Control.Monad
import Data.IORef
import Data.List
import Kit.Ast
import Kit.Compiler.Context
import Kit.Compiler.Module
import Kit.Compiler.Scope
import Kit.Compiler.TypeContext
import Kit.Compiler.TypedDecl
import Kit.Compiler.TypedExpr
import Kit.Compiler.Typers.Base
import Kit.Compiler.Typers.ConvertExpr
import Kit.Compiler.Typers.TypeExpression
import Kit.Compiler.Typers.TypeFunction
import Kit.Compiler.Typers.TypeVar
import Kit.Compiler.Unify
import Kit.Compiler.Utils
import Kit.Error
import Kit.Parser
import Kit.Str

typeTypeDefinition
  :: CompileContext -> Module -> TypeDefinition TypedExpr ConcreteType -> IO (Maybe TypedDecl, Bool)
typeTypeDefinition ctx mod def@(TypeDefinition { typeName = name }) = do
  debugLog ctx $ "typing " ++ s_unpack name ++ " in " ++ show mod
  -- TODO: handle params here
  tctx'     <- modTypeContext ctx mod
  let tctx = tctx' {tctxTypeParams = [(paramName param, ()) | param <- typeParams def]}
  -- TODO: type methods, variable defaults...
  return $ (Just $ DeclType def, True)
