//
//  Function_TypesApp.swift
//  Function Types
//
//  Created by MacBook Air on 2022/07/04.
//

// <함수 형>

// 함수의 형은 파라미터 형과(parameter types) 반환 형(return types)으로 구성되어 있다. 아래 두 함수는 Int 값 2개를 입력받고 Int
// 를 반환하는 함수이다.

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// 아래는 입력 받는 파라미터와 반환 값이 없는 함수이다.

func printHelloWorld() {
    print("hello, world")
}

// <함수 형의 사용>

// 아래와 같이 함수를 변수처럼 정의해서 사용할 수 있다.

var mathFunction: (Int, Int) -> Int = addTwoInts

// 변수 mathFunction는 addTwoInts 함수의 인잦 값과 반환 값이 같으므로 이 함수가 변수로 할당될 수 있다. 아래는 이렇게 변수에 함수를
// 할당해 사용한 예시이다.

print("Result: \(mathFunction(2,3))")
// Prints "Result: 5"

// multiplyTwoInts 함수도 mathFunction과 함수형이 같으므로 할당하여 사용할 수 있다.

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

// 변수나 상수에 함수를 할당할 때 직접 함수 형을 선언하지 않아도 Swift가 형을 추론하여 자동으로 함수를 할당할 수 있다.
let anotherMathFunction = addTwoInts
// anotherMathFunctuon is inferred to be of type (Int, Int) -> Int

// 파라미터 형으로써의 함수 형 (Function Types as Parameter Types)

// 파라미터에 함수 형을 사용할 수 있다.

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8"

// <반환 형으로써의 함수 형>

// 함수르 반환하는 함수를 만들수도 있다.

func stepForward(_ input: Int) -> Int {
    return input + 3
}

func stepBackWard(_ input: Int) -> Int {
    return input - 3
}

// 입력한 step에 하나를 더하거나 빼는 함수를 선언하였다. 이 함수를 리턴값으로 사용할 수 있다. 아래 코드는 backward 함수가 true나
// false 냐에 따라서 위에서 선언한 적절한 함수를 반환하는 함수이다.

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackWard : stepForward
}

// 위 함수를 사용한 예시는 다음과 같다.


// <중첩 함수>

// 지금까지 함수는 전역적으로 동작하도록 설정하였다. 함수 중에는 다른 함수 안의 body에서 동작하는 함수가 있는데 이 함수를 중첩 함수라 한다.
// 중첩함수는 함수 밖에서는 감춰져있고 함수의 body 내에서 접근이 가능하다. 위의 chooseStepFunction 을 중첩 함수를 이용해 아래 처럼
// 다시 작성할 수 있다.

func StepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 중첩되있는 stepForward() 함수를 가르친다.
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
    
let input = readLine()
let n = Int(readLine()!)!
print(type(of:n))
    
    
    







