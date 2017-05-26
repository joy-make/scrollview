# scrollview 【解释:http://www.jianshu.com/p/ba3e216f6b93】
三倍宽/高view实现无数张视图的轮播滚动 scrollview复用

通过三倍宽/高实现scrollview的无限复用，什么原理呢？这里是把在view上放三张图，我们需要展示的永远是中间那张view，只是当视图滚动结束时候不断的更换三张view对应数据源（为什么不在滚动的时候切换呢？这个可以自己思考一下）
效果如下

![轮播滚动](http://upload-images.jianshu.io/upload_images/1488115-df0536b31dc07585.gif?imageMogr2/auto-orient/strip)

首先创建一个view（reScrollView）和xib

![xib约束](http://upload-images.jianshu.io/upload_images/1488115-0f5e669b10a6e0ff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```
//三张图的取值，第一张需要注意放数据源的最后一个，为什么呢?因为比如第一张时我们向右滑应该显示哪一张呢,应该最后一张吧
self.leftImageView.image = [UIImage imageNamed:[self.picArray objectAtIndex:self.picArray.count-1]];
self.middleImageVIew.image = [UIImage imageNamed:[self.picArray objectAtIndex:0]];
self.rightImageView.image = [UIImage imageNamed:[self.picArray objectAtIndex:1]];
```

```
#define CURRENT_INDEX scrollView.contentOffset.x/CGRectGetWidth(scrollView.bounds)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

if(CURRENT_INDEX>1)
self.currentPage = self.currentPage == self.picArray.count-1?0:self.currentPage+1;

if(CURRENT_INDEX<1)
self.currentPage = self.currentPage == 0?self.picArray.count-1:self.currentPage-1;

NSInteger leftIndex = self.currentPage == 0?self.picArray.count-1:self.currentPage-1;

NSInteger rightIndex = self.currentPage == self.picArray.count -1?0:self.currentPage+1;
//滚动结束后我们要把偏移量归位
[self setContOffSet];
//并重新配置三张view的资源
self.leftImageView.image = [UIImage imageNamed:self.picArray[leftIndex]];

self.middleImageVIew.image = [UIImage imageNamed:self.picArray[self.currentPage]];

self.rightImageView.image = [UIImage imageNamed:self.picArray[rightIndex]];

self.infoLabel.text = self.infoArray[self.currentPage];
}
```
```
- (void)setContOffSet{

CGFloat contentSetX = CGRectGetWidth(self.scrollView.bounds);

[self.scrollView setContentOffset:CGPointMake(contentSetX, 0) animated:NO];

}
```

调用
```
- (void)setUpView{
self.resuableScroll = [[reScrollView alloc]initWithFrame:CGRectZero andOwner:self];
self.resuableScroll.picArray = @[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",];
self.resuableScroll.infoArray = @[@"今年过年好天气",@"瑞雪兆丰年",@"头可断,血可流,wifi不能断",@"加把劲儿"];
[self.view addSubview:self.resuableScroll];
[self setConstraint];
}
```

