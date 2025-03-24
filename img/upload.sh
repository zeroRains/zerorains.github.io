# 411a537a16ea3420d8b1e01e77dbc139 
#!/bin/bash

# 基础配置信息
# gitee仓库地址
base_url="https://gitee.com/zeroRains/drawing-bed/raw/master/"
# 本地gitee仓库路径
local_path="/run/media/zerorains/Data/tempMarkdown/drawing-bed/"
# typora保存图片路径
typora_path="/run/media/zerorains/Data/tempMarkdown/drawing-bed/"


# 拷贝文件到对应文件夹，大文件要进行压缩
# 同时生成对应的url
echo "Upload Success:"
for i in "$@"; do
	IFS='/' read -r -a array <<< "$i"
	id="${#array[@]}"
	file_name="$(date "+%Y%m%d%H%M%S")${array[$id-1]}"
	cp $i $local_path"$file_name"
	rm $i
	echo "$base_url""$file_name"
done

# 上传git
cd $local_path;git add *;
cd $local_path;git commit -m "upload images";
cd $local_path;git push -f origin master;