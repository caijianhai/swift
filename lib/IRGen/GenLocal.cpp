//===--- GenLocal.cpp - IR Generation for Local Declarations --------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
//
//  This file implements IR generation for local declarations in Swift.
//
//===----------------------------------------------------------------------===//

#include "swift/AST/Decl.h"
#include "IRGenFunction.h"

using namespace swift;
using namespace irgen;

void IRGenFunction::emitLocal(Decl *D) {
  unimplemented(D->getLocStart(), "local decl emission is unimplemented");
}

LValue IRGenFunction::getLocal(ValueDecl *D) {
  auto I = Locals.find(D);
  assert(I != Locals.end() && "no entry in local map!");
  return I->second;
}
