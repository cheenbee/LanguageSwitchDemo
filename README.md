# APP内自行切换语言 (两种方式)
#### 一、使用Plist单独构建语言体系
1. 新建支持语言对应的 plist 文件,建议以语言名称作文件名,方面加载对应的语言资源
2. plist 文件中使用字典键值对来存储对应语言,多个plist文件中使用统一的"键(key)"
3. 根据统一的"键(key)"来取对应的plist中存储的语言"值(value)"
4. 使用一个工具类管理多语言切换
5. demo已上传至[github](https://github.com/cheenbee/LanguageSwitchDemo),请参考

#### 二、运行时拦截系统国际化方法
后来看到一篇文章通过runtime来拦截国际化方法，将Bundle替换为自定义CLBundle,也可实现APP内多语言切换,此法更佳.
[iOS开发之APP内部切换语言](https://www.jianshu.com/p/5ee17137746b)


