## 配置文件：
```
default.custom.yaml
luna_pinyin.custom.yaml
installation.yaml
```

### luna_pinyin.custom.yaml 修改词库
```yaml
#luna_pinyin.custom.yaml
patch:
  translator/dictionary: luna_pinyin.extended
```

## 词典文件
下面的是词典，其中以`luna_pinyin.extended.dict.yaml` 为首，它来调用剩下三个dict

```yaml
luna_pinyin.extended.dict.yaml
luna_pinyin.cn_en.dict.yaml
luna_pinyin.hanyu.dict.yaml
luna_pinyin.poetry.dict.yaml
```

## 只输声母，不会弹出
不要添加
```yaml
luna_pinyin.cn_en.dict.yaml
```

