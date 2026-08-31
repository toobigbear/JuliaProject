# ============================================
# 19_performance.jl
# 知识点：性能优化、类型稳定性
# ============================================

println("--- Julia 性能的关键：类型稳定 ---")

# 类型不稳定的函数（慢）
function slow_sum(arr)
    total = 0  # Int 类型
    for x in arr
        total += x  # 如果 arr 是 Float64，total 会变成 Float64
    end
    return total
end

# 类型稳定的函数（快）
function fast_sum(arr)
    total = zero(eltype(arr))  # 初始值类型与数组元素类型一致
    for x in arr
        total += x
    end
    return total
end

data = rand(1000000)

println("类型不稳定（慢）:")
@time slow_sum(data)

println("类型稳定（快）:")
@time fast_sum(data)

println("\n--- 避免全局变量 ---")
# 全局变量会降低性能（类型不确定）
global_var = 100

function use_global()
    result = 0
    for i in 1:1000000
        result += global_var
    end
    return result
end

function use_local()
    local_var = 100  # 局部变量
    result = 0
    for i in 1:1000000
        result += local_var
    end
    return result
end

println("使用全局变量:")
@time use_global()

println("使用局部变量:")
@time use_local()

println("\n--- 用 const 声明全局常量 ---")
const CONSTANT = 100

function use_constant()
    result = 0
    for i in 1:1000000
        result += CONSTANT
    end
    return result
end

println("使用常量:")
@time use_constant()

println("\n--- 避免抽象类型的容器 ---")
# 不推荐：元素类型是抽象类型
abstract_array = Number[1, 2.5, 3, 4.2]

function sum_abstract(arr)
    total = 0.0
    for x in arr
        total += x
    end
    return total
end

# 推荐：元素类型是具体类型
concrete_array = Float64[1, 2.5, 3, 4.2]

function sum_concrete(arr)
    total = 0.0
    for x in arr
        total += x
    end
    return total
end

println("抽象类型数组:")
@time sum_abstract(abstract_array)

println("具体类型数组:")
@time sum_concrete(concrete_array)

println("\n--- 使用 @inbounds 跳过边界检查 ---")
function sum_with_bounds_check(arr)
    total = 0.0
    for i in 1:length(arr)
        total += arr[i]  # 每次都检查 i 是否越界
    end
    return total
end

function sum_without_bounds_check(arr)
    total = 0.0
    @inbounds for i in 1:length(arr)
        total += arr[i]  # 跳过边界检查
    end
    return total
end

test_data = rand(1000000)

println("有边界检查:")
@time sum_with_bounds_check(test_data)

println("无边界检查:")
@time sum_without_bounds_check(test_data)

println("警告：@inbounds 只在你确定索引有效时使用！")

println("\n--- 使用 @simd 向量化 ---")
function sum_normal(arr)
    total = 0.0
    for x in arr
        total += x
    end
    return total
end

function sum_simd(arr)
    total = 0.0
    @simd for x in arr
        total += x
    end
    return total
end

println("普通循环:")
@time sum_normal(test_data)

println("SIMD 向量化:")
@time sum_simd(test_data)

println("\n--- 预分配内存 ---")
# 不推荐：动态扩展数组
function build_array_slow(n)
    result = []  # 空数组
    for i in 1:n
        push!(result, i^2)  # 每次都要重新分配内存
    end
    return result
end

# 推荐：预分配
function build_array_fast(n)
    result = Vector{Int}(undef, n)  # 预分配 n 个元素
    for i in 1:n
        result[i] = i^2
    end
    return result
end

println("动态扩展:")
@time build_array_slow(100000)

println("预分配:")
@time build_array_fast(100000)

println("\n--- 使用视图（view）避免复制 ---")
function sum_slice_copy(arr)
    sub_array = arr[1:500000]  # 复制数据
    return sum(sub_array)
end

function sum_slice_view(arr)
    sub_array = @view arr[1:500000]  # 不复制，只是视图
    return sum(sub_array)
end

big_array = rand(1000000)

println("复制切片:")
@time sum_slice_copy(big_array)

println("视图切片:")
@time sum_slice_view(big_array)

println("\n--- 使用 in-place 操作（!）---")
function double_copy(arr)
    return arr .* 2  # 创建新数组
end

function double_inplace!(arr)
    arr .*= 2  # 原地修改，不创建新数组
    return arr
end

test_arr = rand(1000000)

println("创建新数组:")
@time double_copy(test_arr)

test_arr_copy = copy(test_arr)
println("原地修改:")
@time double_inplace!(test_arr_copy)

println("\n--- 类型标注（在函数参数上）---")
function process_untyped(x)
    return x * 2
end

function process_typed(x::Float64)
    return x * 2
end

data_val = 3.14

println("无类型标注:")
@time process_untyped(data_val)

println("有类型标注:")
@time process_typed(data_val)

println("\n--- 性能分析工具 ---")
println("@time        - 测量时间和内存分配")
println("@btime       - 更准确的基准测试（需要 BenchmarkTools 包）")
println("@code_warntype - 检查类型稳定性")
println("@profile     - 性能分析（需要 Profile 标准库）")

println("\n--- 实战：矩阵乘法优化 ---")
using LinearAlgebra

function matmul_slow(A, B)
    m, n = size(A)
    n2, p = size(B)
    C = zeros(m, p)
    for i in 1:m
        for j in 1:p
            for k in 1:n
                C[i, j] += A[i, k] * B[k, j]
            end
        end
    end
    return C
end

A = rand(100, 100)
B = rand(100, 100)

println("手写三重循环:")
@time matmul_slow(A, B)

println("使用内置运算符（BLAS 优化）:")
@time A * B

println("内置实现快几个数量级！")

println("\n--- 性能优化总结 ---")
println("1. 保持类型稳定（最重要的！）")
println("2. 避免全局变量（或用 const）")
println("3. 使用具体类型的容器")
println("4. 预分配内存")
println("5. 使用 @inbounds 跳过边界检查（谨慎）")
println("6. 使用 @simd 向量化")
println("7. 使用视图而非复制")
println("8. 优先使用 in-place 操作（!）")
println("9. 尽量用内置函数（通常已优化）")

println("\n" * "="^40)
println("✅ 19_performance.jl 运行完毕")
