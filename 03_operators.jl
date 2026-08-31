# ============================================
# 03_operators.jl
# 知识点：算术、比较、逻辑运算符
# ============================================

println("--- 算术运算符 ---")
a = 17
b = 5

println("a = $a, b = $b")
println("加法: a + b = $(a + b)")
println("减法: a - b = $(a - b)")
println("乘法: a * b = $(a * b)")
println("除法: a / b = $(a / b)")         # 结果是浮点数
println("整除: a ÷ b = $(a ÷ b)")         # ÷ 输入 \div + Tab，或者用 div(a,b)
println("取余: a % b = $(a % b)")
println("幂运算: a ^ b = $(a ^ b)")       # 注意：Julia 用 ^ 表示幂，Python 用 **

println("\n--- 特殊除法 ---")
println("10 / 4 = $(10 / 4)")           # 2.5（浮点）
println("10 ÷ 4 = $(10 ÷ 4)")           # 2（整除）
println("div(10, 4) = $(div(10, 4))")   # 2（另一种写法）
println("mod(10, 4) = $(mod(10, 4))")   # 2（取余）

println("\n--- 比较运算符 ---")
x = 10
y = 20

println("x = $x, y = $y")
println("x == y: $(x == y)")    # 等于
println("x != y: $(x != y)")    # 不等于
println("x < y:  $(x < y)")     # 小于
println("x > y:  $(x > y)")     # 大于
println("x <= y: $(x <= y)")    # 小于等于
println("x >= y: $(x >= y)")    # 大于等于

println("\n--- 链式比较（Julia 特有，超爽）---")
age = 25
println("age = $age")
println("18 <= age <= 30: $(18 <= age <= 30)")  # Python 也支持，但很多语言不支持
println("1 < 2 < 3: $(1 < 2 < 3)")

println("\n--- 逻辑运算符 ---")
p = true
q = false

println("p = $p, q = $q")
println("p && q (与): $(p && q)")
println("p || q (或): $(p || q)")
println("!p (非):     $(!p)")

println("\n--- 短路求值 ---")
# && 和 || 都有短路特性
println("false && (1/0 > 0): $(false && (1/0 > 0))")  # 不会报错，因为左边是 false
println("true || (1/0 > 0):  $(true || (1/0 > 0))")   # 不会报错，因为左边是 true

println("\n--- 位运算符 ---")
m = 0b1100  # 二进制 12
n = 0b1010  # 二进制 10

println("m = $m (二进制 $(string(m, base=2)))")
println("n = $n (二进制 $(string(n, base=2)))")
println("m & n  = $(m & n)  (按位与)")
println("m | n  = $(m | n)  (按位或)")
println(raw"m ⊻ n  = $(m ⊻ n)  (按位异或，输入 \xor + Tab)")
println("~m     = $(~m) (按位取反)")
println("m << 2 = $(m << 2) (左移2位)")
println("m >> 2 = $(m >> 2) (右移2位)")

println("\n--- 复合赋值运算符 ---")
counter = 10
println("初始: counter = $counter")
counter += 5   # counter = counter + 5
println("counter += 5: $counter")
counter -= 3
println("counter -= 3: $counter")
counter *= 2
println("counter *= 2: $counter")
counter ÷= 4
println("counter ÷= 4: $counter")

println("\n" * "="^40)
println("✅ 03_operators.jl 运行完毕")
