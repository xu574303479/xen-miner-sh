# 地址
# 0x1cCF82683733c201e3D4d8cF7359c77aa55669Bd
# 环境配置
sudo apt update
sleep 5
sudo apt install ocl-icd-opencl-dev -y
sleep 10
sudo apt-get install build-essential
sleep 3
sudo apt install cmake -y
sleep 5
sudo apt install python3-pip -y
sleep 5
cd /home
sleep 1
mkdir block
sleep 1
cd block
sleep 1

# 下载代码
git clone https://github.com/shanhaicoder/XENGPUMiner.git
sleep 5
# 进入文件夹
cd XENGPUMiner
sleep 1
# 替换地址
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0x1cCF82683733c201e3D4d8cF7359c77aa55669Bd/g' config.conf

# 授权
chmod +x build.sh
sleep 1
# 初始化挖矿代码-设置显卡计算能力
# A4000 A5000 A6000 3090
echo "run ./build.sh -cuda_arch sm_86"
./build.sh -cuda_arch sm_86
sleep 30

# 初始化
pip install -U -r requirements.txt
sleep 5

# 后台运行 miner
echo "run sudo nohup python3 miner.py --gpu=true > block.log 2>&1 &"
sudo nohup python3 miner.py --gpu=true > block.log 2>&1 &
sleep 3

# 查看进程
sudo ps -aux|grep python3
sleep 1

# 列出所有支持设备
./xengpuminer -l -m cuda
sleep 1

# 多设备挖矿
echo "run sudo nohup ./xengpuminer -d 0 > xen-log1.log 2>&1 &"
sudo nohup ./xengpuminer -d 0 > xen-log1.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 1 > xen-log2.log 2>&1 &"
sudo nohup ./xengpuminer -d 1 > xen-log2.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 2 > xen-log3.log 2>&1 &"
sudo nohup ./xengpuminer -d 2 > xen-log3.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 3 > xen-log4.log 2>&1 &"
sudo nohup ./xengpuminer -d 3 > xen-log4.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 4 > xen-log5.log 2>&1 &"
sudo nohup ./xengpuminer -d 4 > xen-log5.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 5 > xen-log6.log 2>&1 &"
sudo nohup ./xengpuminer -d 5 > xen-log6.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 6 > xen-log7.log 2>&1 &"
sudo nohup ./xengpuminer -d 6 > xen-log7.log 2>&1 &
sleep 3
echo "run sudo nohup ./xengpuminer -d 7 > xen-log8.log 2>&1 &"
sudo nohup ./xengpuminer -d 7 > xen-log8.log 2>&1 &
sleep 3

# 查看进程
ps -aux|grep xengpuminer
sleep 1
