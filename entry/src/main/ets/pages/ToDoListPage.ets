import ToDoItem from '../view/TODOItem'
import DataModel from '../viewmodel/DataModel';

export class Backlog {
  id: string;
  title: string;
  accomplish: boolean;
  constructor(id: string, title: string, accomplish: boolean) {
    this.id = id;
    this.title = title;
    this.accomplish = accomplish;
  }
}

@Entry
@Component
struct Index {
  private totalTasks:Array<Resource> = [];

  // 请求数据
  aboutToAppear(): void {
    this.totalTasks = DataModel.getData()
  }

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize(36)
        .fontWeight(800)
        .textAlign(TextAlign.Start)
        .width('100%')
      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({content: item})
      }, (item: Backlog) => item.id)
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F1F4')
  }
}