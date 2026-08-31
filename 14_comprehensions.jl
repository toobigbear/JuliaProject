# ============================================
# 14_comprehensions.jl
# 知识点：推导式（生成集合的简洁语法）
# ============================================

println("--- 数组推导式 ---")
# 基本语法：[表达式 for 变量 in 集合]
squares = [x^2 for x in 1:5]
println("平方: $squares")

cubes = [x^3 for x in 1:5]
println("立方: $cubes")

println("\n--- 带条件的推导式 ---")
# [表达式 for 变量 in 集合 if 条件]
evens = [x for x in 1:20 if x % 2 == 0]
println("1-20的偶数: $evens")

odd_squares = [x^2 for x in 1:10 if x % 2 == 1]
println("1-10的奇数平方: $odd_squares")

println("\n--- 多重循环推导式 ---")
# 生成笛卡尔积
pairs = [(i, j) for i in 1:3 for j in 1:3]
println("所有配对: $pairs")

# 只要对角线
diagonal = [(i, j) for i in 1:3 for j in 1:3 if i == j]
println("对角线: $diagonal")

println("\n--- 字符串推导式 ---")
words = ["hello", "world", "julia"]
upper_words = [uppercase(w) for w in words]
println("大写: $upper_words")

lengths = [length(w) for w in words]
println("长度: $lengths")

println("\n--- 字典推导式 ---")
# Dict(键 => 值 for 变量 in 集合)
square_map = Dict(x => x^2 for x in 1:5)
println("平方映射: $square_map")

# 带条件
even_square_map = Dict(x => x^2 for x in 1:10 if x % 2 == 0)
println("偶数平方映射: $even_square_map")

println("\n--- 集合推导式（Set）---")
unique_remainders = Set(x % 5 for x in 1:20)
println("1-20除以5的余数（去重）: $unique_remainders")

println("\n--- 生成器表达式（惰性求值）---")
# 用圆括号，不立即生成数组
gen = (x^2 for x in 1:1000000)
println("生成器类型: $(typeof(gen))")
println("取前5个: $(collect(Iterators.take(gen, 5)))")

println("\n--- 实战：九九乘法表 ---")
multiplication_table = ["$(i)×$(j)=$(i*j)" for i in 1:9 for j in 1:i]
for (index, item) in enumerate(multiplication_table)
    print(item, "\t")
    if index % 3 == 0
        println()
    end
end

println("\n\n--- 实战：素数生成 ---")
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

primes = [x for x in 1:50 if is_prime(x)]
println("50以内的素数: $primes")

println("\n--- 实战：矩阵转置 ---")
matrix = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]]

transposed = [[matrix[j][i] for j in 1:3] for i in 1:3]
println("原矩阵: $matrix")
println("转置: $transposed")

println("\n--- 实战：过滤和转换 ---")
numbers = 1:20
result = [x^2 for x in numbers if x % 3 == 0 && x % 2 == 1]
println("1-20中既是奇数又是3的倍数的数的平方: $result")

println("\n--- 嵌套推导式 ---")
# 生成二维数组
grid = [[i * j for j in 1:5] for i in 1:5]
println("5×5乘法表:")
for row in grid
    println("  $row")
end

println("\n--- 扁平化嵌套数组 ---")
nested = [[1, 2], [3, 4], [5, 6]]
flattened = [x for sublist in nested for x in sublist]
println("嵌套数组: $nested")
println("扁平化: $flattened")

println("\n--- 条件表达式（三元运算符）在推导式中 ---")
labels = [x % 2 == 0 ? "even" : "odd" for x in 1:10]
println("奇偶标签: $labels")

println("\n--- 性能对比：推导式 vs 传统循环 ---")
# 传统循环
function traditional_squares(n)
    result = Int[]
    for i in 1:n
        push!(result, i^2)
    end
    return result
end

# 推导式
comprehension_squares(n) = [i^2 for i in 1:n]

println("传统循环耗时:")
@time traditional_squares(1000000)

println("推导式耗时:")
@time comprehension_squares(1000000)

println("推导式通常更快（编译器优化更好）")

println("\n" * "="^40)
println("✅ 14_comprehensions.jl 运行完毕")
