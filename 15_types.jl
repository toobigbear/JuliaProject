# ============================================
# 15_types.jl
# 知识点：Julia 类型系统
# ============================================

println("--- 类型层级 ---")
# 查看类型的父类型
println("Int64 的父类型: $(supertype(Int64))")
println("Signed 的父类型: $(supertype(Signed))")
println("Integer 的父类型: $(supertype(Integer))")
println("Real 的父类型: $(supertype(Real))")
println("Number 的父类型: $(supertype(Number))")
println("Any 是根类型")

println("\n--- 类型树 ---")
println("Any")
println("└─ Number")
println("   ├─ Complex")
println("   └─ Real")
println("      ├─ AbstractFloat")
println("      │  ├─ Float16")
println("      │  ├─ Float32")
println("      │  └─ Float64")
println("      ├─ Integer")
println("      │  ├─ Signed")
println("      │  │  ├─ Int8")
println("      │  │  ├─ Int16")
println("      │  │  ├─ Int32")
println("      │  │  ├─ Int64")
println("      │  │  └─ Int128")
println("      │  └─ Unsigned")
println("      └─ Rational")

println("\n--- 检查类型 ---")
x = 42
y = 3.14
z = "hello"

println("typeof($x) = $(typeof(x))")
println("typeof($y) = $(typeof(y))")
println("typeof($z) = $(typeof(z))")

println("\nisa 判断类型:")
println("isa(42, Int) = $(isa(42, Int))")
println("isa(42, Number) = $(isa(42, Number))")
println("isa(42, String) = $(isa(42, String))")
println("isa(3.14, Real) = $(isa(3.14, Real))")

println("\n--- 抽象类型 vs 具体类型 ---")
# 抽象类型不能实例化
println("Int64 是具体类型: $(isconcretetype(Int64))")
println("Number 是具体类型: $(isconcretetype(Number))")
println("Number 是抽象类型: $(isabstracttype(Number))")

println("\n--- 类型转换 ---")
# convert 函数
a = convert(Float64, 42)
println("convert(Float64, 42) = $a, 类型: $(typeof(a))")

# 类型构造函数
b = Float64(42)
println("Float64(42) = $b")

# 整数转浮点
c = float(42)
println("float(42) = $c, 类型: $(typeof(c))")

# 截断浮点
d = Int(3.99)  # 注意：截断，不是四舍五入
println("Int(3.99) = $d")

# 四舍五入
e = round(Int, 3.99)
println("round(Int, 3.99) = $e")

println("\n--- 类型提升（promotion）---")
# 混合运算时自动提升
result1 = 1 + 2.0  # Int + Float64 -> Float64
println("1 + 2.0 = $result1, 类型: $(typeof(result1))")

result2 = 1 // 2 + 0.5  # Rational + Float64 -> Float64
println("1//2 + 0.5 = $result2, 类型: $(typeof(result2))")

println("\n--- 有理数（Rational）---")
r1 = 1 // 3
r2 = 2 // 3
r3 = r1 + r2
println("1//3 + 2//3 = $r3")
println("1//3 的类型: $(typeof(r1))")

println("\n--- 复数（Complex）---")
c1 = 3 + 4im
println("c1 = $c1, 类型: $(typeof(c1))")
println("实部: $(real(c1))")
println("虚部: $(imag(c1))")
println("共轭: $(conj(c1))")

println("\n--- 自定义抽象类型 ---")
abstract type Shape end
abstract type Polygon <: Shape end

struct Circle <: Shape
    radius::Float64
end

struct Square <: Polygon
    side::Float64
end

println("Circle 的父类型: $(supertype(Circle))")
println("Square 的父类型: $(supertype(Square))")
println("Polygon 的父类型: $(supertype(Polygon))")

println("\n--- 参数化类型 ---")
# 数组是参数化类型
arr_int = [1, 2, 3]
arr_float = [1.0, 2.0, 3.0]

println("typeof([1,2,3]) = $(typeof(arr_int))")
println("typeof([1.0,2.0,3.0]) = $(typeof(arr_float))")

# Vector{T} 是 Array{T,1} 的别名
v = Vector{Int}([1, 2, 3])
println("Vector{Int}: $(typeof(v))")

println("\n--- Union 类型 ---")
# 变量可以是多种类型之一
function process(x::Union{Int, String})
    if isa(x, Int)
        println("整数: $x")
    else
        println("字符串: $x")
    end
end

process(42)
process("hello")

println("\n--- Nothing 和 Missing ---")
# Nothing 表示"没有值"
x = nothing
println("x = $x, 类型: $(typeof(x))")

# Missing 表示"数据缺失"（用于数据分析）
y = missing
println("y = $y, 类型: $(typeof(y))")

println("nothing + 1 会报错")
try
    nothing + 1
catch e
    println("  $(typeof(e))")
end

println("missing + 1 = $(missing + 1)  (missing 会传播)")

println("\n--- 类型断言 ---")
# :: 用于类型断言
function square(x::Number)::Float64
    return Float64(x^2)
end

println("square(3) = $(square(3)), 类型: $(typeof(square(3)))")

println("\n--- 实战：类型安全的单位转换 ---")
struct Meter
    value::Float64
end

struct Kilometer
    value::Float64
end

# 转换函数
Base.convert(::Type{Kilometer}, m::Meter) = Kilometer(m.value / 1000)
Base.convert(::Type{Meter}, k::Kilometer) = Meter(k.value * 1000)

distance_m = Meter(5000.0)
distance_km = convert(Kilometer, distance_m)
println("$distance_m = $distance_km")

println("\n" * "="^40)
println("✅ 15_types.jl 运行完毕")
