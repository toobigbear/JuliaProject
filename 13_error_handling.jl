# ============================================
# 13_error_handling.jl
# 知识点：异常处理、try/catch、throw
# ============================================

println("--- 基本异常处理 ---")
function safe_divide(a, b)
    try
        result = a / b
        println("$a / $b = $result")
    catch e
        println("出错了: $e")
    end
end

safe_divide(10, 2)
safe_divide(10, 0)  # 除以零会触发异常

println("\n--- 捕获特定异常 ---")
function parse_number(s)
    try
        num = parse(Int, s)
        println("解析成功: $num")
    catch e
        if isa(e, ArgumentError)
            println("参数错误: \"$s\" 不是有效数字")
        else
            println("未知错误: $e")
        end
    end
end

parse_number("42")
parse_number("hello")

println("\n--- finally 块（无论是否出错都执行）---")
function read_file(filename)
    file = nothing
    try
        file = open(filename, "r")
        content = read(file, String)
        println("文件内容: $content")
    catch e
        println("读取文件失败: $e")
    finally
        if file !== nothing
            close(file)
            println("文件已关闭")
        end
    end
end

read_file("nonexistent.txt")

println("\n--- 抛出异常（throw）---")
function check_age(age)
    if age < 0
        throw(ArgumentError("年龄不能为负数"))
    elseif age > 150
        throw(DomainError(age, "年龄不合理"))
    else
        println("年龄: $age")
    end
end

try
    check_age(25)
    check_age(-5)
catch e
    println("捕获异常: $e")
end

println("\n--- 自定义异常类型 ---")
struct MyCustomError <: Exception
    msg::String
end

function risky_operation(x)
    if x < 0
        throw(MyCustomError("x 不能为负数"))
    end
    return sqrt(x)
end

try
    println(risky_operation(16))
    println(risky_operation(-4))
catch e
    if isa(e, MyCustomError)
        println("自定义错误: $(e.msg)")
    else
        println("其他错误: $e")
    end
end

println("\n--- @assert 宏（断言）---")
function calculate_bmi(weight, height)
    @assert weight > 0 "体重必须大于0"
    @assert height > 0 "身高必须大于0"
    bmi = weight / height^2
    return bmi
end

try
    println("BMI: $(calculate_bmi(70, 1.75))")
    println("BMI: $(calculate_bmi(-70, 1.75))")  # 触发断言
catch e
    println("断言失败: $e")
end

println("\n--- 常见内置异常类型 ---")
println("1. ArgumentError: 参数错误")
try
    sqrt(-1)  # Julia 会抛 DomainError
catch e
    println("   $(typeof(e)): $e")
end

println("2. BoundsError: 数组越界")
try
    arr = [1, 2, 3]
    println(arr[10])
catch e
    println("   $(typeof(e)): $e")
end

println("3. KeyError: 字典键不存在")
try
    d = Dict("a" => 1)
    println(d["b"])
catch e
    println("   $(typeof(e)): $e")
end

println("4. MethodError: 没有匹配的方法")
try
    "hello" + 5  # String + Int 没有定义
catch e
    println("   $(typeof(e)): $e")
end

println("5. DivideError: 整数除以零")
try
    div(10, 0)
catch e
    println("   $(typeof(e)): $e")
end

println("\n--- 实战：健壮的输入解析 ---")
function robust_input_parse(input)
    try
        value = parse(Float64, input)
        return value
    catch e
        if isa(e, ArgumentError)
            println("警告: \"$input\" 不是数字，返回默认值 0.0")
            return 0.0
        else
            rethrow(e)  # 重新抛出未预期的异常
        end
    end
end

println(robust_input_parse("3.14"))
println(robust_input_parse("abc"))

println("\n--- 实战：递归深度保护 ---")
function factorial_safe(n, depth=0)
    if depth > 1000
        throw(StackOverflowError())
    end

    if n < 0
        throw(DomainError(n, "阶乘不接受负数"))
    elseif n <= 1
        return 1
    else
        return n * factorial_safe(n-1, depth+1)
    end
end

try
    println("5! = $(factorial_safe(5))")
    println("(-3)! = $(factorial_safe(-3))")
catch e
    println("错误: $(typeof(e))")
end

println("\n--- error() vs throw() ---")
# error() 是抛出 ErrorException 的简便方法
function validate_positive(x)
    if x <= 0
        error("x 必须是正数，得到: $x")
    end
    return x
end

try
    validate_positive(-5)
catch e
    println("捕获: $e")
end

println("\n" * "="^40)
println("✅ 13_error_handling.jl 运行完毕")
