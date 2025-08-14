import { Backlog } from '../pages/ToDoListPage'
import CommonConstants from '../common/constants/CommonConstants';

@Component
export default struct ToDoItem {
  // @Prop item: Backlog;
  public content?:string;
  @State isComplete: boolean = false;

  @Builder labelIcon(icon: Resource) {
    Image(icon).width('20').height('20')
  }

  build() {
    Row() {
      if(this.isComplete) {
        this.labelIcon($r('app.media.ic_default'))
      } else {
        this.labelIcon($r('app.media.ic_ok'))
      }
      Text(this.content)
        .margin({left: 18})
        .opacity(this.isComplete ? CommonConstants.OPACITY_COMPLETED : CommonConstants.OPACITY_DEFAULT)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .margin({top: 10})
    .width('100%')
    .padding(12)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}