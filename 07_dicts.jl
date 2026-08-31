# ============================================
# 07_dicts.jl
# 知识点：字典（键值对）
# ============================================

println("--- 字典定义 ---")
# Dict 类型：键 => 值
person = Dict("name" => "Alice", "age" => 30, "city" => "Shanghai")
println("person = $person")
println("类型: $(typeof(person))")

# 键和值可以是不同类型
mixed_dict = Dict(1 => "one", "two" => 2, 3.0 => true)
println("mixed_dict = $mixed_dict")

println("\n--- 访问字典元素 ---")
scores = Dict("math" => 90, "english" => 85, "science" => 92)
println("scores = $scores")
println("scores[\"math\"] = $(scores["math"])")
println("scores[\"english\"] = $(scores["english"])")

println("\n--- 修改和添加 ---")
println("修改前: $scores")
scores["math"] = 95        # 修改已有键
scores["history"] = 88     # 添加新键
println("修改后: $scores")

println("\n--- 删除键 ---")
d = Dict("a" => 1, "b" => 2, "c" => 3)
println("删除前: $d")
delete!(d, "b")
println("删除 \"b\" 后: $d")

println("\n--- 判断键是否存在 ---")
println("haskey(scores, \"math\"): $(haskey(scores, "math"))")
println("haskey(scores, \"art\"): $(haskey(scores, "art"))")

# 安全访问（键不存在时返回默认值）
println("get(scores, \"math\", 0): $(get(scores, "math", 0))")
println("get(scores, \"art\", 0): $(get(scores, "art", 0))")

println("\n--- 遍历字典 ---")
inventory = Dict("apples" => 50, "bananas" => 30, "oranges" => 20)

# 遍历键值对
println("方法1：键值对遍历")
for (key, value) in inventory
    println("  $key: $value")
end

# 只遍历键
println("\n方法2：只遍历键")
for key in keys(inventory)
    println("  $key")
end

# 只遍历值
println("\n方法3：只遍历值")
for value in values(inventory)
    println("  $value")
end

println("\n--- 字典推导式 ---")
# 类似列表推导式
squares_dict = Dict(x => x^2 for x in 1:5)
println("平方字典: $squares_dict")

# 带条件的推导式
even_squares = Dict(x => x^2 for x in 1:10 if x % 2 == 0)
println("偶数平方: $even_squares")

println("\n--- 字典的常见操作 ---")
d1 = Dict("a" => 1, "b" => 2)
d2 = Dict("c" => 3, "d" => 4)

# 合并字典
merged = merge(d1, d2)
println("merge(d1, d2) = $merged")

# 获取所有键（返回迭代器）
println("keys(d1) = $(collect(keys(d1)))")

# 获取所有值
println("values(d1) = $(collect(values(d1)))")

# 字典长度
println("length(d1) = $(length(d1))")

println("\n--- 字典 vs 数组 ---")
println("数组：用整数索引，有序")
arr = ["apple", "banana", "cherry"]
println("  arr[1] = $(arr[1])")

println("字典：用任意键索引，无序（Julia 1.7+ 保持插入顺序）")
fruit_dict = Dict("first" => "apple", "second" => "banana")
println("  fruit_dict[\"first\"] = $(fruit_dict["first"])")

println("\n--- 嵌套字典 ---")
# 字典的值也可以是字典
students = Dict(
    "Alice" => Dict("age" => 20, "grade" => "A"),
    "Bob" => Dict("age" => 22, "grade" => "B")
)
println("students = $students")
println("students[\"Alice\"][\"age\"] = $(students["Alice"]["age"])")

println("\n" * "="^40)
println("✅ 07_dicts.jl 运行完毕")
