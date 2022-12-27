
## 效果图
![效果图](assets/%E6%95%88%E6%9E%9C%E5%9B%BE.gif)



## 使用方式

可以通过pod导入，也可以下载demo后把LYSafeKeyboard文件夹导入。

```
pod 'LYWaterFlowLayout', '~> 0.0.2'
```

```
如果pod repo update后还pod search不到，可以运行如下命令清下缓存后应该就可以了。
rm ~/Library/Caches/CocoaPods/search_index.json
```

```
在使用的控制器中，
    
遵守代理<UICollectionViewDelegate, UICollectionViewDataSource,LYWaterFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datas;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self configData];
    [self creatUI];
    
    
}

-(void)configData{
    
    // 瀑布流假数据
    self.datas = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        LYItemModel *itemModel = [[LYItemModel alloc] init];
        itemModel.title = [NSString stringWithFormat:@"测试标题%d", i];
        itemModel.itemSizeScale = i%3 + 0.5; // item比例
        [self.datas addObject:itemModel];
    }

}

-(void)creatUI{
    
    LYWaterFlowLayout *layout = [[LYWaterFlowLayout alloc] init];
    layout.columnMargin = 10;
    layout.rowMargin = 10;
    layout.columnCount = 3;
    layout.endgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.degelate = self;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[LYCollectionViewCell class] forCellWithReuseIdentifier:cellIndentifier];
    [self.view addSubview:self.collectionView];


}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    LYItemModel *itemModel = self.datas[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    cell.titleLable.text = itemModel.title;
    return cell;
}
-(CGFloat)Flow:(LYWaterFlowLayout *)Flow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{
    // width是根据列数和列间距计算好的item宽度，可以再根据item的比例来计算高度
    LYItemModel *itemModel = self.datas[indexPath.row];
    return width*itemModel.itemSizeScale;
}


```

<hr>

##### 如对您有帮助，还请star一下。



