Aria2 AriaNg Nginx in Docker


```
sudo docker run -d \
    --name aria2_ng \
    -p 6800:6800 \
    -e ARIA2_TOKEN=xxxxxxxx \
    mpco/ariang
```