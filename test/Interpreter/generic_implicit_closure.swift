// RUN: %target-run-simple-swift | FileCheck %s
// REQUIRES: executable_test

protocol BooleanProtocol {
  var boolValue: Bool { get }
}

extension Bool : BooleanProtocol {
  var boolValue: Bool { return self }
}

func andc<T : BooleanProtocol>(_ x: Bool, _ y: T) -> Bool {
  return x && !y.boolValue
}

struct Truthy : BooleanProtocol {
  var boolValue: Bool {
    return true
  }
}

struct Falselike : BooleanProtocol {
  var boolValue: Bool {
    return false
  }
}

print(andc(true, Truthy())) // CHECK: false
print(andc(false, Truthy())) // CHECK: false
print(andc(true, Falselike())) // CHECK: true
print(andc(false, Falselike())) // CHECK: false

func must<T : BooleanProtocol>(_ x: T) {
  assert(x.boolValue)
}
func shant<T : BooleanProtocol>(_ x: T) {
  assert(!x.boolValue)
}

must(Truthy())
shant(Falselike())

print("ok") // CHECK: ok
