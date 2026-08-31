# ============================================
# 18_macros.jl
# 知识点：宏（metaprogramming）
# ============================================

println("--- 什么是宏？---")
println("宏是代码生成代码的工具，在编译时执行")

println("\n--- 常用内置宏：@time ---")
# 测量代码执行时间
@time sum(1:1000000)

println("\n--- @show：显示表达式和结果 ---")
x = 10
y = 20
@show x + y
@show x * y

println("\n--- @assert：断言 ---")
function divide(a, b)
    @assert b != 0 "除数不能为零"
    return a / b
end

println(divide(10, 2))

try
    divide(10, 0)
catch e
    println("断言失败: $e")
end

println("\n--- @which：查看调用的是哪个方法 ---")
f(x::Int) = "整数"
f(x::String) = "字符串"

@which f(42)
@which f("hello")

println("\n--- @code_lowered：查看编译后的代码 ---")
function square(x)
    return x^2
end

println("square 函数的低级表示:")
@code_lowered square(5)

println("\n--- @code_warntype：检查类型稳定性 ---")
function unstable_func(x)
    if x > 0
        return 1  # 返回 Int
    else
        return 1.0  # 返回 Float64
    end
end

println("类型不稳定的函数:")
@code_warntype unstable_func(5)

function stable_func(x)::Int
    if x > 0
        return 1
    else
        return 2
    end
end

println("类型稳定的函数:")
@code_warntype stable_func(5)

println("\n--- 创建自定义宏 ---")
# 宏用 macro 关键字定义
macro my_macro(expr)
    println("宏接收到表达式: $expr")
    return expr
end

@my_macro 1 + 2

println("\n--- 实战：自定义计时宏 ---")
macro mytime(expr)
    quote
        local t0 = time()
        local result = $(esc(expr))
        local t1 = time()
        println("执行时间: $(t1 - t0) 秒")
        result
    end
end

@mytime sum(1:1000000)

println("\n--- 实战：调试宏 ---")
macro debug(expr)
    quote
        println("执行: ", $(string(expr)))
        local result = $(esc(expr))
        println("结果: ", result)
        result
    end
end

x = @debug 3 + 5

println("\n--- quote 块（延迟执行代码）---")
# quote 创建表达式对象，不立即执行
expr = quote
    x = 10
    y = 20
    x + y
end

println("表达式类型: $(typeof(expr))")
println("表达式内容: $expr")
println("求值结果: $(eval(expr))")

println("\n--- 宏的实际应用：@inline ---")
# 建议编译器内联此函数（提高性能）
@inline function fast_add(a, b)
    return a + b
end

println("fast_add(3, 5) = $(fast_add(3, 5))")

println("\n--- @generated 函数（编译时生成代码）---")
@generated function get_type_name(x::T) where T
    return "类型是: $T"
end

println(get_type_name(42))
println(get_type_name("hello"))

println("\n--- 元编程：动态生成函数 ---")
# 生成一组数学函数
for op in (:add, :subtract, :multiply)
    f = if op == :add
        :+
    elseif op == :subtract
        :-
    else
        :*
    end

    @eval function $op(a, b)
        return $f(a, b)
    end
end

println("add(3, 5) = $(add(3, 5))")
println("subtract(10, 3) = $(subtract(10, 3))")
println("multiply(4, 6) = $(multiply(4, 6))")

println("\n--- 实战：简化属性访问 ---")
struct Person
    name::String
    age::Int
end

macro define_getters(struct_name, fields...)
    quote
        for field in $fields
            @eval function $(Symbol("get_", field))(obj::$struct_name)
                return obj.$field
            end
        end
    end
end

@define_getters Person name age

p = Person("Alice", 30)
println("get_name(p) = $(get_name(p))")
println("get_age(p) = $(get_age(p))")

println("\n--- 宏 vs 函数 ---")
println("函数: 运行时执行，操作值")
println("宏: 编译时执行，操作代码")

# 函数示例
normal_function(x) = x + 1

# 宏示例
macro add_one(expr)
    return :($(esc(expr)) + 1)
end

println("normal_function(5) = $(normal_function(5))")
println("@add_one 5 = $(@add_one 5)")

println("\n--- 常用内置宏总结 ---")
println("@time          - 测量执行时间")
println("@show          - 显示表达式和结果")
println("@assert        - 断言")
println("@which         - 查看方法")
println("@code_lowered  - 查看编译后代码")
println("@code_warntype - 检查类型稳定性")
println("@inline        - 建议内联")
println("@generated     - 编译时生成代码")
println("@eval          - 动态执行代码")

println("\n" * "="^40)
println("✅ 18_macros.jl 运行完毕")
