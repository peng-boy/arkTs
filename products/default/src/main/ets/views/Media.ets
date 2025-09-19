import {MediaQueryExample} from '../components/media/Basic'

@Builder
export function MediaBuilder() {
  Media()
}

@Component
struct Media {
  pathInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column({space: 10}){
        // 基础的横屏 竖屏手动切换显示
        MediaQueryExample()
      }
      .width('100%')
      .height('100%')
    }
    .title(`媒体查询`)
    .onReady((ctx: NavDestinationContext) => {
      this.pathInfos = ctx.pathStack;
    })
  }
}