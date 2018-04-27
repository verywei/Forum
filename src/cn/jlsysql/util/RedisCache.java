package cn.jlsysql.util;

import java.io.Serializable;
import java.util.concurrent.Callable;

import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.lang.Nullable;

public class RedisCache implements Cache {

    private RedisTemplate<String, Object> redisTemplate;
    private String name;

    @Override
    public void clear() {

        redisTemplate.execute(new RedisCallback<String>() {
            @Override
            public String doInRedis(RedisConnection connection) throws DataAccessException {
                connection.flushDb();
                return "ok";
            }
        });
    }

    @Override
    public void evict(Object key) {
        final String keyf=key.toString();
        redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                return connection.del(keyf.getBytes());
            }

        });

    }

    @Override
    public ValueWrapper get(Object key) {

        final String keyf = key.toString();
        Object object = null;
        object = redisTemplate.execute(new RedisCallback<Object>() {
            @Override
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                byte[] key = keyf.getBytes();
                byte[] value = connection.get(key);
                if (value == null) {

                    return null;
                }
                return SerializationUtils.deserialize(value);
            }
        });
        ValueWrapper obj=(object != null ? new SimpleValueWrapper(object) : null);

        return  obj;
    }

    @Override
    public void put(Object key, Object value) {

        final String keyString = key.toString();
        final Object valuef = value;
        final long liveTime = 50;
        redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
                byte[] keyb = keyString.getBytes();
                byte[] valueb = SerializationUtils.serialize((Serializable) valuef);
                connection.set(keyb,valueb);
                if (liveTime > 0) {
                    connection.expire(keyb, liveTime);
                }
                return 1L;
            }
        });

    }

    @Override
    public <T> T get(Object arg0, Class<T> arg1) {
        // TODO Auto-generated method stub
        return null;
    }

    @Nullable
    @Override
    public <T> T get(Object o, Callable<T> callable) {
        return null;
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public Object getNativeCache() {
        return this.redisTemplate;
    }

    @Override
    public ValueWrapper putIfAbsent(Object arg0, Object arg1) {
        // TODO Auto-generated method stub
        return null;
    }

    public RedisTemplate<String, Object> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setName(String name) {
        this.name = name;
    }
}