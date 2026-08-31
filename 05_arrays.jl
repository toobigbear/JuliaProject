# ============================================
# 05_arrays.jl
# 知识点：数组定义、索引、操作
# ============================================

println("--- 数组定义 ---")
# 一维数组（向量）
numbers = [1, 2, 3, 4, 5]
println("numbers = $numbers")
println("类型: $(typeof(numbers))")

# 指定元素类型
ints = Int[1, 2, 3]
floats = Float64[1.1, 2.2, 3.3]
strings = ["apple", "banana", "cherry"]

println("ints = $ints, 类型: $(typeof(ints))")
println("floats = $floats, 类型: $(typeof(floats))")
println("strings = $strings")

# 混合类型（不推荐，但合法）
mixed = [1, "two", 3.0, true]
println("mixed = $mixed, 类型: $(typeof(mixed))")

println("\n--- 数组索引（从 1 开始！）---")
arr = [10, 20, 30, 40, 50]
println("arr = $arr")
println("arr[1] = $(arr[1])")          # 第1个元素
println("arr[3] = $(arr[3])")          # 第3个元素
println("arr[end] = $(arr[end])")      # 最后一个元素
println("arr[end-1] = $(arr[end-1])")  # 倒数第2个

println("\n--- 数组切片 ---")
println("arr[1:3] = $(arr[1:3])")      # 前3个
println("arr[2:end] = $(arr[2:end])")  # 从第2个到最后
println("arr[:] = $(arr[:])")          # 全部（相当于复制）

println("\n--- 数组长度和判断 ---")
println("length(arr) = $(length(arr))")
println("isempty(arr) = $(isempty(arr))")
println("isempty([]) = $(isempty([]))")

println("\n--- 修改数组元素 ---")
arr2 = [1, 2, 3, 4, 5]
println("修改前: $arr2")
arr2[1] = 100
arr2[end] = 999
println("修改后: $arr2")

println("\n--- 添加和删除元素 ---")
list = [1, 2, 3]
println("初始: $list")

# 尾部添加
push!(list, 4)
println("push!(list, 4): $list")

# 尾部删除
pop!(list)
println("pop!(list): $list")

# 头部添加
pushfirst!(list, 0)
println("pushfirst!(list, 0): $list")

# 头部删除
popfirst!(list)
println("popfirst!(list): $list")

# 指定位置插入
insert!(list, 2, 99)
println("insert!(list, 2, 99): $list")

# 删除指定位置
deleteat!(list, 2)
println("deleteat!(list, 2): $list")

println("\n--- 数组拼接 ---")
a = [1, 2, 3]
b = [4, 5, 6]
c = vcat(a, b)  # 垂直拼接（对一维数组就是连接）
println("vcat([1,2,3], [4,5,6]) = $c")
d = [a; b]  # 简洁写法
println("[a; b] = $d")

println("\n--- 数组生成 ---")
# range 生成等差序列
r1 = collect(1:5)
println("collect(1:5) = $r1")
r2 = collect(1:2:10)  # 步长为2
println("collect(1:2:10) = $r2")

# fill 填充
zeros_arr = fill(0, 5)
println("fill(0, 5) = $zeros_arr")
ones_arr = ones(5)
println("ones(5) = $ones_arr")
zeros_arr2 = zeros(5)
println("zeros(5) = $zeros_arr2")

println("\n--- 数组推导式（超好用）---")
squares = [x^2 for x in 1:5]
println("[x^2 for x in 1:5] = $squares")

evens = [x for x in 1:10 if x % 2 == 0]
println("[x for x in 1:10 if x%2==0] = $evens")

println("\n--- 常用数组函数 ---")
data = [3, 1, 4, 1, 5, 9, 2, 6]
println("data = $data")
println("排序: $(sort(data))")
println("降序: $(sort(data, rev=true))")
println("最大值: $(maximum(data))")
println("最小值: $(minimum(data))")
println("求和: $(sum(data))")
println("反转: $(reverse(data))")
println("去重: $(unique(data))")

println("\n--- 数组查找 ---")
println("in(5, data): $(in(5, data))")         # 5 是否在数组中
println("findfirst(==(5), data): $(findfirst(==(5), data))")  # 第一次出现的位置
println("findall(==(1), data): $(findall(==(1), data))")      # 所有出现的位置

println("\n" * "="^40)
println("✅ 05_arrays.jl 运行完毕")
