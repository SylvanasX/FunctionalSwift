//: Playground - noun: a place where people can play

precedencegroup ForwardApplication {
    associativity: left
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator |>: ForwardApplication

func incr(_ a: Int) -> Int {
    return a + 1
}

func square(_ a: Int) -> Int {
    return a * a
}



func |> <A, B>(a: A, f: (A) -> B) -> B {
    return f(a)
}


2 |> incr |> square

infix operator >>>: ForwardComposition


func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}

let fx = incr >>> square

fx(2)

2 |> incr >>> square



