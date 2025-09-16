import {add} from 'common'
import { MainPage } from 'homelibrary'

interface RouteItemContent {
  title: string
  desc: string
  path: string
}

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

  @State RouterContent: RouteItemContent[] = [
    new RouterItem('基础', 'Basics','基础的变量声明和修饰符'),
    new RouterItem('路由', 'Navgation','路由的使用'),
    new RouterItem('Hsp公共包的使用', 'HspView','公共module的使用，type为shared')
  ]

  @Builder
  ViewItem(param: RouteItemContent){
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
      console.log('hh',param.desc, param.path);
      add(1,2)
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
      MainPage()
      Column({space:18}) {
        ForEach(this.RouterContent, (item:RouteItemContent) => {
          this.ViewItem(item)
        }, (item:RouteItemContent) => item.path)
      }
    }
    .width('100%')
    .height('100%')
    .title($r('app.string.entry_index_title'))
  }
}