# ============================================
# 11_multiple_dispatch.jl
# 知识点：多重派发（Julia 最独特的特性）
# ============================================

println("--- 什么是多重派发？---")
println("同一个函数名，根据参数类型执行不同的代码")

# 定义同一个函数 f 的多个"方法"
function f(x::Int)
    println("整数: $x")
end

function f(x::String)
    println("字符串: $x")
end

function f(x::Float64)
    println("浮点数: $x")
end

# 调用时自动选择
f(42)        # 调用 Int 版本
f("hello")   # 调用 String 版本
f(3.14)      # 调用 Float64 版本

println("\n--- 多个参数的派发 ---")
function describe(x::Int, y::Int)
    println("两个整数: $x 和 $y")
end

function describe(x::String, y::String)
    println("两个字符串: $x 和 $y")
end

function describe(x::Int, y::String)
    println("整数和字符串: $x 和 $y")
end

describe(1, 2)
describe("a", "b")
describe(1, "a")

println("\n--- 实战：安全的除法 ---")
# 整数除法
function safe_divide(a::Int, b::Int)
    if b == 0
        return "错误：除数为零"
    else
        return div(a, b)
    end
end

# 浮点除法
function safe_divide(a::Float64, b::Float64)
    if b == 0.0
        return "错误：除数为零"
    else
        return a / b
    end
end

println("safe_divide(10, 3) = $(safe_divide(10, 3))")
println("safe_divide(10.0, 3.0) = $(safe_divide(10.0, 3.0))")
println("safe_divide(10, 0) = $(safe_divide(10, 0))")

println("\n--- 抽象类型派发 ---")
# Number 是 Int、Float64 等的父类型
function process_number(x::Number)
    println("这是一个数字: $x")
end

function process_number(x::String)
    println("这是一个字符串: $x")
end

process_number(42)      # Int 是 Number 的子类型
process_number(3.14)    # Float64 也是 Number 的子类型
process_number("hello")

println("\n--- 查看函数的所有方法 ---")
# methods() 函数可以查看一个函数有多少个方法
println("函数 f 有以下方法:")
for method in methods(f)
    println("  $method")
end

println("\n--- 实战：形状面积计算 ---")
# 定义不同的形状类型
struct Circle
    radius::Float64
end

struct Rectangle
    width::Float64
    height::Float64
end

struct Triangle
    base::Float64
    height::Float64
end

# 为不同形状定义 area 函数
function area(c::Circle)
    return π * c.radius^2
end

function area(r::Rectangle)
    return r.width * r.height
end

function area(t::Triangle)
    return 0.5 * t.base * t.height
end

# 使用
circle = Circle(5.0)
rectangle = Rectangle(4.0, 6.0)
triangle = Triangle(3.0, 8.0)

println("圆形面积: $(area(circle))")
println("矩形面积: $(area(rectangle))")
println("三角形面积: $(area(triangle))")

println("\n--- 多重派发 vs 传统 if-else ---")
println("传统写法（不推荐）:")
function area_traditional(shape)
    if isa(shape, Circle)
        return π * shape.radius^2
    elseif isa(shape, Rectangle)
        return shape.width * shape.height
    elseif isa(shape, Triangle)
        return 0.5 * shape.base * shape.height
    end
end
println("  area_traditional(circle) = $(area_traditional(circle))")

println("多重派发（推荐）: 更优雅、更易扩展")

println("\n--- 实战：运算符重载 ---")
# 为自定义类型定义加法
struct Point
    x::Float64
    y::Float64
end

# 重载 + 运算符
import Base: +
function +(p1::Point, p2::Point)
    return Point(p1.x + p2.x, p1.y + p2.y)
end

p1 = Point(1.0, 2.0)
p2 = Point(3.0, 4.0)
p3 = p1 + p2
println("p1 + p2 = Point($(p3.x), $(p3.y))")

println("\n--- 为什么多重派发重要？---")
println("1. 代码更模块化：每个类型独立实现自己的方法")
println("2. 易扩展：添加新类型只需添加新方法，不用改旧代码")
println("3. 性能高：Julia 编译器根据类型生成最优代码")
println("4. 这是 Julia 高性能的秘密武器之一")

println("\n" * "="^40)
println("✅ 11_multiple_dispatch.jl 运行完毕")
