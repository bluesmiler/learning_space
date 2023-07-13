------------------------
缓存穿透				|
------------------------
	# 恶意的请求缓存和DB都不存在的数据,因为数据不存在,所以会一直请求DB,如果请求量大可能导致DB宕机
	
	# 简单的解决办法
		* DB没检索到的数据,同样缓存起来(不管是数据不存在,还是系统故障)
		* 缓存的时间不会长,例如:5 分钟
	
	# 采用布隆过滤器
		* 将所有可能存在的数据哈希到一个足够大的bitmap中,一个一定不存在的数据会被 这个bitmap拦截掉
		* 从而避免了对底层存储系统的查询压力
	
------------------------
缓存雪崩				|
------------------------
	# 缓存挂掉,导致全部请求到了DB
	
	# 解决
		事前 redis 高可用,主从+哨兵，redis cluster,避免全盘崩溃。
		事中 本地 ehcache 缓存 + hystrix 限流&降级,避免 DB 宕机
		事后 redis 持久化,一旦重启,自动从磁盘上加载数据,快速恢复缓存数据
	
	
	# 可以使用多级缓存,例如 Ehcache
		* 先查本地 ehcache 缓存,如果没查到再查 redis,如果 ehcache 和 redis 都没有,再查数据库,将数据库中的结果,写入 ehcache 和 redis 中
		
	
	# 使用限流组件,例如,类似于令牌桶算法
		* 数据库绝对不会死,限流组件确保了每秒只有多少个请求能通过
		* 只要数据库不,就是说,对用户来说,2/5 的请求都是可以被处理的
		* 只要有 2/5 的请求可以被处理,就意味着你的系统没死,对用户来说,可能就是点击几次刷不出来页面,但是多点几次,就可以刷出来一次
	