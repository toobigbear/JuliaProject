# ============================================
# 10_functions.jl
# 知识点：函数定义、参数、返回值
# ============================================

println("--- 基本函数定义 ---")
function greet(name)
    println("Hello, $name!")
end

greet("Alice")
greet("Bob")

println("\n--- 函数返回值 ---")
function add(a, b)
    return a + b
end

result = add(3, 5)
println("add(3, 5) = $result")

# 不写 return，默认返回最后一行的值
function multiply(a, b)
    a * b  # 没有 return，也会返回结果
end
println("multiply(4, 6) = $(multiply(4, 6))")

println("\n--- 一行函数（简洁写法）---")
square(x) = x^2
cube(x) = x^3

println("square(5) = $(square(5))")
println("cube(3) = $(cube(3))")

println("\n--- 多个返回值（用元组）---")
function divmod_custom(a, b)
    quotient = div(a, b)
    remainder = mod(a, b)
    return (quotient, remainder)
end

q, r = divmod_custom(17, 5)
println("17 ÷ 5 = $q 余 $r")

println("\n--- 可选参数（带默认值）---")
function greet_with_title(name; title="Mr.")
    println("Hello, $title $name!")
end

greet_with_title("Smith")              # 用默认 title
greet_with_title("Johnson", title="Dr.")  # 指定 title

println("\n--- 关键字参数 vs 位置参数 ---")
# 位置参数：按顺序传
function power(base, exponent)
    return base^exponent
end
println("power(2, 3) = $(power(2, 3))")

# 关键字参数：用分号分隔，必须写参数名
function describe_person(name; age=0, city="Unknown")
    println("$name, $age 岁, 来自 $city")
end
describe_person("Alice", age=30, city="Beijing")
describe_person("Bob", city="Shanghai")  # age 用默认值

println("\n--- 可变参数（不定数量）---")
function sum_all(numbers...)
    total = 0
    for n in numbers
        total += n
    end
    return total
end

println("sum_all(1, 2, 3) = $(sum_all(1, 2, 3))")
println("sum_all(1, 2, 3, 4, 5) = $(sum_all(1, 2, 3, 4, 5))")

println("\n--- 匿名函数（lambda）---")
# 语法1：-> 箭头
f = x -> x^2
println("f(5) = $(f(5))")

# 语法2：function 关键字（匿名）
g = function(x)
    x * 2
end
println("g(10) = $(g(10))")

# 匿名函数常用于高阶函数
numbers = [1, 2, 3, 4, 5]
squared = map(x -> x^2, numbers)
println("map(x -> x^2, [1,2,3,4,5]) = $squared")

println("\n--- 高阶函数（函数作为参数）---")
function apply_twice(f, x)
    return f(f(x))
end

add_one(x) = x + 1
println("apply_twice(add_one, 5) = $(apply_twice(add_one, 5))")

println("\n--- 类型标注（可选，用于多重派发）---")
function process(x::Int)
    println("处理整数: $x")
end

function process(x::String)
    println("处理字符串: $x")
end

process(42)
process("hello")

println("\n--- 函数是一等公民 ---")
# 函数可以赋值给变量
my_func = add
println("my_func(10, 20) = $(my_func(10, 20))")

# 函数可以存在数组里
operations = [add, multiply]
println("operations[1](5, 3) = $(operations[1](5, 3))")
println("operations[2](5, 3) = $(operations[2](5, 3))")

println("\n--- 实战：斐波那契数列 ---")
function fib(n)
    if n <= 2
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end

println("fib(10) = $(fib(10))")

println("\n--- 实战：判断素数 ---")
function is_prime(n)
    if n < 2
        return false
    end
    for i in 2:Int(floor(sqrt(n)))
        if n % i == 0
            return false
        end
    end
    return true
end

println("is_prime(17) = $(is_prime(17))")
println("is_prime(20) = $(is_prime(20))")

println("\n" * "="^40)
println("✅ 10_functions.jl 运行完毕")
