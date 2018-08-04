module Kit.Compiler.Typers.TypeTrait where

import Control.Monad
import Data.List
import Kit.Ast
import Kit.Compiler.Context
import Kit.Compiler.Module
import Kit.Compiler.Scope
import Kit.Compiler.TypeContext
import Kit.Compiler.TypedDecl
import Kit.Compiler.TypedExpr
import Kit.Compiler.Typers.Base
import Kit.Compiler.Unify
import Kit.Error
import Kit.Parser
import Kit.Str

typeTrait
  :: CompileContext
  -> Module
  -> TraitDefinition TypedExpr ConcreteType
  -> IO (Maybe TypedDecl, Bool)
typeTrait ctx mod def = do
  -- TODO
  return (Nothing, True)
