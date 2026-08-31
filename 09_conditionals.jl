# ============================================
# 09_conditionals.jl
# 知识点：if/else、三元运算符、逻辑判断
# ============================================

println("--- if 语句 ---")
age = 20

if age >= 18
    println("成年人")
end

println("\n--- if-else 语句 ---")
temperature = 15

if temperature > 25
    println("天气热")
else
    println("天气冷")
end

println("\n--- if-elseif-else 语句 ---")
score = 85

if score >= 90
    println("优秀")
elseif score >= 80
    println("良好")
elseif score >= 60
    println("及格")
else
    println("不及格")
end

println("\n--- if 语句返回值 ---")
# Julia 的 if 是表达式，有返回值！
x = 10
result = if x > 5
    "大于5"
else
    "小于等于5"
end
println("result = $result")

println("\n--- 三元运算符（简洁版 if-else）---")
# 语法：条件 ? 真值 : 假值
age = 20
status = age >= 18 ? "成年" : "未成年"
println("status = $status")

score = 75
grade = score >= 90 ? "A" : score >= 60 ? "B" : "C"
println("grade = $grade")

println("\n--- 逻辑运算符组合 ---")
age = 25
has_license = true

if age >= 18 && has_license
    println("可以开车")
end

is_weekend = true
is_holiday = false

if is_weekend || is_holiday
    println("可以休息")
end

println("\n--- 比较运算 ---")
a = 10
b = 20

if a < b
    println("a < b")
end

if a == 10
    println("a 等于 10")
end

# 链式比较（Julia 特有）
score = 85
if 80 <= score < 90
    println("成绩在80-90之间")
end

println("\n--- 嵌套 if ---")
age = 25
income = 50000

if age >= 18
    if income >= 30000
        println("符合贷款条件")
    else
        println("收入不足")
    end
else
    println("年龄不足")
end

println("\n--- 用 if 判断类型 ---")
x = 42

if isa(x, Int)
    println("x 是整数")
end

if typeof(x) == Int64
    println("x 的类型是 Int64")
end

println("\n--- 多个条件的简写 ---")
# 传统写法
age = 20
if age >= 18 && age <= 65
    println("工作年龄")
end

# 链式比较（更简洁）
if 18 <= age <= 65
    println("工作年龄")
end

println("\n--- in 运算符 ---")
fruits = ["apple", "banana", "cherry"]
fruit = "apple"

if fruit in fruits
    println("$fruit 在列表中")
end

if "grape" ∉ fruits  # ∉ 输入 \notin + Tab
    println("grape 不在列表中")
end

println("\n--- 实战：判断闰年 ---")
year = 2024

if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    println("$year 是闰年")
else
    println("$year 不是闰年")
end

println("\n--- 实战：BMI 计算器 ---")
weight = 70.0  # kg
height = 1.75  # m
bmi = weight / height^2

println("BMI = $(round(bmi, digits=2))")

if bmi < 18.5
    println("体重过轻")
elseif 18.5 <= bmi < 24
    println("正常")
elseif 24 <= bmi < 28
    println("超重")
else
    println("肥胖")
end

println("\n" * "="^40)
println("✅ 09_conditionals.jl 运行完毕")
