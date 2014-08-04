#layoutSubviews的调用时机（转）

- time: 2012-06-04 13:59
- tags: iOS

---

layoutSubviews何时调用的问题，这个方法是当你需要在调整subview的大小的时候需要重写（我这个翻译不严谨，以下是原文：You should override this method only if the autoresizing behaviors of the subviews do not offer the behavior you want.），但有时候经常指望它被调用的时候没被调用，不希望它被调用的时候被调用了，搞的很上火。根据国外社区一个人帖子，做了总结性翻译。

        layoutSubviews在以下情况下会被调用：

        1、init初始化不会触发layoutSubviews
        2、addSubview会触发layoutSubviews
        3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
        4、滚动一个UIScrollView会触发layoutSubviews
        5、旋转Screen会触发父UIView上的layoutSubviews事件
        6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
        自：http://www.52rd.com/Blog/Detail_RD.Blog_howean_29991.html