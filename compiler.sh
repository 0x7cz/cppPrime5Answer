#!/bin/bash

# 查找当前目录及子目录下所有.cpp文件（最多3层深度）
CPP_FILES=$(find . -maxdepth 3 -type f -name "*.cpp" -printf "%T@ %p\n" | sort -n | cut -d' ' -f2-)

if [ -z "$CPP_FILES" ]; then
    echo "Error: No .cpp files found in current directory and subdirectories."
    exit 1
fi

# 获取最近修改的.cpp文件（完整路径）
LATEST_CPP=$(echo "$CPP_FILES" | tail -n 1)
FILE_NAME=$(basename -- "$LATEST_CPP")
DIR_NAME=$(dirname -- "$LATEST_CPP")
BASE_NAME="${FILE_NAME%.*}"

echo "Found the most recently modified C++ file: $LATEST_CPP"
echo "----------------------------------------"

# 使用g++编译程序（输出到源文件所在目录）
echo "Compiling $FILE_NAME..."
g++ -Wall -Wextra -std=c++17 -o "${DIR_NAME}/${BASE_NAME}" "$LATEST_CPP"

# 检查编译是否成功
if [ $? -eq 0 ]; then
    EXE_PATH="${DIR_NAME}/${BASE_NAME}"
    echo "Compilation successful! Executable created: $EXE_PATH"
    echo "----------------------------------------"
    
    # 运行生成的可执行文件
    echo "Running program:"
    "$EXE_PATH"
else
    echo "Compilation failed!"
    exit 1
fi