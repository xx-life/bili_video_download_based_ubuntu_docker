# 本项目介绍

> 本项目方便用户在linux环境下建立下载任务将bilibili的视频定时定期选定av号下载到自己的目录，当然接着可以用私有云或者linux进行查看管理。


# 脚本来源
- https://github.com/Henryhaohao/Bilibili_video_download

# Docker 使用
> 下面是我已经构建好的，如果自己想构建一次，那么就使用 `docker build -t <your-image-name> .` 即可

```bash 
docker run -it --rm -e BILI_AV_NUM=92340960 -v $(pwd)/bilibili_video:/data/bilibili_video \
	registry.cn-shanghai.aliyuncs.com/xxzhang/bili_vedio_download:v1 \
	python3 download_bili_video.py 

```
# 备注
> 当前下载的是 720p 如果想下载其他的p 自己修改下脚本的`quality`即可，如果不满意自己可以放在环境变量中，这里就不优化了。


## nginx 目录浏览功能
> 就是在需要映射的路由下面添加下面几行代码; 如果不是root权限，需要chmod -R 使得目录具有nginx用户权限访问，这里就不赘述了，主要是记录下笔记。下面几行代码。

```
location / {
           root /data ;
           autoindex on;
           autoindex_localtime on;
           autoindex_exact_size off;
        }
```

