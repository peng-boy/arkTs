import { MainPage } from 'homelibrary'

@Builder
export function MyHARBuilder(name: string, param: string) {
  MyHAR({ name: name, value: param });
}

@Component
struct MyHAR {
  pathInfos: NavPathStack = new NavPathStack();
  @State name:string = ''
  @State value: string = ''

  build() {
    NavDestination() {
      Column(){
        MainPage()
      }
      .width('100%')
      .height('100%')
    }
    .title(`${this.name}`)
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.pathInfos = ctx.pathStack;
    })
  }
}