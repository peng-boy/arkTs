@Builder
export function NavigationBuilder() {
  MyNavigation();
}


@Entry
@Component
struct MyNavigation {
  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column(){
        Text('路由页')
      }
      .width("100%")
      .height("100%")
      .backgroundColor("#EEEEEE")
    }
    .width("100%")
    .height("100%")
    .title("路由学习", {backgroundColor: Color.Pink})
    .menus(NavigationMenus)
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.pageInfos = ctx.pathStack;
    })
  }
}

/**
 * 两种方式来定义菜单栏
 * 方式一
 * */

let NavigationMenus: Array<NavigationMenuItem> = [
  {
    value: '菜单1',
    icon: $r("app.media.startIcon"),
    action: () => {}
  },
  {
    value: '菜单2',
    icon:  $r("app.media.startIcon"),
    action: () => {}
  },
  {
    value: '菜单3',
    icon:  $r("app.media.startIcon"),
    action: () => {}
  }
]

/**
 * 方式二
 * */
@Builder
function NavigationMenus2() {
  Row() {
    Image($r("app.media.startIcon"))
      .width(24)
      .height(24)
    Image($r("app.media.startIcon"))
      .width(24)
      .height(24)
      .margin({ left: 24 })
    Image($r("app.media.startIcon"))
      .width(24)
      .height(24)
      .margin({ left: 24 })
  }
}