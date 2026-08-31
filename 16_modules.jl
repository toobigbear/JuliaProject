# ============================================
# 16_modules.jl
# 知识点：模块、导入、包管理
# ============================================

println("--- Julia 标准库 ---")
# 导入标准库模块
using LinearAlgebra
using Statistics
using Random
using Dates

println("已导入: LinearAlgebra, Statistics, Random, Dates")

println("\n--- Statistics 模块 ---")
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("数据: $data")
println("平均值: $(mean(data))")
println("中位数: $(median(data))")
println("标准差: $(std(data))")
println("方差: $(var(data))")

println("\n--- Random 模块 ---")
# 生成随机数
println("随机浮点数 [0,1): $(rand())")
println("随机整数 [1,10]: $(rand(1:10))")
println("随机数组: $(rand(5))")

# 设置随机种子（结果可复现）
Random.seed!(42)
println("设置种子后: $(rand(3))")

# 随机打乱数组
arr = [1, 2, 3, 4, 5]
println("打乱前: $arr")
println("打乱后: $(shuffle(arr))")

println("\n--- Dates 模块 ---")
today = today()
println("今天: $today")

now_time = now()
println("现在: $now_time")

# 日期运算
tomorrow = today + Day(1)
println("明天: $tomorrow")

next_week = today + Week(1)
println("下周: $next_week")

# 日期格式化
println("格式化: $(Dates.format(today, "yyyy-mm-dd"))")

println("\n--- LinearAlgebra 模块 ---")
# 矩阵运算
A = [1 2; 3 4]
B = [5 6; 7 8]

println("矩阵 A:")
println(A)
println("矩阵 B:")
println(B)

C = A * B
println("A * B:")
println(C)

# 行列式
println("det(A) = $(det(A))")

# 转置
println("A 的转置:")
println(transpose(A))

# 逆矩阵
if det(A) != 0
    A_inv = inv(A)
    println("A 的逆矩阵:")
    println(A_inv)
end

println("\n--- 导入特定函数 ---")
# 只导入需要的函数
import Statistics: mean, std

data2 = [10, 20, 30, 40, 50]
println("mean: $(mean(data2))")
println("std: $(std(data2))")

println("\n--- using vs import ---")
println("using: 导入模块的所有导出函数，可直接使用")
println("import: 需要 ModuleName.function 或显式导入")

# using Statistics  # 之后可以直接用 mean()
# import Statistics  # 之后必须用 Statistics.mean()

println("\n--- 创建自定义模块 ---")
# 在文件中定义模块
module MyMathModule

export my_add, my_multiply, PI_SQUARED

const PI_SQUARED = 9.869604401

function my_add(a, b)
    return a + b
end

function my_multiply(a, b)
    return a * b
end

function my_private_function()
    return "这个函数没有导出"
end

end  # module MyMathModule

# 使用自定义模块
using .MyMathModule  # 注意点号（表示当前作用域的模块）

println("my_add(3, 5) = $(my_add(3, 5))")
println("my_multiply(4, 6) = $(my_multiply(4, 6))")
println("PI_SQUARED = $PI_SQUARED")

# my_private_function()  # 会报错，因为没有导出

println("\n--- 包管理（Pkg）---")
println("Julia 有内置的包管理器 Pkg")
println("在 REPL 中按 ] 进入包管理模式:")
println("  add PackageName      # 安装包")
println("  rm PackageName       # 删除包")
println("  update               # 更新所有包")
println("  status               # 查看已安装的包")
println("按 Backspace 退出包管理模式")

println("\n--- 常用第三方包 ---")
println("DataFrames.jl    - 数据处理（类似 pandas）")
println("Plots.jl         - 画图")
println("CSV.jl           - 读写 CSV 文件")
println("JSON.jl          - JSON 解析")
println("HTTP.jl          - HTTP 客户端")
println("Flux.jl          - 深度学习")
println("JuMP.jl          - 优化求解器")

println("\n--- 实战：使用 CSV 包（需要先安装）---")
println("# 在 REPL 中运行:")
println("# ]")
println("# add CSV DataFrames")
println("# 然后:")
println("using CSV, DataFrames")
println("df = CSV.read(\"data.csv\", DataFrame)")
println("first(df, 5)  # 显示前5行")

println("\n--- 模块的作用域 ---")
# 模块有独立的命名空间
module ModuleA
    x = 10
end

module ModuleB
    x = 20
end

println("ModuleA.x = $(ModuleA.x)")
println("ModuleB.x = $(ModuleB.x)")
println("两个模块的 x 互不干扰")

println("\n" * "="^40)
println("✅ 16_modules.jl 运行完毕")
