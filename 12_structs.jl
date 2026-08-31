# ============================================
# 12_structs.jl
# 知识点：结构体（自定义类型）
# ============================================

println("--- 定义结构体 ---")
# struct 定义自定义类型（类似其他语言的 class，但没有方法）
struct Person
    name::String
    age::Int
end

# 创建实例
alice = Person("Alice", 30)
println("alice = $alice")
println("alice.name = $(alice.name)")
println("alice.age = $(alice.age)")

println("\n--- 默认不可变 ---")
# struct 默认是不可变的（immutable）
# alice.age = 31  # 取消注释会报错！

println("struct 默认不可变，尝试修改字段会报错")

println("\n--- 可变结构体（mutable struct）---")
mutable struct Counter
    count::Int
end

c = Counter(0)
println("初始: c.count = $(c.count)")
c.count += 1
println("修改后: c.count = $(c.count)")

println("\n--- 无类型字段（不推荐，但合法）---")
struct FlexibleData
    x  # 没有类型标注
    y
end

f1 = FlexibleData(10, "hello")
println("f1.x = $(f1.x), f1.y = $(f1.y)")
f2 = FlexibleData(3.14, true)
println("f2.x = $(f2.x), f2.y = $(f2.y)")
println("警告：不指定类型会降低性能")

println("\n--- 带默认值的外构造函数 ---")
struct Product
    name::String
    price::Float64
    stock::Int
end

# 定义外构造函数，提供默认值
Product(name, price) = Product(name, price, 0)

p1 = Product("Apple", 5.0, 100)
p2 = Product("Banana", 3.0)  # stock 默认 0
println("p1 = $p1")
println("p2 = $p2")

println("\n--- 结构体的用途 ---")
println("1. 组织相关数据")

struct Point
    x::Float64
    y::Float64
end

origin = Point(0.0, 0.0)
println("origin = $origin")

println("\n2. 类型安全")

struct Celsius
    value::Float64
end

struct Fahrenheit
    value::Float64
end

# 防止混用不同温度单位
temp_c = Celsius(25.0)
temp_f = Fahrenheit(77.0)
# 如果直接相加会报错，因为类型不同

println("temp_c = $temp_c")
println("temp_f = $temp_f")

println("\n--- 结构体 + 函数 ---")
struct Rectangle
    width::Float64
    height::Float64
end

# 为结构体定义函数
function area(r::Rectangle)
    return r.width * r.height
end

function perimeter(r::Rectangle)
    return 2 * (r.width + r.height)
end

rect = Rectangle(5.0, 3.0)
println("area(rect) = $(area(rect))")
println("perimeter(rect) = $(perimeter(rect))")

println("\n--- 参数化结构体（泛型）---")
# 让结构体支持多种类型
struct Container{T}
    value::T
end

int_container = Container{Int}(42)
string_container = Container{String}("hello")

println("int_container = $int_container")
println("string_container = $string_container")

# Julia 可以自动推断类型
auto_container = Container(3.14)
println("auto_container = $auto_container, 类型: $(typeof(auto_container))")

println("\n--- 实战：银行账户 ---")
mutable struct BankAccount
    owner::String
    balance::Float64
end

function deposit!(account::BankAccount, amount::Float64)
    account.balance += amount
    println("存入 \$$(amount)，余额: \$$(account.balance)")
end

function withdraw!(account::BankAccount, amount::Float64)
    if amount > account.balance
        println("余额不足！")
    else
        account.balance -= amount
        println("取出 \$$(amount)，余额: \$$(account.balance)")
    end
end

my_account = BankAccount("Alice", 1000.0)
println("开户: $(my_account.owner)，余额: \$$(my_account.balance)")
deposit!(my_account, 500.0)
withdraw!(my_account, 300.0)
withdraw!(my_account, 2000.0)  # 余额不足

println("\n--- 实战：链表节点 ---")
mutable struct ListNode
    value::Int
    next::Union{ListNode, Nothing}  # next 可以是 ListNode 或 nothing
end

# 创建链表: 1 -> 2 -> 3
node3 = ListNode(3, nothing)
node2 = ListNode(2, node3)
node1 = ListNode(1, node2)

# 遍历链表
current = node1
while current !== nothing
    println("节点值: $(current.value)")
    current = current.next
end

println("\n--- isbits 类型（值类型）---")
struct ImmutablePoint
    x::Int
    y::Int
end

p = ImmutablePoint(1, 2)
println("p 是 isbits 类型: $(isbits(p))")
println("isbits 类型存储在栈上，访问更快")

println("\n" * "="^40)
println("✅ 12_structs.jl 运行完毕")
