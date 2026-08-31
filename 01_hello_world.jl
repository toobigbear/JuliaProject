# ============================================
# 01_hello_world.jl
# 知识点：输出、注释、基本结构
# ============================================

# 单行注释用 #

#=
多行注释
用 #= 和 =#
=#

# 最基本的输出
println("Hello, Julia!")

# println 会自动换行，print 不会
print("Hello, ")
print("World!\n")

# 输出多个值，用逗号分隔
println("1 + 1 =", 2)

# 字符串插值：用 $ 符号
name = "Julia"
version = 1.10
println("我正在学习 $(name)，版本是 $(version)")
# 注意：中文环境下必须用 $(...) 明确包裹变量名！

# 表达式插值：$(...)
x = 10
println("x 的平方是 $(x^2)")

# 对比：纯英文环境可以省略括号
println("Learning $(name), version $(version)")

println("="^40)  # 字符串重复："="^40 表示 40 个等号
println("✅ 01_hello_world.jl 运行完毕")
