# ============================================
# 04_strings.jl
# 知识点：字符串操作、插值、常用方法
# ============================================

println("--- 字符串定义 ---")
# 双引号定义字符串
s1 = "Hello, Julia!"
println(s1)

# 单引号是字符（Char），不是字符串！
c = 'A'
println("'A' 是字符，类型: $(typeof(c))")
println("\"A\" 是字符串，类型: $(typeof("A"))")

# 三引号：多行字符串
s2 = """
这是第一行
这是第二行
    缩进会被保留
"""
println(s2)

println("\n--- 字符串拼接 ---")
first = "Hello"
second = "World"

# 方法1：用 * （不是 +！）
result1 = first * " " * second
println("用 * 拼接: $result1")

# 方法2：用 string() 函数
result2 = string(first, " ", second)
println("用 string() 拼接: $result2")

# 方法3：字符串插值（最常用）
result3 = "$first $second"
println("用插值: $result3")

println("\n--- 字符串插值详解 ---")
name = "Alice"
age = 30
height = 1.68

println("我叫 $(name)，今年 $(age) 岁")  # 中文环境必须用 $(...)
println("明年我 $(age + 1) 岁")  # 表达式用 $(...)
println("身高保留两位小数: $(round(height, digits=2))")

println("\n--- 字符串索引（注意：Julia 从 1 开始！）---")
text = "Julia"
println("text = \"$text\"")
println("text[1] = $(text[1])")      # 第1个字符
println("text[2] = $(text[2])")      # 第2个字符
println("text[end] = $(text[end])")  # 最后一个字符
println("text[1:3] = $(text[1:3])")  # 切片：第1到第3个字符

println("\n--- 字符串长度 ---")
println("length(\"Julia\") = $(length("Julia"))")
println("length(\"你好\") = $(length("你好"))")  # Unicode 字符算1个

println("\n--- 常用字符串函数 ---")
sentence = "The quick brown fox"

println("原字符串: \"$sentence\"")
println("转大写: $(uppercase(sentence))")
println("转小写: $(lowercase(sentence))")
println("首字母大写: $(uppercasefirst(sentence))")
println("反转: $(reverse(sentence))")
println("替换: $(replace(sentence, "fox" => "cat"))")
println("分割: $(split(sentence, " "))")
println("连接: $(join(["a", "b", "c"], "-"))")

println("\n--- 查找和判断 ---")
println("occursin(\"fox\", sentence): $(occursin("fox", sentence))")
println("startswith(sentence, \"The\"): $(startswith(sentence, "The"))")
println("endswith(sentence, \"fox\"): $(endswith(sentence, "fox"))")

println("\n--- 字符串重复 ---")
println("\"=\"^20: $(repeat("=", 20))")
println("\"=\"^20: $("="^20)")  # 简洁写法
println("\"abc\"^3: $(repeat("abc", 3))")

println("\n--- 字符串比较 ---")
str1 = "apple"
str2 = "banana"
println("\"apple\" < \"banana\": $(str1 < str2)")  # 字典序比较
println("\"apple\" == \"apple\": $(str1 == "apple")")

println("\n" * "="^40)
println("✅ 04_strings.jl 运行完毕")
