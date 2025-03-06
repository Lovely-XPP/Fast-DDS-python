# Fast-DDS-Python

This repo is modified from origin repo [Fast-DDS-Python](https://github.com/eProsima/Fast-DDS-python).

Main Feature:

- Support cmake or colcon build without any addtion dependence installed
- Support install to Python site-packages directly (with pip) - it complete after cmake or colcon build
- Provide binary `whl` file with major python version.

## Support Python

```bash
python >= 3.8
```

## Binary

You can install the `whl` file from the release page directly with your own python version.

```bash
pip install XXXXXX.whl
```

## Source 

You can use Cmake or colcon to build this project.

If you don't know what Cmake or colcon is, here is the compile instructions.

1. Open  `Developer PowerShell for VS 20XX`, and it will open a terminal.

2. Install necessary python packages

   ```bash
   pip install -U colcon-common-extensions vcstool build
   ```

3. Use `cd` command as below:

   ```bash
   cd [Path to this repo]/fastdds_python
   ```

4. Then build the project

   ```bash
   chcp 65001 # change encode to utf-8
   colcon build
   ```

## Credits
- [Fast-DDS-python](https://github.com/eProsima/Fast-DDS-python)

# Fast-DDS-Python

FastDDS python bind, 根据官方仓库进行魔改，可以不需要安装任何额外依赖进行编译。

主要功能：

- 支持直接安装到Python库
- 支持 CMake编译 / colcon 编译
- 支持 pip 直接安装
- 提供主流python版本的 `whl` 二进制文件

## 支持的Python版本

```bash
python >= 3.8
```

## 二进制包
直接前往`Release`下载对应python版本的二进制包，下载后运行下面的命令即可
```bash
pip install XXXXXX.whl
```

## 源码编译
支持CMake编译或 colcon 编译。
如果你不知道什么是CMake编译或 colcon 编译，请使用`Developer PowerShell for VS 20XX`打开，出现一个终端，

安装必要的python库

```bash
pip install -U colcon-common-extensions vcstool build
```

使用`cd`命令

```bash
cd [仓库目录]/fastdds_python
```
然后输入

```bash
chcp 65001 # change encode to utf-8
colcon build
```
即可。

## 引用
- [Fast-DDS-python](https://github.com/eProsima/Fast-DDS-python)