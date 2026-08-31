# ============================================
# 17_file_io.jl
# 知识点：文件读写、IO 操作
# ============================================

println("--- 写入文本文件 ---")
# open() + write()
filename = "test_output.txt"

open(filename, "w") do file
    write(file, "Hello, Julia!\n")
    write(file, "这是第二行\n")
    write(file, "这是第三行\n")
end

println("已写入文件: $filename")

println("\n--- 读取文本文件 ---")
# 一次性读取整个文件
content = read(filename, String)
println("文件内容:")
println(content)

println("\n--- 逐行读取 ---")
open(filename, "r") do file
    for (i, line) in enumerate(eachline(file))
        println("第 $i 行: $line")
    end
end

println("\n--- 读取所有行到数组 ---")
lines = readlines(filename)
println("行数: $(length(lines))")
println("第一行: $(lines[1])")

println("\n--- 追加到文件 ---")
open(filename, "a") do file  # "a" 模式：追加
    write(file, "这是追加的一行\n")
end

println("追加后:")
println(read(filename, String))

println("\n--- 写入 CSV 文件 ---")
csv_filename = "data.csv"

open(csv_filename, "w") do file
    write(file, "name,age,city\n")
    write(file, "Alice,30,Beijing\n")
    write(file, "Bob,25,Shanghai\n")
    write(file, "Carol,28,Guangzhou\n")
end

println("已写入 CSV 文件")

println("\n--- 读取 CSV 文件 ---")
for line in readlines(csv_filename)
    println(line)
end

println("\n--- 解析 CSV（简单版）---")
lines = readlines(csv_filename)
header = split(lines[1], ",")
println("表头: $header")

for i in 2:length(lines)
    fields = split(lines[i], ",")
    name, age, city = fields
    println("$name, $age 岁, 来自 $city")
end

println("\n--- 检查文件是否存在 ---")
println("isfile(\"$filename\"): $(isfile(filename))")
println("isfile(\"nonexistent.txt\"): $(isfile("nonexistent.txt"))")

println("\n--- 获取文件信息 ---")
if isfile(filename)
    println("文件大小: $(filesize(filename)) 字节")
    println("修改时间: $(mtime(filename))")
end

println("\n--- 删除文件 ---")
temp_file = "temp.txt"
open(temp_file, "w") do file
    write(file, "临时文件")
end

println("创建临时文件: $temp_file")
println("isfile: $(isfile(temp_file))")

rm(temp_file)  # 删除文件
println("删除后 isfile: $(isfile(temp_file))")

println("\n--- 创建和删除目录 ---")
test_dir = "test_directory"

if !isdir(test_dir)
    mkdir(test_dir)
    println("创建目录: $test_dir")
end

println("isdir: $(isdir(test_dir))")

# 删除空目录
rm(test_dir)
println("删除后 isdir: $(isdir(test_dir))")

println("\n--- 列出目录内容 ---")
# 列出当前目录的所有文件
files = readdir(".")
println("当前目录的文件:")
for file in files
    println("  $file")
end

println("\n--- 文件路径操作 ---")
path = "/home/user/documents/file.txt"
println("目录部分: $(dirname(path))")
println("文件名: $(basename(path))")
println("扩展名: $(splitext(path)[2])")

# 拼接路径
dir = "data"
fname = "output.csv"
full_path = joinpath(dir, fname)
println("完整路径: $full_path")

println("\n--- 二进制文件读写 ---")
bin_filename = "binary_data.bin"

# 写入二进制数据
data_to_write = UInt8[1, 2, 3, 4, 5]
open(bin_filename, "w") do file
    write(file, data_to_write)
end
println("写入二进制数据: $data_to_write")

# 读取二进制数据
data_read = open(bin_filename, "r") do file
    read(file)
end
println("读取二进制数据: $data_read")

rm(bin_filename)  # 清理

println("\n--- 实战：日志记录器 ---")
function log_message(filename, message)
    timestamp = Dates.now()
    open(filename, "a") do file
        write(file, "[$timestamp] $message\n")
    end
end

log_file = "app.log"
log_message(log_file, "程序启动")
log_message(log_file, "执行操作 A")
log_message(log_file, "程序结束")

println("日志内容:")
println(read(log_file, String))

# 清理演示文件
rm(filename)
rm(csv_filename)
rm(log_file)

println("\n--- 实战：统计文本文件 ---")
# 创建一个测试文件
test_text = """
The quick brown fox jumps over the lazy dog.
The dog was not amused.
The fox ran away quickly.
"""

test_file = "sample.txt"
open(test_file, "w") do file
    write(file, test_text)
end

# 统计行数、单词数、字符数
content = read(test_file, String)
lines = readlines(test_file)
words = split(content)
chars = length(content)

println("文件统计:")
println("  行数: $(length(lines))")
println("  单词数: $(length(words))")
println("  字符数: $chars")

rm(test_file)

println("\n" * "="^40)
println("✅ 17_file_io.jl 运行完毕")
