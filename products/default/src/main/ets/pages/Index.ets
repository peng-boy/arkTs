class RouterItem {
  desc: string
  path: string
  title: string
  constructor(title: string, path: string,desc:string,) {
    this.title = title
    this.desc = desc
    this.path = path
  }
}


@Entry
@Component
struct Index {
  pageInfos: NavPathStack = new NavPathStack()

  @State RouterContent: RouterItem[] = [
    new RouterItem('基础', 'Basics','基础的变量声明和修饰符'),
    new RouterItem('路由', 'Navigation','路由的使用'),
    new RouterItem('Hsp', 'HspView','公共module的使用，type为shared'),
    new RouterItem('HAR', 'MyHAR','例如：一个UI组件库，可以称为HAR'),
    new RouterItem('媒体查询', 'Media','媒体查询，视口判断，工具封装')
  ]

  @Builder
  ViewItem(param: RouterItem){
    Column({space: 10}) {
      Text(param.title)
        .fontColor(Color.Black)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text(param.desc)
        .fontColor('#ccc')
        .fontSize(12)
    }
    .onClick(() => {
      this.pageInfos.pushPathByName(param.path, param.desc)
      // this.getUIContext().getRouter().pushUrl({url: 'views/' + param.path})
    })
    .borderRadius(15)
    .shadow({ radius: 100, color: '#ededed' })
    .width('90%')
    .padding({ left: 15, top: 15, bottom: 15 })
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space:18}) {
        ForEach(this.RouterContent, (item:RouterItem) => {
          this.ViewItem(item)
        }, (item:RouterItem) => item.path)
      }
    }
    .width('100%')
    .height('100%')
    .title($r('app.string.entry_index_title'))
  }
}