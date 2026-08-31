# ============================================
# 06_tuples.jl
# 知识点：元组（不可变序列）
# ============================================

println("--- 元组定义 ---")
# 元组用圆括号，不可修改
t1 = (1, 2, 3)
println("t1 = $t1, 类型: $(typeof(t1))")

# 混合类型
t2 = ("Alice", 30, 5.8, true)
println("t2 = $t2")

# 单元素元组（注意逗号！）
single = (42,)
println("单元素元组: $single, 类型: $(typeof(single))")
# 如果不加逗号：(42) 就是数字 42，不是元组

println("\n--- 元组索引（从 1 开始）---")
person = ("Bob", 25, "Engineer")
println("person = $person")
println("person[1] = $(person[1])")
println("person[2] = $(person[2])")
println("person[end] = $(person[end])")

println("\n--- 元组不可变 ---")
# t1[1] = 100  # 取消注释会报错！元组不能修改
println("元组一旦创建就不能修改，尝试 t1[1]=100 会报错")

println("\n--- 元组解包（超好用）---")
# 把元组的元素分别赋给多个变量
name, age, job = ("Carol", 28, "Designer")
println("name = $name, age = $age, job = $job")

# 部分解包（用下划线忽略不需要的）
x, _, z = (10, 20, 30)
println("x = $x, z = $z (中间的20被忽略了)")

println("\n--- 元组 vs 数组 ---")
arr = [1, 2, 3]        # 数组：可变
tup = (1, 2, 3)        # 元组：不可变

arr[1] = 100
println("数组可以改: arr = $arr")

# 元组不能改，但可以创建新的
tup_new = (100, tup[2], tup[3])
println("元组不能改，但可以新建: tup_new = $tup_new")

println("\n--- 元组的用途 ---")
# 1. 函数返回多个值
function divmod_custom(a, b)
    quotient = div(a, b)
    remainder = mod(a, b)
    return (quotient, remainder)  # 返回元组
end

q, r = divmod_custom(17, 5)
println("17 ÷ 5 = $q ... $r")

# 2. 坐标点
point = (3, 4)
println("点坐标: $point")

# 3. 不需要修改的固定数据
rgb_red = (255, 0, 0)
rgb_green = (0, 255, 0)
println("红色 RGB: $rgb_red")

println("\n--- 命名元组（NamedTuple）---")
# 给元组的每个元素起名字
person_nt = (name="David", age=35, city="Beijing")
println("person_nt = $person_nt")
println("person_nt.name = $(person_nt.name)")
println("person_nt.age = $(person_nt.age)")
println("person_nt.city = $(person_nt.city)")

# 命名元组也不可变
# person_nt.age = 36  # 会报错

println("\n--- 元组遍历 ---")
for item in (10, 20, 30, 40)
    println("元素: $item")
end

println("\n--- 元组长度和判断 ---")
t = (1, 2, 3, 4, 5)
println("length(t) = $(length(t))")
println("isempty(t) = $(isempty(t))")
println("in(3, t) = $(in(3, t))")

println("\n" * "="^40)
println("✅ 06_tuples.jl 运行完毕")
