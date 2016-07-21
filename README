### 学习GO目的写的，动态域名更新

### 编译安装

```
$ go build src/ddns.go
$ sudo mkdir /opt/ddns
$ sudo cp ddns /opt/ddns/
$ sudo cp ddns.init.sh /etc/init.d/ddns
$ cp config.json.default config.json
```
编辑 `config.json`：
```
{

    "targetDomains": ["your_sub_domain1", "your_sub_domain2"],
    "dnspodEmail":  "your_dnspod_login_name",
    "dnspodPasswd": "your_dnspod_login_passwd"
}

```
然后：
```
$ sudo cp config.json /opt/ddns/
```

#### 启动服务
```
$ sudo update-rc.d ddns defaults
```
