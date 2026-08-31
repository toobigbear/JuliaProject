# ============================================
# 02_variables.jl
# 知识点：变量定义、类型、常量
# ============================================

println("--- 变量定义 ---")

# Julia 是动态类型语言，不用声明类型
x = 10              # 整数
y = 3.14            # 浮点数
name = "Alice"      # 字符串
is_student = true   # 布尔值

println("x = $x, 类型是 $(typeof(x))")
println("y = $y, 类型是 $(typeof(y))")
println("name = $name, 类型是 $(typeof(name))")
println("is_student = $is_student, 类型是 $(typeof(is_student))")

println("\n--- 类型标注（可选）---")
# 可以显式标注类型（但通常不需要）
a::Int = 100
b::Float64 = 2.718

println("a = $a, 类型是 $(typeof(a))")
println("b = $b, 类型是 $(typeof(b))")

println("\n--- 变量命名规则 ---")
# Julia 支持 Unicode 变量名！
π_value = 3.14159
Δx = 0.01
α = 0.5
println("π_value = $π_value")
println("Δx = $Δx")
println("α = $α")

# 常规命名
my_variable = 42
camelCase = "不推荐，Julia 习惯用蛇形"
snake_case = "推荐！"

println("\n--- 常量 ---")
# const 定义常量（不能重新赋值）
const GRAVITY = 9.8
const PI_APPROX = 3.14
println("重力加速度 = $GRAVITY")

# 如果尝试修改常量会警告
# GRAVITY = 10  # 取消注释试试，会报 warning

println("\n--- 类型转换 ---")
# 类型转换函数
int_val = trunc(Int, 3.99)   # 浮点转整数（截断）
float_val = Float64(42)       # 整数转浮点
str_val = string(123)         # 数字转字符串
num_from_str = parse(Int, "456")  # 字符串转数字

println("trunc(Int, 3.99) = $int_val")
println("Float64(42) = $float_val")
println("string(123) = \"$str_val\"")
println("parse(Int, \"456\") = $num_from_str")

println("\n--- 多重赋值 ---")
# 同时给多个变量赋值
p, q, r = 1, 2, 3
println("p=$p, q=$q, r=$r")

# 交换变量值（超简洁！）
p, q = q, p
println("交换后: p=$p, q=$q")

println("\n" * "="^40)
println("✅ 02_variables.jl 运行完毕")
