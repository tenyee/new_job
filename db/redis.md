# 第一章 什么是NoSQL

NoSQL全称是not only sql，不仅仅是SQL，是非关系型数据库的泛称

![image-20210721210227681](C:\Users\tenyee\AppData\Roaming\Typora\typora-user-images\image-20210721210227681.png)



数据的结构影响着其存储策略：

* 结构化数据：数据有固定的属性结构，如学生的信息；
* 非结构化数据：没有固定的结构，如文档，图片等
* 半结构化数据：如xml文件，json文件存的信息



# 第二章 Redis入门

​	Redis 是一个开源（BSD许可）的，内存中的数据结构存储系统，它可以用作数据库、缓存和消息中间件。

* Redis是单核单线程的，利用内存记录信息，读写速度超快。为啥不使用多线程？因为多线程时，需要切换线程上下文，耗时更多，所以，直接单线程效率更高。
* 支持持久化
* 主从复制
* 哨兵模式
* 支持事务，注意事务不具备原子性，和Mysql这个ACID不一样
* 支持多种数据结构：字符串、散列、列表、集合、有序集合； [bitmaps](http://www.redis.cn/topics/data-types-intro.html#bitmaps)， [hyperloglogs](http://www.redis.cn/topics/data-types-intro.html#hyperloglogs) 和 [地理空间（geospatial）](http://www.redis.cn/commands/geoadd.html) 索引半径查询



# 第三章 五大数据类型

## 3.1 字符串

```bash
127.0.0.1:6379> set name czw EX 10   # 设置一个key，过期时间10S
OK
127.0.0.1:6379> ttl name  # 查询当前key的剩余时间
(integer) 8
127.0.0.1:6379> ttl name
(integer) 6
127.0.0.1:6379> ttl name
(integer) 6



127.0.0.1:6379> mget name k1   # 获取多个键
1) "abcd"
2) "v1"
127.0.0.1:6379> mset k1 v1 k2 v2 k3 v3  # 同时设置多个值
OK
127.0.0.1:6379> keys *  # 查询当前键
1) "name"
2) "k3"
3) "k2"
4) "k1"
127.0.0.1:6379>

# 切换数据库，默认有16个数据库，从0-15
127.0.0.1:6379> SELECT 1
OK
127.0.0.1:6379[1]> keys *


127.0.0.1:6379> set k1 100
OK
127.0.0.1:6379> get k1
"100"
127.0.0.1:6379> INCR k1   # 加1
(integer) 101
127.0.0.1:6379> INCRBY k1 100  # 加100
(integer) 201

# 查询键是否存在
127.0.0.1:6379> exists k1
(integer) 1
127.0.0.1:6379> exists k2
(integer) 0

# 查询键对应的值类型
127.0.0.1:6379> type k1
string

# 设置键值对有效时间
127.0.0.1:6379> exists k1
(integer) 1
127.0.0.1:6379> exists k2
(integer) 0
127.0.0.1:6379> type k1
string

# 追加值到键的值中
127.0.0.1:6379> APPEND k1 1234
(integer) 9
127.0.0.1:6379> get k1
"value1234"
# 获取子串
127.0.0.1:6379> GETRANGE k1 1 3
"alu"
```





## 3.2 列表

```bash
# 列表  从左到右 下标 0 1 2 3 4,因此从左Push时,最后push进去的是第一个
127.0.0.1:6379> rpush k1 1 2 3 4 5 6
(integer) 6
127.0.0.1:6379> LRANGE k1 0 -1
1) "1"
2) "2"
3) "3"
4) "4"
5) "5"
6) "6"
127.0.0.1:6379> lpush k2 1 2 3 4 5 6
(integer) 6
# 查询列表元素
127.0.0.1:6379> LRANGE k2
(error) ERR wrong number of arguments for 'lrange' command
127.0.0.1:6379> LRANGE k2 0 -1
1) "6"
2) "5"
3) "4"
4) "3"
5) "2"
6) "1"

# 查询长度
127.0.0.1:6379> LLEN k2
(integer) 6

# 弹出元素 LPOP, RPOP

# 阻塞型 BLPOP, BRPOP






```

## 3.3 hash散列

```bash
127.0.0.1:6379> hmset user:1 username czw age 10 phone 15380xxxx
OK
127.0.0.1:6379> keys *
1) "user:1"
127.0.0.1:6379> hget user:1 username
"czw"
127.0.0.1:6379> hgetall user:1
1) "username"
2) "czw"
3) "age"
4) "10"
5) "phone"
6) "15380xxxx"
127.0.0.1:6379> HMGET user:1 username age
1) "czw"
2) "10"
127.0.0.1:6379>
```

可以表示Object数据



## 3.4 集合

```bash
# 添加元素到集合
127.0.0.1:6379> sadd usr1 a b c
(integer) 3
127.0.0.1:6379> SCARD usr1
(integer) 3
# 获取集合元素
127.0.0.1:6379> SMEMBERS usr1
1) "b"
2) "c"
3) "a"
# 查询某个元素是否在集合中
127.0.0.1:6379> SISMEMBER usr1 c
(integer) 1
127.0.0.1:6379> SISMEMBER usr1 d
(integer) 0
127.0.0.1:6379>

# 弹出元素
127.0.0.1:6379> spop deck1 2
1) "3"
2) "2"

# 随机获取一个元素
127.0.0.1:6379> SRANDMEMBER deck
"k7"
```

## 3.5 有序集合

```bash
# 创建有序集合，比集合多一个参数score
127.0.0.1:6379> zadd hackers 1 k1 2 k2 4 k3 2 k4
(integer) 4
127.0.0.1:6379> SMEMBERS hackers
(error) WRONGTYPE Operation against a key holding the wrong kind of value
127.0.0.1:6379> ZRANGE hackers 0 -1
1) "k1"
2) "k2"
3) "k4"
4) "k3"
# 反序取出
127.0.0.1:6379> ZREVRANGE hackers 0 -1
1) "k3"
2) "k4"
3) "k2"
4) "k1"
# 连同score输出
127.0.0.1:6379> ZRANGE hackers 0 -1 withscores
1) "k1"
2) "1"
3) "k2"
4) "2"
5) "k4"
6) "2"
7) "k3"
8) "4"

# 范围打印
127.0.0.1:6379> ZRANGEBYSCORE hackers -inf 2
1) "k1"
2) "k2"
3) "k4"

#  指定范围删除
127.0.0.1:6379> ZREMRANGEBYSCORE hackers 0 2
(integer) 3

```







# 第四章 三种特殊数据类型

## 4.1 BITMAP

```bash
# 位图
127.0.0.1:6379> setbit bmap 0 1
(integer) 0
127.0.0.1:6379> setbit bmap 2 10
(error) ERR bit is not an integer or out of range
127.0.0.1:6379> setbit bmap 2 1
(integer) 0
127.0.0.1:6379> getbit key 2
(integer) 0
127.0.0.1:6379> getbit bmap 2
(integer) 1
127.0.0.1:6379> getbit bmap 1
(integer) 0
127.0.0.1:6379> getbit bmap 0
(integer) 1
## 计算1的个数 
127.0.0.1:6379> BITCOUNT bmap
(integer) 2
127.0.0.1:6379> BITPOS bmap 0
(integer) 1
127.0.0.1:6379> BITPOS bmap 1
(integer) 0
```

## 4.2 地图



# 第五章 事务

* redis的事务是不具备原子性的，为了性能
* 开启事务：MULTI
* 执行事务：EXEC
* 取消事务：DISCARD
* 监牢事务：WATCH



![image-20210722225903060](C:\Users\tenyee\AppData\Roaming\Typora\typora-user-images\image-20210722225903060.png)







# 第六章 Redis.conf详解



# 第七章 Redis持久化



# 第八章 Redis发布订阅



# 第九章 Redis 主从复制



# 第十章 Redis缓存穿透和雪崩

## 10.1 缓存穿透

​	**缓存穿透前提是：Redis和MySQL中都没有，然后不停地直接请求MySQL**

​	解决方案：

* 查不到，缓存空值
* 屏蔽IP
* 参数校验
* 布隆过滤器

 

## 10.2 缓存击穿



![image-20210722230729038](C:\Users\tenyee\AppData\Roaming\Typora\typora-user-images\image-20210722230729038.png)

某个超	qwwKEY突然失效，导致访问请求全打到数据库上，直接把数据库打挂掉。

解决方案：

* 可以直接加长key的失效时间或者直接设置不失效；

* 对数据库增加分布式锁（集群）或互斥锁（单体应用），确保只能有一个线程可以访问数据库，当这个线程访问完后，把key缓存

  到redis中，而其它线程直接等待一段时间后，去访问redis，这是当前最好的解决方案





## 10.3 缓存雪崩

一大批热点KEY同时失效，导致一瞬间，所有请求直接到达数据库，导致数据库挂掉。

解决方案：

* 设置key不失效

* 随机失效时间

* 分布这些热点key到不同的节点上

  