//PageOne.ets
@Builder
export function BasicsBuilder(name: string, param: string) {
  Basics({ name: name, value: param });
}

@Entry
@Component
export struct Basics {
  pathInfos: NavPathStack = new NavPathStack();
  name: string = '';
  public name1:string = ''
  protected name2:string = ''
  private name3:string = ''
  @State value: string = '';

  build() {
    NavDestination() {
      Column() {
        Text(`${this.name}页面`)
        Button('返回').onClick((event: ClickEvent) => {
          this.getUIContext().getRouter().back()
        })
      }
      .size({ width: '100%', height: '100%' })
      Column(){
        Text('内容~~~~')
      }
    }.title(`${this.name}`)
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.pathInfos = ctx.pathStack;
    })
  }
}

/**
 * 修饰符有哪些
 * @State装饰器：组件内状态；@State userInfo: type = new UserInfo('张三', 18, '男')
 * @Prop装饰器：父子单向同步
 * @Link装饰器：父子双向同步
 * @Provide装饰器和@Consume装饰器：与后代组件双向同步
 * @Observed装饰器和@ObjectLink装饰器：嵌套类对象属性变化
 * */
@Component struct BasicsState {

  build() {
    NavDestination() {
      Column() {
        Text('基础页面')
      }
    }.width('100%').height('100%')
  }
}