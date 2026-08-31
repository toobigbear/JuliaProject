# ============================================
# 08_loops.jl
# 知识点：for 循环、while 循环、break/continue
# ============================================

println("--- for 循环：遍历数组 ---")
fruits = ["apple", "banana", "cherry"]
for fruit in fruits
    println(fruit)
end

println("\n--- for 循环：遍历范围 ---")
# Julia 的范围是闭区间
for i in 1:5
    println("i = $i")
end

println("\n--- for 循环：带步长 ---")
for i in 1:2:10  # 从1到10，步长2
    println("i = $i")
end

println("\n--- for 循环：遍历字符串 ---")
for char in "Julia"
    println(char)
end

println("\n--- for 循环：enumerate（同时获取索引和值）---")
names = ["Alice", "Bob", "Carol"]
for (index, name) in enumerate(names)
    println("$index: $name")
end

println("\n--- for 循环：遍历字典 ---")
scores = Dict("math" => 90, "english" => 85)
for (subject, score) in scores
    println("$subject: $score")
end

println("\n--- while 循环 ---")
count = 1
while count <= 5
    global count  # ← 加这一行就解决！
    println("count = $count")
    count += 1
end

println("\n--- while 循环：累加1到100 ---")
total = 0
i = 1
while i <= 100
    global i  # ← 加这一行就解决！
    global total  # ← 加这一行就解决！
    total += i
    total += i
    i += 1
end
println("1+2+...+100 = $total")

println("\n--- break：跳出循环 ---")
for i in 1:10
    if i > 5
        break  # 当 i > 5 时跳出循环
    end
    println("i = $i")
end

println("\n--- continue：跳过本次迭代 ---")
for i in 1:10
    if i % 2 == 0
        continue  # 跳过偶数
    end
    println("奇数: $i")
end

println("\n--- 嵌套循环 ---")
for i in 1:3
    for j in 1:3
        println("($i, $j)")
    end
end

println("\n--- 嵌套循环：打印九九乘法表 ---")
for i in 1:9
    for j in 1:i
        print("$(j)×$(i)=$(i*j)\t")
    end
    println()  # 换行
end

println("\n--- 列表推导式（替代简单循环）---")
# 传统写法
squares1 = []
for x in 1:5
    push!(squares1, x^2)
end
println("传统循环: $squares1")

# 推导式（一行搞定）
squares2 = [x^2 for x in 1:5]
println("推导式: $squares2")

# 带条件的推导式
evens = [x for x in 1:20 if x % 2 == 0]
println("1-20的偶数: $evens")

println("\n--- 循环中的 else（Julia 没有！）---")
println("注意：Julia 的循环没有 else 语句（Python 有，但 Julia 没有）")

println("\n--- 无限循环 + break ---")
n = 0
while true
    global n, total # ← 把两个要修改的全局变量都写上
    total += i
    n += 1
    if n >= 5
        break
    end
    println("n = $n")
end

println("\n" * "="^40)
println("✅ 08_loops.jl 运行完毕")
